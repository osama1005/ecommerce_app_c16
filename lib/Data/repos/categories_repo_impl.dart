import 'package:ecommerce_app/Data/data_source/categoriesOnlineDataSource.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/domain/repos/CategoriesRepo.dart';

class CategoriesRepoImpl implements CategoriesRepo {
  CategoriesOnlineDataSource onlineDataSource;
  CategoriesRepoImpl(this.onlineDataSource);

  @override
  Future<List<Category>> getCategories(){
    return onlineDataSource.getCategories();


  }
}