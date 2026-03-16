import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/network_handler/api_result.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/data_source/sub_category_data_source.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/repository_imp/sub_category_repository_impl.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/entities/sub_category_data.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repository/sub_category_repository.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/use_cases/get_sub_categories_use_case.dart';
import 'package:get_it/get_it.dart';

part 'sub_category_event.dart';

part 'sub_category_state.dart';

class SubCategoryBloc extends Bloc<SubCategoryEvent, SubCategoryState> {
  SubCategoryBloc() : super(SubCategoryInitial()) {
    on<GetSubCategoriesEvent>(_onGetSubCategories);
  }

  late GetSubCategoriesUseCase _getSubCategoriesUseCase;
  late SubCategoryRepository _subCategoryRepository;
  late SubCategoryDataSource _subCategoryDataSource;

  FutureOr<void> _onGetSubCategories(
    GetSubCategoriesEvent event,
    Emitter<SubCategoryState> emit,
  ) async {
    _subCategoryDataSource = RemoteSubCategoryDataSource(GetIt.I());
    _subCategoryRepository = SubCategoryRepositoryImpl(_subCategoryDataSource);
    _getSubCategoriesUseCase = GetSubCategoriesUseCase(_subCategoryRepository);

    emit(LoadingGetSubCategoryState());
    final result = await _getSubCategoriesUseCase.execute(event.categoryID);

    switch (result) {
      case SuccessRequest():
        emit(SuccessGetSubCategoryState(result.data));
      case FailureRequest():
        emit(ErrorGetSubCategoryState(result.exception.message ?? ""));
    }
  }
}
