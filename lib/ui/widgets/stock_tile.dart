import 'package:flutter/material.dart';
import 'package:stockscreener_app/models/stock.dart';

class StockTile extends StatelessWidget {
  final Stock stock;
  final VoidCallback onFavoriteToggle;

  const StockTile({
    super.key,
    required this.stock,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: stock.stockPrice.priceChange >= 0
          ? Colors.green[50]
          : Colors.red[50],
      leading: CircleAvatar(backgroundImage: NetworkImage(stock.logoUrl)),
      title: Text(stock.name),
      subtitle: Text(stock.symbol),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("\$${stock.stockPrice.currentPrice.amount}"),
              Text(
                "${stock.stockPrice.priceChange >= 0 ? '+' : ''}${stock.stockPrice.priceChange.toStringAsFixed(2)}",
                style: TextStyle(
                  color: stock.stockPrice.priceChange >= 0
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              stock.isFavorite ? Icons.star : Icons.star_border,
              color: stock.isFavorite ? Colors.amber : Colors.grey,
            ),
            onPressed: onFavoriteToggle,
          ),
        ],
      ),
    );
  }
}
