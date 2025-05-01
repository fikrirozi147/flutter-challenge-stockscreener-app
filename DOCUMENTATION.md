# 📄 Documentation: Stock Screener Flutter App

This document provides a technical overview of the **Stock Screener Flutter app** or **Stok. app**, built as part of a Junior Flutter Developer technical assessment.

---

## 📦 Project Overview

This app is named "Stok." and it displays a list of popular stocks with their current prices, allows users to mark favorites, and filter or search stocks dynamically. It includes a minimalist theme UI design, persistent local state using Hive, and structured MVVM architecture using the `Stacked` package.

---

## 🧱 Architecture

### MVVM Pattern via `Stacked` state management

The project uses the **Model-View-ViewModel (MVVM)** architecture powered by the `Stacked` package to cleanly separate UI and logic.


1) **Model** - Represents stock data (e.g. `Stock`) 
2) **ViewModel** - Contains business logic and state (e.g. `HomeViewModel`) 
3) **View** - UI layer (`HomeView`, `StartupView`) 
4) **Service** - Loads and provides stock data (e.g. `StockService`) 

---

## 🗂️ Folder Structure

- **lib/app/app.dart** # StackedApp routing and locator setup 
- **lib/models/stock.dart** # Stock model with JSON serialization 
- **lib/services/stock_service.dart** # Loads stock data (from local JSON) 
- **lib/ui/views/home_view.dart │ home_viewmodel.dart │ startup_view.dart** # UI of home screen, business logic and state, Startup screen UI
- **lib/ui/widgets/stock_tile.dart** # Reusable UI widget for displaying a stock 
- **assets/videos/Stok-startup.mp4** # Custom animated splash video

---

## 🧠 State Management

- `stacked` package (MVVM)
- `BaseViewModel` used for loading state and business logic
- `notifyListeners()` drives UI rebuilds

---

## 💾 Persistence

### Hive (local storage)

- Used to persist favorite stocks locally
- Box: `'favorites'`, storing a `List<String>` of stock IDs
- Re-saved as strings to avoid type mismatch
- Favorites restored on app launch and after refresh

---

## 🧪 Testing

- [Manual Testing Report](TESTING.md)


---

## 🎨 UI/UX Features

**✅ Splash video** - Animated intro using video_player
**✅ List UI** - Scrollable stock cards with price and change
**✅ Favorites** - Mark with ⭐️ and filter easily
**✅ Search** - Filters by name or symbol
**✅ Pull-to-refresh** - Refresh stock data manually
**✅ Material 3** - Modern design, Montserrat font

---

## 🚀 Future Enhancements

1) Integrate live stock API (e.g. Alpha Vantage, Finnhub Stock API)

2) WebSocket support for real-time price updates

3) Firebase auth + cloud sync of favorites

4) Widget & integration tests

---

## 🧰 Tools & Libraries

1) `flutter` - Core SDK 
2) `stacked` - MVVM architecture 
3) `hive` / `hive_flutter` - Local data persistence 
4) `video_player` - Splash screen animation 
5) `build_runner` - Code generation (e.g. JSON, Hive) 

---

## 🛠️ Setup Instructions

*bash*

flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run

# Make sure to add:

*yaml*

assets:
  - assets/stocks.json
  - assets/videos/Stok-startup.mp4

---

## 📞 Contact

Developed by: MUHAMMAD FIKRI BIN M.ROZI
GitHub: [fikrirozi147](https://github.com/fikrirozi147)
Email: [muhdfikrimrozi@gmail.com]