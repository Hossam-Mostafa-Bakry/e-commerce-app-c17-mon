import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/di_core/app_di_core.dart';
import 'package:ecommerce_app/core/network_handler/api_result.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_source/categories_interface_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/repositories_imp/categories_repositories_imp.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/category_data.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repositories/categories_repository.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/use_cases/get_all_categories_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetAllCategoriesEvent>(_onGetAllCategoriesEvent);
  }

  /// Use Case
  /// Repository
  /// Data Source

  late GetAllCategoriesUseCase _categoriesUseCase;
  late CategoriesRepository _categoriesRepository;
  late CategoriesInterfaceDataSource _categoriesDataSource;

  FutureOr<void> _onGetAllCategoriesEvent(
    GetAllCategoriesEvent event,
    Emitter<HomeState> emit,
  ) async {
    _categoriesDataSource = RemoteCategoriesDataSource(GetIt.I());
    _categoriesRepository = CategoriesRepositoriesImp(_categoriesDataSource);
    _categoriesUseCase = GetAllCategoriesUseCase(_categoriesRepository);

    emit(LoadingGetCategoriesState());

    final result = await _categoriesUseCase.execute();

    switch (result) {
      case SuccessRequest():
        emit(SuccessGetCategoriesState(result.data));
      case FailureRequest():
        emit(ErrorGetCategoriesState(result.exception.message ?? ""));
    }
  }
}
