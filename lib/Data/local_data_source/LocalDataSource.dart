import 'package:ecommerce_app/domain/model/Category.dart';

abstract class LocalDataSource {
  Future<List<Category>?> getCachedCategory();

  Future<List<Category>?> getSubCachedCategory(String id);

  Future<void> cacheCategory(List<Category> categories);

  Future<void> cacheSubCategory( String categoryId,List<Category> subCategories);



}