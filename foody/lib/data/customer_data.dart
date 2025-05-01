import 'package:flutter/material.dart';
import '../models/customer.dart';

final List<Customer> people = [
  Customer(
    name: 'Sophia',
    email: 'sophia@example.com',
    password: 'sophia123',
    imageProvider: const NetworkImage(
      'https://randomuser.me/api/portraits/women/44.jpg',
    ),
  ),
  Customer(
    name: 'Ava',
    email: 'ava@example.com',
    password: 'ava123',
    imageProvider: const NetworkImage(
      'https://randomuser.me/api/portraits/women/48.jpg',
    ),
  ),
];
