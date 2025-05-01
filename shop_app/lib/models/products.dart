import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable()
class ProductModel {
  int? id;
  String? title;
  String? description;
  double? price;
  String? image;
  String? category;
  Rating? rating;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.price,
    this.image,
    this.category,
    this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  List<ProductModel> fromList(List<dynamic> data) =>
      data.map((e) => ProductModel.fromJson(e)).toList();
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
