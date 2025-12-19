import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/product.dart';
import 'package:ecommerce_app/domain/repos/product_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetProductUseCase{
  ProductRepo productRepo;

  GetProductUseCase(this.productRepo);

Future<Result<List<Product>>>getProducts(){
  return productRepo.getProducts();
}
}