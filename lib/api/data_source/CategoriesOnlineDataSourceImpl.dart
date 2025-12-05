import 'package:ecommerce_app/Data/data_source/categoriesOnlineDataSource.dart';
import 'package:ecommerce_app/api/Api_manager.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesOnlineDataSource)
class CategoriesOnlineDataSourceImpl implements CategoriesOnlineDataSource{
  ApiManager apiManager;
  CategoriesOnlineDataSourceImpl(this.apiManager);

  @override
  Future<List<Category>>getCategories()async{
    var response = await apiManager.getCategories();
    return response.data?.map((dto)=>dto.toCategory()).toList() ??[];

  }
}