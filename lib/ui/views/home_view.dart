import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';
import 'package:stockscreener_app/ui/widgets/stock_tile.dart'; // Ensure this file contains the StockTile widget definition

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stock Screener"),
        actions: [
          IconButton(
            icon: Icon(
              viewModel.isFilteringFavorites ? Icons.star : Icons.star_border,
              color: viewModel.isFilteringFavorites ? Colors.amber : null,
            ),
            onPressed: viewModel.toggleFavoriteFilter,
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: viewModel.loadStocks,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: viewModel.updateSearchQuery,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search by name or symbol',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: viewModel.isBusy
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: viewModel.stocks.length,
                    itemBuilder: (context, index) {
                      final stock = viewModel.stocks[index];
                      return StockTile(
                        stock: stock,
                        onFavoriteToggle: () => viewModel.toggleFavorite(index),
                      );
                    },
                  ),
          )
        ],
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
