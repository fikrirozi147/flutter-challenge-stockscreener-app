import 'package:flutter/material.dart';
import 'package:stockscreener_app/models/stock.dart';

// StockTile widget represents a single stock item in the list
// It shows the company logo, name, symbol, price, price change, and favorite star button
class StockTile extends StatelessWidget {
  final Stock stock; // The Stock model to display
  final VoidCallback
  onFavoriteToggle; // Function to call when user toggles favorite

  const StockTile({
    super.key,
    required this.stock,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // Card gives a nice Material design look with elevation and rounded corners
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: ListTile(
        // ListTile is the base structure inside each Card
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        tileColor: stock.stockPrice.priceChange >= 0
            ? Colors.green[50] // Light green background if stock went up
            : Colors.red[50], // Light red background if stock went down
        leading: CircleAvatar(
          backgroundImage: NetworkImage(stock.logoUrl),
          radius: 24, // Make the logo slightly bigger
        ),
        title: Text(
          stock.name, // Company name
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        subtitle: Text(
          stock.symbol, // Company stock symbol
          style: const TextStyle(fontFamily: 'Montserrat', fontSize: 12),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Display stock current price and price change
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "\$${stock.stockPrice.currentPrice.amount}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "${stock.stockPrice.priceChange >= 0 ? '+' : ''}${stock.stockPrice.priceChange.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: stock.stockPrice.priceChange >= 0
                        ? Colors
                              .green // Green color if price went up
                        : Colors.red, // Red color if price went down
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8),

            // Add animated favorite star button
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300), // Animation duration
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation, // Scale (grow/shrink) animation
                child: child,
              ),
              child: IconButton(
                key: ValueKey<bool>(
                  stock.isFavorite,
                ), // Unique key to trigger animation on change
                icon: Icon(
                  stock.isFavorite
                      ? Icons.star
                      : Icons.star_border, // Filled or empty star
                  color: stock.isFavorite
                      ? Colors.black
                      : Colors.grey, // Yellow if favorite
                ),
                onPressed:
                    onFavoriteToggle, // Calls the function to toggle favorite
              ),
            ),
          ],
        ),
      ),
    );
  }
}
