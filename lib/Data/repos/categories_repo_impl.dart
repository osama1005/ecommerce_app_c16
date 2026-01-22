import 'package:ecommerce_app/Data/data_source/categoriesOnlineDataSource.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/domain/repos/CategoriesRepo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRepo)
class CategoriesRepoImpl implements CategoriesRepo {
  CategoriesOnlineDataSource onlineDataSource;
  CategoriesRepoImpl(this.onlineDataSource);//di

  @override
  Future<Result<List<Category>>> getCategories(){
    return onlineDataSource.getCategories();
  }

  Future<Result<List<Category>>>getSubCategories({required String id}){
    return onlineDataSource.getSubCategories(id: id);
  }
}