import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:stockscreener_app/models/stock.dart';

class StockService {
  Future<List<Stock>> loadStocks() async {
    final String response = await rootBundle.loadString('assets/stocks.json');
    final data = json.decode(response);
    final List<dynamic> stocksJson = data['stocks'];
    return stocksJson.map((json) => Stock.fromJson(json)).toList();
  }
}
