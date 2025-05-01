import 'package:stacked/stacked.dart';
import 'package:stockscreener_app/models/stock.dart';
import 'package:stockscreener_app/services/stock_service.dart';
import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends BaseViewModel {
  final _stockService = StockService();

  List<Stock> _allStocks = [];
  String _searchQuery = '';
  bool _showFavoritesOnly = false;
  late Box<List> _favoritesBox;

  List<Stock> get stocks {
    var filtered = _allStocks;

    if (_showFavoritesOnly) {
      filtered = filtered.where((s) => s.isFavorite).toList();
    }

    if (_searchQuery.isNotEmpty) {
      filtered = filtered
          .where(
            (s) =>
                s.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                s.symbol.toLowerCase().contains(_searchQuery.toLowerCase()),
          )
          .toList();
    }

    return filtered;
  }

  Future<void> loadStocks() async {
    try {
      setBusy(true);
      debugPrint('🔄 Loading stocks...');

      // Open Hive box
      _favoritesBox = Hive.box<List>('favorites');

      // Get saved favorites and ensure they're all Strings
      final raw = _favoritesBox.get('stock_ids');
      final savedFavoriteIds = (raw != null && raw is List)
          ? raw.cast<dynamic>().map((e) => e.toString()).toSet()
          : <String>{};

      debugPrint('📦 Favorite IDs (cleaned): $savedFavoriteIds');

      // Optional: clean and re-save for consistency
      _favoritesBox.put('stock_ids', savedFavoriteIds.toList());

      // Load stocks from service
      _allStocks = await _stockService.loadStocks();
      debugPrint('📈 Loaded ${_allStocks.length} stocks from service');

      // Apply favorite status
      for (var stock in _allStocks) {
        stock.isFavorite = savedFavoriteIds.contains(stock.id.toString());
      }

      setBusy(false);
      Future.microtask(() => notifyListeners());
    } catch (e, stack) {
      debugPrint("❌ loadStocks() failed: $e");
      debugPrintStack(stackTrace: stack);
      setBusy(false);
      notifyListeners();
    }
  }

  void toggleFavorite(int index) {
    final stock = stocks[index];
    final idx = _allStocks.indexWhere((s) => s.id == stock.id);
    _allStocks[idx].isFavorite = !_allStocks[idx].isFavorite;

    _saveFavoritesToHive();
    notifyListeners();
  }

  void toggleFavoriteByIndex(int index) {
    _allStocks[index].isFavorite = !_allStocks[index].isFavorite;

    _saveFavoritesToHive();
    notifyListeners();
  }

  void _saveFavoritesToHive() {
    final favoriteIds = _allStocks
        .where((s) => s.isFavorite)
        .map((s) => s.id.toString()) // ✅ store as strings
        .toList();

    _favoritesBox.put('stock_ids', favoriteIds);
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void toggleFavoriteFilter() {
    _showFavoritesOnly = !_showFavoritesOnly;
    notifyListeners();
  }

  bool get isFilteringFavorites => _showFavoritesOnly;
}
