import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/network_handler/api_result.dart';
import 'package:ecommerce_app/features/products_screen/data/data_source/products_data_source.dart';
import 'package:ecommerce_app/features/products_screen/data/repository_imp/products_repository_impl.dart';
import 'package:ecommerce_app/features/products_screen/domain/enities/product_data.dart';
import 'package:ecommerce_app/features/products_screen/domain/repository/products_repository.dart';
import 'package:ecommerce_app/features/products_screen/domain/use_cases/get_all_products_use_case.dart';
import 'package:get_it/get_it.dart';

part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<GetAllProductsEvent>(_onGetAllProducts);
  }

  late GetAllProductsUseCase _getAllProductsUseCase;
  late ProductsRepository _productsRepository;
  late ProductsDataSource _productsDataSource;

  FutureOr<void> _onGetAllProducts(
    GetAllProductsEvent event,
    Emitter<ProductsState> emit,
  ) async {
    _productsDataSource = RemoteProductsDataSource(GetIt.I());
    _productsRepository = ProductsRepositoryImpl(_productsDataSource);
    _getAllProductsUseCase = GetAllProductsUseCase(_productsRepository);

    emit(LoadingGetProductsState());
    final result = await _getAllProductsUseCase.execute();

    switch (result) {
      case SuccessRequest():
        emit(SuccessGetProductsState(result.data));
      case FailureRequest():
        emit(ErrorGetProductsState(result.exception.message ?? ""));
    }
  }
}
