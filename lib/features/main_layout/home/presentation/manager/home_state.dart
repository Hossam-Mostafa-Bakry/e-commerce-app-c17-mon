part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

final class LoadingGetCategoriesState extends HomeState {
  @override
  List<Object?> get props => [];
}

final class SuccessGetCategoriesState extends HomeState {
  final List<CategoryData> categoriesList;

  const SuccessGetCategoriesState(this.categoriesList);

  @override
  List<Object?> get props => [categoriesList];
}

final class ErrorGetCategoriesState extends HomeState {
  final String message;

  const ErrorGetCategoriesState(this.message);

  @override
  List<Object?> get props => [message];
}
