part of 'products_bloc.dart';

sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class LoadingGetProductsState extends ProductsState {}

final class SuccessGetProductsState extends ProductsState {
  final List<ProductData> products;

  SuccessGetProductsState(this.products);
}

final class ErrorGetProductsState extends ProductsState {
  final String message;

  ErrorGetProductsState(this.message);
}
