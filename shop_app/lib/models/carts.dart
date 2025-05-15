import 'package:json_annotation/json_annotation.dart';

part 'carts.g.dart';
@JsonSerializable(createToJson: false)
class CartModel {
  final int? id;
  final int? userId;
  final DateTime? date;
  final List<CartProductModel>? products;

  CartModel({
    this.id,
    this.userId,
    this.date,
    this.products,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);

  static List<CartModel> fromList(List<dynamic> data) =>
      data.map((e) => CartModel.fromJson(e)).toList();

  @override
  String toString() {
    return 'CartModel(id: $id, userId: $userId, date: $date, products: $products)';
  }
}

@JsonSerializable(createToJson: false)
class CartProductModel {
  final int? productId;
  final int? quantity;

  CartProductModel({this.productId, this.quantity});

  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      _$CartProductModelFromJson(json);

  @override
  String toString() {
    return 'CartProductModel(productId: $productId, quantity: $quantity)';
  }
}
