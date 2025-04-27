import 'package:flutter/material.dart';
import 'app/app.locator.dart';
import 'ui/views/home_view.dart';

void main() {
  setupLocator(); // Initializes Stacked services
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Screener',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const HomeView(),
    );
  }
}
