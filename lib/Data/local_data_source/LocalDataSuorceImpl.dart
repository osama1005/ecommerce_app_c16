import 'package:ecommerce_app/Data/local_data_source/LocalDataSource.dart';
import 'package:ecommerce_app/core/cache_manager/CacheManager.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: LocalDataSource)
class LocalDataSourceImpl implements LocalDataSource {
  CacheManager cacheManager;
  LocalDataSourceImpl(this.cacheManager);

  @override
  Future<void> cacheCategory(List<Category> categories)async {
    try {
      final jsonList = categories.map((e) => e.toJson()).toList();
      await cacheManager.saveCategory(jsonList);
    }
    catch(e){
      print(e.toString());
    }
    
  }

  @override
  Future<void> cacheSubCategory(String id,List<Category> subCategories) async{
  try{
    final jsonList = subCategories.map((e)=> e.toJson()).toList();
    await cacheManager.saveSubCategory(id, jsonList);
  }
  catch(e){
    print(e.toString());
  }
  }

  @override
  Future<List<Category>?> getCachedCategory() async {
    try {
      final cachedCategories = cacheManager.getCategory();
      if (cachedCategories == null) {
        return null;
      }
      return cachedCategories.map((json) => Category.fromJson(json)).toList();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future<List<Category>?> getSubCachedCategory(String id) async {
    try {
      final cachedSubCategories = cacheManager.getSubCategory(id);
      if (cachedSubCategories == null) {
        return null;
      }
      return cachedSubCategories
          .map((json) => Category.fromJson(json))
          .toList();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
