import 'package:ecommerce_app/Data/data_source/categoriesOnlineDataSource.dart';
import 'package:ecommerce_app/Data/local_data_source/contract/LocalDataSource.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/domain/repos/CategoriesRepo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRepo)
class CategoriesRepoImpl implements CategoriesRepo {
  final LocalDataSource localDataSource;
  CategoriesOnlineDataSource onlineDataSource;
  CategoriesRepoImpl(this.onlineDataSource, this.localDataSource); //di

  @override
  Future<Result<List<Category>>> getCategories() async {
    try {
      final cacheCategory = await localDataSource.getCachedCategory();
      if (cacheCategory != null && cacheCategory.isNotEmpty) {
        return Success(cacheCategory);
      }
      var response = await onlineDataSource.getCategories();
      switch (response) {
        case Success<List<Category>>():
          {
            await localDataSource.cacheCategory(response.data);
            return Success(response.data);
          }
        case Failure<List<Category>>():
          {
            final fallBack = await localDataSource.getCachedCategory();
            if (fallBack != null) {
              return Success(fallBack);
            }
            return Failure(response.exception);
          }
      }
    } catch (e) {
      return Failure(Exception('error loading category'));
    }
  }

  Future<Result<List<Category>>> getSubCategories({required String id}) async {
    try {
      final cacheCategory = await localDataSource.getSubCachedCategory(id);
      if (cacheCategory != null && cacheCategory.isNotEmpty) {
        return Success(cacheCategory);
      }
      var response = await onlineDataSource.getSubCategories(id: id);
      switch (response) {
        case Success<List<Category>>():
          {
            await localDataSource.cacheSubCategory(id,response.data);
            return Success(response.data);
          }
        case Failure<List<Category>>():
          {
            final fallBack = await localDataSource.getSubCachedCategory(id);
            if (fallBack != null) {
              return Success(fallBack);

            }
            return Failure(response.exception);
          }
      }
    } catch (e) {
      return Failure(Exception('error loading subCategory'));
    }
  }
}
