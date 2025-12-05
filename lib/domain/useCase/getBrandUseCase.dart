import 'package:ecommerce_app/domain/model/Brand.dart';
import 'package:ecommerce_app/domain/repos/BrandRepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBrandsUseCase{

  BrandRepo brandRepo;

  GetBrandsUseCase(this.brandRepo);

  Future<List<Brand>> getBrands(){
    return brandRepo.getBrands();
  }

}
