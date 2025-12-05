import 'package:ecommerce_app/Data/data_source/BrandOnlineDataSourse.dart';
import 'package:ecommerce_app/api/Api_manager.dart';
import 'package:ecommerce_app/domain/model/Brand.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandOnlineDataSourse)
class BrandOnlineDataSourseImpl implements BrandOnlineDataSourse{
  ApiManager apiManager;
  BrandOnlineDataSourseImpl(this.apiManager);

Future<List<Brand>> getBrands()async{
  var response = await apiManager.getBrands();
  return response.data?.map((brandDto)=>brandDto.toBrand()).toList() ??[];


}

}