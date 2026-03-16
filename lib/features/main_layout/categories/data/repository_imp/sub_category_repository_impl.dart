import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/core/network_handler/api_result.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/data_source/sub_category_data_source.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/models/sub_category_model.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/entities/sub_category_data.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repository/sub_category_repository.dart';

class SubCategoryRepositoryImpl implements SubCategoryRepository {
  final SubCategoryDataSource _categoryDataSource;

  SubCategoryRepositoryImpl(this._categoryDataSource);

  @override
  Future<ApiResult<List<SubCategoryData>>> getAllSubCategories(
      String categoryID) async {
    try {
      final response =
          await _categoryDataSource.getAllSubCategories(categoryID);

      if (response.statusCode == 200) {
        List<SubCategoryData> subCategories = [];

        for (var subCategory in response.data["data"]) {
          final data = SubCategoryModel.fromJson(subCategory);
          subCategories.add(data);
        }

        return ApiResult.success(data: subCategories);
      } else {
        return ApiResult.failure(
          exception: ServerFailure(
            statusCode: response.statusCode.toString(),
            message: response.data["message"],
          ),
        );
      }
    } on DioException catch (dioException) {
      return ApiResult.failure(
        exception: ServerFailure(
          statusCode: dioException.response?.statusCode.toString() ?? "",
          message: dioException.response?.data["message"],
        ),
      );
    }
  }
}
