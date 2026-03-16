import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/core/network_handler/api_result.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_source/categories_interface_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/category_model.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/category_data.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repositories/categories_repository.dart';

class CategoriesRepositoriesImp implements CategoriesRepository {
  final CategoriesInterfaceDataSource _categoriesInterfaceDataSource;

  CategoriesRepositoriesImp(this._categoriesInterfaceDataSource);

  @override
  Future<ApiResult<List<CategoryData>>> getAllCategories() async {
    try {
      final response = await _categoriesInterfaceDataSource.getAllCategories();

      if (response.statusCode == 200) {
        List<CategoryData> dataList = [];
        for (var element in response.data["data"]) {
          final data = CategoryModel.fromJson(element);
          dataList.add(data);
        }

        return ApiResult.success(data: dataList);
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
