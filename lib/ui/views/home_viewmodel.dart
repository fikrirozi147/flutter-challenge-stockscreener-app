import 'package:stacked/stacked.dart';
import 'package:stockscreener_app/models/stock.dart';
import 'package:stockscreener_app/services/stock_service.dart';

class HomeViewModel extends BaseViewModel {
  final _stockService = StockService();

  List<Stock> _allStocks = [];
  String _searchQuery = '';
  bool _showFavoritesOnly = false;

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
    setBusy(true);
    _allStocks = await _stockService.loadStocks();
    setBusy(false);
    notifyListeners();
  }

  void toggleFavorite(int index) {
    final stock = stocks[index];
    final idx = _allStocks.indexWhere((s) => s.id == stock.id);
    _allStocks[idx].isFavorite = !_allStocks[idx].isFavorite;
    notifyListeners();
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
