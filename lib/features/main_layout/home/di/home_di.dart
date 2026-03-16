import 'package:ecommerce_app/core/di_core/app_di_core.dart';

import 'package:ecommerce_app/features/main_layout/home/domain/use_cases/get_all_categories_use_case.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_source/categories_interface_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/repositories_imp/categories_repositories_imp.dart';

abstract class HomeDi {
  static void setup() {
    getIt
      ..registerLazySingleton(
        () => RemoteCategoriesDataSource(getIt()),
      )
      ..registerLazySingleton(
        () => CategoriesRepositoriesImp(getIt()),
      )
      ..registerLazySingleton(
        () => GetAllCategoriesUseCase(getIt()),
      );
  }
}
