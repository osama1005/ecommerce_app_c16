import 'package:ecommerce_app/core/common/component_state.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:equatable/equatable.dart';

class CategoriesState extends Equatable {
  ComponentState<List<Category>> categoriesState;
  ComponentState<List<Category>> subcategoriesState;

  final int selectedIndexCategries;
  final String? selectedCategoryId;

  CategoriesState(
      {required this.categoriesState,
      required this.subcategoriesState,
      this.selectedIndexCategries = 0,
      this.selectedCategoryId});

  @override
  // TODO: implement props
  List<Object?> get props => [
        categoriesState,
        subcategoriesState,
        selectedIndexCategries,
        selectedCategoryId
      ];

  CategoriesState copywith(
      {ComponentState<List<Category>>? categoriesState,
      ComponentState<List<Category>>? subcategoriesState,
      int? selectedIndexCategries,
      String? selectedCategoryId}) {
    return CategoriesState(
        categoriesState: categoriesState ?? this.categoriesState,
        subcategoriesState: subcategoriesState ?? this.subcategoriesState,
        selectedIndexCategries:
            selectedIndexCategries ?? this.selectedIndexCategries,
        selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId);
  }
}
