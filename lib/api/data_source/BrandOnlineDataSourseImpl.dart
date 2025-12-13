import 'package:ecommerce_app/Data/data_source/BrandOnlineDataSourse.dart';
import 'package:ecommerce_app/api/Api_manager.dart';
import 'package:ecommerce_app/api/execute_api.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/Brand.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandOnlineDataSourse)
class BrandsDataSourceImpl implements BrandOnlineDataSourse{
  ApiManager apiManager;
  BrandsDataSourceImpl(this.apiManager);
  @override
  Future<Result<List<Brand>>> getBrands()async{
    return executeApi(()async{
      var response =  await apiManager.getBrands();
      var data =  response.data?.map((brandDto) => brandDto.toBrand(),).toList() ?? [];
      return data;
    },);
  }
}