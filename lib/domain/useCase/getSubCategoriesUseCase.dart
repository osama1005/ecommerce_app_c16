import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/domain/repos/CategoriesRepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSubCategoriesUseCase{
  CategoriesRepo categoriesRepo ;

  GetSubCategoriesUseCase(this.categoriesRepo);

  Future<Result<List<Category>>> getSubCategories({required String id}){
    return categoriesRepo.getSubCategories(id: id);
  }

}