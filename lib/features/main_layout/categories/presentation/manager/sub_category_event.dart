part of 'sub_category_bloc.dart';

sealed class SubCategoryEvent {}

class GetSubCategoriesEvent extends SubCategoryEvent {
  final String categoryID;

  GetSubCategoriesEvent(this.categoryID);
}