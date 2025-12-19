import 'package:ecommerce_app/Data/data_source/productOnlineDataSource.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/product.dart';
import 'package:ecommerce_app/domain/repos/product_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProductRepo)
class ProductRepoImpl implements ProductRepo{
  ProductOnlineDataSource productOnlineDataSource;
  ProductRepoImpl(this.productOnlineDataSource);

 @override
  Future<Result<List<Product>>> getProducts() {
    return productOnlineDataSource.getProducts();
  }
}