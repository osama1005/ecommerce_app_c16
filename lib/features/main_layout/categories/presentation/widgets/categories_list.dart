import 'package:ecommerce_app/core/common/component_state.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/categories_cubit.dart';
import 'package:ecommerce_app/features/main_layout/categories/categories_state.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/category_item.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.containerGray,
          border: Border(
            top: BorderSide(width: AppSize.s2, color: ColorManager.primary.withOpacity(0.3)),
            left: BorderSide(width: AppSize.s2, color: ColorManager.primary.withOpacity(0.3)),
            bottom: BorderSide(width: AppSize.s2, color: ColorManager.primary.withOpacity(0.3)),
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppSize.s12),
            bottomLeft: Radius.circular(AppSize.s12),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppSize.s12),
            bottomLeft: Radius.circular(AppSize.s12),
          ),
          child: BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              var categoryState = state.categoriesState;

              switch (categoryState) {
                case LoadingState():
                  return ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) => CategoriesItemShimmer(),
                  );

                case ErrorState():
                  return Center(
                    child: Text(
                      categoryState.exception.toString(),
                      style: const TextStyle(color: Colors.red),
                    ),
                  );

                case SuccessState():
                  var categories = categoryState.data;

                  if (categories.isEmpty) {
                    return const Center(child: Text('No Categories'));
                  }

                  return ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      var category = categories[index];

                      return CategoryItem(
                        index,
                        category.title ?? '',
                        state.selectedIndexCategries == index,
                            (selectedIndex) {
                          context
                              .read<CategoriesCubit>()
                              .selectedCategoreis(selectedIndex, category.id ?? '');
                        },
                      );
                    },
                  );

                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
