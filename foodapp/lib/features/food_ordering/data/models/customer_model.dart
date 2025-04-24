import 'package:flutter/material.dart';
import 'item_model.dart';

class CustomerModel {
  CustomerModel({
    required this.name,
    required this.imageProvider,
    List<ItemModel>? items,
  }) : items = items ?? [];

  final String name;
  final ImageProvider imageProvider;
  final List<ItemModel> items;

  String get formattedTotalItemPrice {
    final totalPriceCents = items.fold<int>(
      0,
      (prev, item) => prev + item.totalPriceCents,
    );
    return '₮${(totalPriceCents / 100.0).toStringAsFixed(0)}';
  }
}
