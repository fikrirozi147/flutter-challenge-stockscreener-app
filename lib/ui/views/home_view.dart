import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';
import 'package:stockscreener_app/ui/widgets/stock_tile.dart'; // Ensure this file contains the StockTile widget definition
import 'package:stockscreener_app/app/app.locator.dart'; // Import the file where the locator is defined

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stock Screener"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: InkWell(
              borderRadius: BorderRadius.circular(32),
              onTap: viewModel.toggleFavoriteFilter,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: viewModel.isFilteringFavorites
                        ? Colors.black
                        : Colors.grey,
                    width: 2,
                  ),
                ),
                child: Icon(
                  viewModel.isFilteringFavorites
                      ? Icons.star
                      : Icons.star_border,
                  color: viewModel.isFilteringFavorites
                      ? Colors.black
                      : Colors.black,
                ),
              ),
            ),
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
              ),
            ),
          ),
          Expanded(
            child: viewModel.isBusy
                ? const Center(child: CircularProgressIndicator())
                : RefreshIndicator(
                    onRefresh: viewModel.loadStocks,
                    child: viewModel.stocks.isEmpty
                        ? Center(
                            child: Text(
                              viewModel.isFilteringFavorites
                                  ? 'No favorite stocks found.'
                                  : 'No stocks found.\nTry a different search!',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: viewModel.stocks.length,
                            itemBuilder: (context, index) {
                              final stock = viewModel.stocks[index];
                              return StockTile(
                                stock: stock,
                                onFavoriteToggle: () =>
                                    viewModel.toggleFavorite(index),
                              );
                            },
                          ),
                  ),
          ),
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) =>
      locator<HomeViewModel>();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.loadStocks();
  }
}
