import 'package:ecommerce_app/domain/model/Brand.dart';

abstract class BrandOnlineDataSourse {
  Future<List<Brand>> getBrands();
}