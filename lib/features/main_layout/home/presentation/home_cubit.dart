import 'package:ecommerce_app/core/common/component_state.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/useCase/getBrandUseCase.dart';
import 'package:ecommerce_app/domain/useCase/getCategoriesUseCase.dart';
import 'package:ecommerce_app/domain/useCase/getProductsUseCase.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeCubit extends Cubit<HomeState>{
  GetCategoriesUseCase getCategoriesUseCase;
  GetBrandsUseCase getBrandsUseCase;
  GetProductUseCase getProductsUseCase;

  HomeCubit(this.getCategoriesUseCase,this.getBrandsUseCase,this.getProductsUseCase):super(
     HomeState(
       categoriesState: InitialState(),
       brandState: InitialState(),
       productState: InitialState(),
     ));
  void loadHomeState(){
    _getCategories();
    _getBrands();
    _getProducts();
  }
  void _getCategories()async{
    emit(state.copyWith(categoriesState: LoadingState()));
    var response = await getCategoriesUseCase.getCategories();
    switch(response){
      case Failure():{
        emit(state.copyWith(categoriesState: ErrorState(response.exception!)));
      }
      case Success():{
        emit(state.copyWith(categoriesState: SuccessState(response.data)));
      }
    }
  }
  void _getBrands()async{
    emit(state.copyWith(brandState:LoadingState() ));
    var response = await getBrandsUseCase.getBrands();
    switch(response){
      case Failure():{
        emit(state.copyWith(brandState: ErrorState(response.exception!)));
      }
      case Success():{
        emit(state.copyWith(brandState: SuccessState(response.data)));
      }
    }
  }
  void _getProducts()async{
    emit(state.copyWith(productState: LoadingState()));
    var response = await getProductsUseCase.getProducts();
    switch(response){
      case Failure():{
        emit(state.copyWith(productState:ErrorState(response.exception!) ));
      }
      case Success():{
        emit(state.copyWith(productState: SuccessState(response.data)));
      }
    }

  }



}