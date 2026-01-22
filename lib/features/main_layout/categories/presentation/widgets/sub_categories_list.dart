import 'package:ecommerce_app/core/common/component_state.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/features/main_layout/categories/categories_cubit.dart';
import 'package:ecommerce_app/features/main_layout/categories/categories_state.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/category_card_item.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sub_category_item.dart';

class SubCategoriesList extends StatelessWidget {
  const SubCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
          Category? selectedCategory;
          if (state.categoriesState is SuccessState<List<Category>>) {
            var categories =
                (state.categoriesState as SuccessState<List<Category>>).data;
            if (categories.isNotEmpty) {
              selectedCategory = categories[state.selectedIndexCategries];
            }
          }
          var subCategoriesStata = state.subcategoriesState;
          return CustomScrollView(
            slivers: <Widget>[
              // category title
              SliverToBoxAdapter(
                child: Text(
                  selectedCategory?.title ?? '',
                  style: getBoldStyle(
                      color: ColorManager.primary, fontSize: FontSize.s14),
                ),
              ),
              // the category card
              SliverToBoxAdapter(
                child: CategoryCardItem(
                    selectedCategory?.title ?? '',
                    selectedCategory?.image ?? '',
                    goToCategoryProductsListScreen),
              ),
              _buildSubCategoriesGrid(subCategoriesStata)
              // the grid view of the subcategories
            ],
          );
        }));
  }

  Widget _buildSubCategoriesGrid(ComponentState<List<Category>> subCategory) {
    switch (subCategory) {
      case LoadingState():
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount: 9,
            (context, index) => CategoriesItemShimmer(),
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.75,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8),
        );
      case ErrorState():
        {
          return SliverToBoxAdapter(
            child: Text(subCategory.exception.toString()),
          );
        }
      case SuccessState():
        {
          var subCategories = subCategory.data;
          if (subCategories.isEmpty) {
            return SliverToBoxAdapter(
              child: Text('No Sub Categories'),
            );
          }
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
                childCount: subCategories.length,
                (context, index) => SubCategoryItem(
                    subCategories[index].title ?? '',
                    subCategories[index].image ?? '',
                    goToCategoryProductsListScreen)),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.75,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8),
          );
        }
      default:
        return SliverToBoxAdapter(
          child: SizedBox(),
        );
    }
  }

  goToCategoryProductsListScreen() {
    // todo implement this function
  }
}
