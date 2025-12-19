import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/product.dart';

abstract class ProductRepo{

  Future<Result<List<Product>>> getProducts();

}