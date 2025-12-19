import 'package:ecommerce_app/core/common/component_state.dart';
import 'package:ecommerce_app/domain/model/Brand.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/domain/model/product.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  ComponentState<List<Category>> categoriesState;
  ComponentState<List<Brand>> brandState;
  ComponentState<List<Product>> productState;



  HomeState({required this.categoriesState, required this.brandState,required this.productState});

  @override
  @override
  List<Object?> get props => [categoriesState, brandState,productState];


  HomeState copyWith({
    ComponentState<List<Category>>? categoriesState,
    ComponentState<List<Brand>>? brandState,
    ComponentState<List<Product>>? productState,
  }) {
    return HomeState(
        categoriesState: categoriesState ?? this.categoriesState,
        brandState: brandState ?? this.brandState,
        productState: productState ?? this.productState,

    );
  }
}
