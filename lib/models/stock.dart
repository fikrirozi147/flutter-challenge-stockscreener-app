import 'package:json_annotation/json_annotation.dart';

part 'stock.g.dart';

@JsonSerializable()
class Stock {
  final int id;
  final String symbol;
  final String name;
  @JsonKey(name: 'logo_url')
  final String logoUrl;
  @JsonKey(name: 'stock_price')
  final StockPrice stockPrice;
  bool isFavorite;

  Stock({
    required this.id,
    required this.symbol,
    required this.name,
    required this.logoUrl,
    required this.stockPrice,
    this.isFavorite = false,
  });

  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);
  Map<String, dynamic> toJson() => _$StockToJson(this);
}

@JsonSerializable()
class StockPrice {
  @JsonKey(name: 'current_price')
  final Price currentPrice;
  @JsonKey(name: 'price_change')
  final double priceChange;
  @JsonKey(name: 'percentage_change')
  final double percentageChange;

  StockPrice({
    required this.currentPrice,
    required this.priceChange,
    required this.percentageChange,
  });

  factory StockPrice.fromJson(Map<String, dynamic> json) =>
      _$StockPriceFromJson(json);
  Map<String, dynamic> toJson() => _$StockPriceToJson(this);
}

@JsonSerializable()
class Price {
  final String amount;
  final String currency;

  Price({required this.amount, required this.currency});

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
