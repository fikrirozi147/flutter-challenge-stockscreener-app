import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart'; // Add this import for StackedLocator

final locator = StackedLocator.instance;

void setupLocator() {
  // Register any services here, if needed
  // locator.registerLazySingleton(() => StockService());
}
