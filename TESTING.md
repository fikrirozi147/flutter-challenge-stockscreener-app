# 🧪 Manual Testing Report — Stock Screener Flutter App (Stok.)

This document outlines the manual testing approach used to validate core functionalities of **Stok.**, the Stock Screener Flutter application.

---

## ✅ Manual Testing Scope

| Feature                                             | Tested?     | Status      |
|-----------------------------------------------------|-------------|-------------|
| Stock list displays correctly                       | *Tested✅* | **Working** |
| Pull-to-refresh reloads data                        | *Tested✅* | **Working** |
| Favorites can be toggled                            | *Tested✅* | **Working** |
| Favorite filter shows only starred stocks           | *Tested✅* | **Working** |
| Search filters by company name or symbol            | *Tested✅* | **Working** |
| Persistent favorites across restarts using Hive     | *Tested✅* | **Working** |
| App launches correctly from splash screen           | *Tested✅* | **Working** |
| App icon and title appear correctly                 | *Tested✅* | **Working** |
| No unexpected UI crashes during navigation          | *Tested✅* | **Stable**  |
| Light theme and Material 3 styling                  | *Tested✅* | **Correct** |
| Empty state text when search returns no match       | *Tested✅* | **Correct** |
| Animated splash video ends and transitions safely   | *Tested✅* | **Smooth**  |
| Favorite toggle is styled with outlined icon circle | *Tested✅* | **Correct** |
| Startup animation completes before loading home     | *Tested✅* | **Verified**|

---

## 🧭 Manual Testing Steps

### Home Screen
- Open app and observe list of stocks with logo, name, price, and change.
- Tap ⭐ on a stock → confirm favorite state updates.
- Pull-to-refresh → stock list reloads, favorite state remains.

### Favorite Filter
- Tap the outlined ⭐ icon in the app bar.
- Verify that only starred stocks are visible.
- Tap again to toggle back to all stocks.

### Search
- Type part of a company name or symbol (e.g., “App” or “TSLA”).
- Confirm matching results appear live.
- Clear input to show full list again.

### Persistence Check
- Favorite several stocks.
- Kill the app completely.
- Reopen the app → verify favorites are still selected.

### Splash Animation
- Cold launch the app.
- Confirm splash video plays, then transitions to HomeView.
- Ensure no UI or transition lag.

---

## 🧪 Testing Environment

| Platform     | Details                             |
|--------------|-------------------------------------|
| Device       | Vivo V21 5G (V2050) (android-arm64) |
| Hive Version | 2.2.3                               |
| OS           | Android v13 (Funtouch OS)           |
| Processor    | 2.4 GHz Octa-core                   |

---

## 🔍 Notes

- App tested with both light and dark device themes.
- All manual tests passed without runtime exceptions or crashes.
- No known issues as of final testing.

---

## ✅ Future Enhancements

- Add unit tests for critical functionalities using `flutter_test` and `mockito`.
- Add widget & integration tests using `flutter_test` and `mockito`.
- Automate persistence and state validation via integration test suite.

---

