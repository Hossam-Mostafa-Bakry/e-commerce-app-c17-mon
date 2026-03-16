import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/manager/sub_category_bloc.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/categories_list.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/manager/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/sub_categories_list.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc()
            ..add(
              const GetAllCategoriesEvent(),
            ),
        ),
        BlocProvider(
          create: (context) => SubCategoryBloc(),
        ),
      ],
      child: const Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p12, vertical: AppPadding.p12),
        child: Row(
          children: [
            /// we need to get Category then load Sub-Category for selected Category
            CategoriesList(),
            SizedBox(
              width: AppSize.s16,
            ),
            SubCategoriesList()
          ],
        ),
      ),
    );
  }
}
