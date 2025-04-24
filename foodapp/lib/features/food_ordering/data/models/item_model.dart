import 'package:flutter/material.dart';

@immutable
class ItemModel {
  const ItemModel({
    required this.totalPriceCents,
    required this.name,
    required this.uid,
    required this.imageProvider,
    this.description = '',
  });
  
  final int totalPriceCents;
  final String name;
  final String uid;
  final ImageProvider imageProvider;
  final String description;
  
  String get formattedTotalItemPrice =>
      '₮${(totalPriceCents / 100.0).toStringAsFixed(0)}';
}