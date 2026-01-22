import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/Category.dart';

abstract class CategoriesRepo{
Future<Result<List<Category>>> getCategories();

Future<Result<List<Category>>> getSubCategories({required String id});




}