// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stock _$StockFromJson(Map<String, dynamic> json) => Stock(
      id: (json['id'] as num).toInt(),
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      logoUrl: json['logo_url'] as String,
      stockPrice:
          StockPrice.fromJson(json['stock_price'] as Map<String, dynamic>),
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$StockToJson(Stock instance) => <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'logo_url': instance.logoUrl,
      'stock_price': instance.stockPrice,
      'isFavorite': instance.isFavorite,
    };

StockPrice _$StockPriceFromJson(Map<String, dynamic> json) => StockPrice(
      currentPrice:
          Price.fromJson(json['current_price'] as Map<String, dynamic>),
      priceChange: (json['price_change'] as num).toDouble(),
      percentageChange: (json['percentage_change'] as num).toDouble(),
    );

Map<String, dynamic> _$StockPriceToJson(StockPrice instance) =>
    <String, dynamic>{
      'current_price': instance.currentPrice,
      'price_change': instance.priceChange,
      'percentage_change': instance.percentageChange,
    };

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      amount: json['amount'] as String,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
    };
