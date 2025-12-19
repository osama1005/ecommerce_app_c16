import 'package:ecommerce_app/Data/data_source/productOnlineDataSource.dart';
import 'package:ecommerce_app/api/Api_manager.dart';
import 'package:ecommerce_app/api/execute_api.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/product.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProductOnlineDataSource)
class ProductOnlineDataSourceImpl implements ProductOnlineDataSource {
  ApiManager apiManager;

  ProductOnlineDataSourceImpl(this.apiManager);

  @override
  Future<Result<List<Product>>> getProducts() async {
    return executeApi(() async {
      var response = await apiManager.getProduct();
      var data = response.data?.map((productDto) => productDto.toProduct())
          .toList() ?? [];
      return data;
    });
  }
}