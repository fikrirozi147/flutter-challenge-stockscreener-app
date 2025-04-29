import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stockscreener_app/services/stock_service.dart';
import 'package:stockscreener_app/ui/views/home_viewmodel.dart'; // Import HomeViewModel
import 'package:stockscreener_app/ui/views/home_view.dart'; // Import HomeView


@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    // MaterialRoute(page: FavoriteView),
  ],
  dependencies: [
    LazySingleton(classType: StockService),
    LazySingleton(classType: HomeViewModel),
  ],
)
class AppSetup {}
