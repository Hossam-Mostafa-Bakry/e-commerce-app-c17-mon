part of 'sub_category_bloc.dart';

sealed class SubCategoryState {}

final class SubCategoryInitial extends SubCategoryState {}

final class LoadingGetSubCategoryState extends SubCategoryState {}

final class SuccessGetSubCategoryState extends SubCategoryState {
  final List<SubCategoryData> subCategories;

  SuccessGetSubCategoryState(this.subCategories);
}

final class ErrorGetSubCategoryState extends SubCategoryState {
  final String message;

  ErrorGetSubCategoryState(this.message);
}
