import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  const Product({required this.id, required this.title, required this.price});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  // "id": 11,
  final int id;
  //     "title": "perfume Oil",
  @JsonKey(defaultValue: '')
  final String title;
  //     "price": 13
  @JsonKey(defaultValue: 0.0)
  final double price;

  @override
  List<Object?> get props => [id, title, price];

  @override
  bool? get stringify => true;
}
