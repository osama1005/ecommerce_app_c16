import 'package:ecommerce_app/domain/useCase/getBrandUseCase.dart';
import 'package:ecommerce_app/domain/useCase/getCategoriesUseCase.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel{
  GetCategoriesUseCase getCategoriesUseCase;
  GetBrandsUseCase getBrandsUseCase ;
  HomeViewModel(this.getCategoriesUseCase,this.getBrandsUseCase);//di
  //constructor injection


  void getCategories()async{
    var categories = await getCategoriesUseCase.getCategories();
  }
  void getBrands()async{
    var brands = await getBrandsUseCase.getBrands();
  }

}