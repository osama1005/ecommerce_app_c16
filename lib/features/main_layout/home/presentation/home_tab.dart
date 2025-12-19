import 'dart:async';
import 'package:ecommerce_app/core/common/component_state.dart';
import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/widget/product_card.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/home_cubit.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/home_state.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_brand_widget.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import 'widgets/custom_ads_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  HomeCubit homeCubit = getIt.get<HomeCubit>();

  int _currentIndex = 0;
  late Timer _timer;

  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  @override
  void initState() {
    super.initState();
    homeCubit.loadHomeState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAdsWidget(
            adsImages: adsImages,
          ),
          BlocProvider(
            create: (context) => homeCubit,
            child: Column(
              children: [
                CustomSectionBar(sectionNname: 'Categories', function: () {}),
                SizedBox(
                  height: 270.h,
                  child: BlocBuilder<HomeCubit, HomeState>(
                    buildWhen: (previous, current){
                       return previous.categoriesState != current.categoriesState;
                       },
                    builder: (context, state) {
                      var categoriesState = state.categoriesState;
                      switch (categoriesState) {
                        case InitialState():
                        case LoadingState():
                          {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        case ErrorState():
                          {
                            return Text(categoriesState.exception.toString());
                          }
                        case SuccessState():
                          {
                            var categories = categoriesState.data;
                            return GridView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return  CustomCategoryWidget(
                                  category: categories[index],
                                );
                              },
                              itemCount: categories.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                            );
                          }
                      }
                    },
                  ),
                ),
                SizedBox(height: 12.h),
                CustomSectionBar(sectionNname: 'Brands', function: () {}),
                SizedBox(
                  height: 270.h,
                  child: BlocBuilder<HomeCubit,HomeState>(
                    buildWhen: (previous, current){
                      return previous.brandState != current.brandState;
                    },
                    builder: (context,state){
                      var brandState = state.brandState;
                      switch(brandState){
                        case InitialState():
                        case LoadingState():{
                          return const Center(child: CircularProgressIndicator(),);
                      }
                        case ErrorState():
                          {
                            return Text(brandState.exception.toString());
                          }
                        case SuccessState():{
                          var brands = brandState.data;
                          return  GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                      return  CustomBrandWidget(
                        brand: brands[index],
                      );
                      },
                      itemCount: brands.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      ),
                      );
                        }
                      }

                    },

                  ),
                ),
                CustomSectionBar(
                  sectionNname: 'Most Selling Products',
                  function: () {},
                ),
                SizedBox(
                  child: SizedBox(
                    height: 360.h,
                    child: BlocBuilder<HomeCubit,HomeState>(
                      buildWhen: (previos,current){
                        return previos.productState != current.productState;
                      },
                      builder: (context,state){
                        var productState = state.productState;
                        switch(productState){
                        case InitialState():
                        case LoadingState():{
                        return const Center(child: CircularProgressIndicator(),);
                        }
                        case ErrorState():
                        {
                        return Text(productState.exception.toString());
                        }
                        case SuccessState():{
                          var product = productState.data;
                          return  ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                        return  ProductCard(
                        product: product[index],
                        );
                        },
                        itemCount: product.length,
                        );
                        }

                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
              ],
            ),
          )
        ],
      ),
    );
  }
}
