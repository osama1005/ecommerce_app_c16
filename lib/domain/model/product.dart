import 'package:ecommerce_app/api/model/response/product_response.dart';

class Product {
  Product({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,});

  num? sold;
  List<String>? images;
  List<Category>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  Category? category;
  Brand? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;

}