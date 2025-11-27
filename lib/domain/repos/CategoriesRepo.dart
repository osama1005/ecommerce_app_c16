import 'package:ecommerce_app/domain/model/Category.dart';

abstract class CategoriesRepo{
Future<List<Category>> getCategories();


}