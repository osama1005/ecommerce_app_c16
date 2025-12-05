import 'package:ecommerce_app/domain/model/Brand.dart';

abstract class BrandRepo {

  Future<List<Brand>> getBrands();
}


