import 'package:flutter/material.dart';
import '../models/item.dart';

const List<Item> items = [
  Item(
    name: 'Spinach Pizza',
    totalPriceCents: 1299,
    uid: '1',
    imageProvider: NetworkImage(
      'https://docs.flutter.dev'
      '/cookbook/img-files/effects/split-check/Food1.jpg',
    ),
  ),
  Item(
    name: 'Veggie Delight',
    totalPriceCents: 799,
    uid: '2',
    imageProvider: NetworkImage(
      'https://docs.flutter.dev'
      '/cookbook/img-files/effects/split-check/Food2.jpg',
    ),
  ),
  Item(
    name: 'Chicken Parmesan',
    totalPriceCents: 1499,
    uid: '3',
    imageProvider: NetworkImage(
      'https://docs.flutter.dev'
      '/cookbook/img-files/effects/split-check/Food3.jpg',
    ),
  ),
];
