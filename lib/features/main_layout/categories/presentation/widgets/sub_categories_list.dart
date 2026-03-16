import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/manager/sub_category_bloc.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/manager/sub_category_bloc.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/category_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sub_category_item.dart';

class SubCategoriesList extends StatelessWidget {
  const SubCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubCategoryBloc, SubCategoryState>(
      builder: (context, state) {
        switch (state) {
          case SubCategoryInitial():
            return const SizedBox.shrink();
          case LoadingGetSubCategoryState():
            return const Center(
              child: CircularProgressIndicator(),
            );
          case SuccessGetSubCategoryState():
            return Expanded(
              flex: 2,
              child: CustomScrollView(
                slivers: <Widget>[
                  // category title
                  SliverToBoxAdapter(
                    child: Text(
                      'Laptops & Electronics',
                      style: getBoldStyle(
                          color: ColorManager.primary, fontSize: FontSize.s14),
                    ),
                  ),
                  // the category card
                  SliverToBoxAdapter(
                    child: CategoryCardItem(
                        "Laptops & Electronics",
                        ImageAssets.categoryCardImage,
                        goToCategoryProductsListScreen),
                  ),
                  // the grid view of the subcategories
                  SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        childCount: state.subCategories.length,
                        (context, index) => SubCategoryItem(
                            state.subCategories[index],
                            ImageAssets.subcategoryCardImage,
                            goToCategoryProductsListScreen),
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.65,
                        mainAxisSpacing: AppSize.s8,
                        crossAxisSpacing: AppSize.s8,
                      ))
                ],
              ),
            );
          case ErrorGetSubCategoryState():
            return const SizedBox.shrink();
        }
      },
    );
  }

  goToCategoryProductsListScreen() {
    // todo implement this function
  }
}
