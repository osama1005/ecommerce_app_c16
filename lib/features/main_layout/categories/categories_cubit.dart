import 'package:ecommerce_app/core/common/component_state.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/useCase/getCategoriesUseCase.dart';
import 'package:ecommerce_app/domain/useCase/getSubCategoriesUseCase.dart';
import 'package:ecommerce_app/features/main_layout/categories/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  GetCategoriesUseCase _getCategoriesUseCase;
  GetSubCategoriesUseCase _getSubCategoriesUseCase;

  CategoriesCubit(this._getCategoriesUseCase, this._getSubCategoriesUseCase)
      : super(CategoriesState(
            categoriesState: InitialState(),
            subcategoriesState: InitialState()));

  void getCategories() async {
    emit(state.copywith(categoriesState: LoadingState()));
    var response = await _getCategoriesUseCase.getCategories();
    switch (response) {
      case Failure():
        {
          emit(
              state.copywith(categoriesState: ErrorState(response.exception!)));
        }
      case Success():
        {
          emit(state.copywith(categoriesState: SuccessState(response.data)));
          if (response.data.isNotEmpty) {
            final firstCategory = response.data[0];

            selectedCategoreis(0, firstCategory.id ?? '');
          }
        }
    }
  }

  void selectedCategoreis(int index, String id) {
    emit(state.copywith(selectedIndexCategries: index, selectedCategoryId: id));
    getSubCategories(id);
  }

  void getSubCategories(String id) async {
    emit(state.copywith(subcategoriesState: LoadingState()));
    var response = await _getSubCategoriesUseCase.getSubCategories(id: id);
    switch (response) {
      case Failure():
        {
          emit(
              state.copywith(subcategoriesState: ErrorState(response.exception!)));
        }
      case Success():
        {
          emit(state.copywith(subcategoriesState: SuccessState(response.data)));
        }
    }
  }
}
