import 'package:ecommerce_app/Data/data_source/BrandOnlineDataSourse.dart';
import 'package:ecommerce_app/domain/model/Brand.dart';
import 'package:ecommerce_app/domain/repos/BrandRepo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: BrandRepo)
class BrandRepoImpl implements BrandRepo{
  BrandOnlineDataSourse dataSourse ;

  BrandRepoImpl(this.dataSourse);
@override
  Future<List<Brand>> getBrands(){
  return dataSourse.getBrands();
}
}