import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stockscreener_app/ui/widgets/stock_tile.dart';
import 'package:stockscreener_app/ui/views/home_viewmodel.dart'; // We'll reuse the HomeViewModel here

class FavoriteView extends StackedView<HomeViewModel> {
  const FavoriteView({super.key});

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    final favorites = viewModel.stocks
        .where((stock) => stock.isFavorite)
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: favorites.isEmpty
          ? const Center(
              child: Text(
                'No favorite stocks yet!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final stock = favorites[index];
                return StockTile(
                  stock: stock,
                  onFavoriteToggle: () => viewModel.toggleFavorite(index),
                );
              },
            ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.loadStocks();
  }
}
