import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/core/network_handler/api_result.dart';
import 'package:ecommerce_app/features/products_screen/data/data_source/products_data_source.dart';
import 'package:ecommerce_app/features/products_screen/data/models/product_model.dart';
import 'package:ecommerce_app/features/products_screen/domain/enities/product_data.dart';
import 'package:ecommerce_app/features/products_screen/domain/repository/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsDataSource _productsDataSource;

  ProductsRepositoryImpl(this._productsDataSource);

  @override
  Future<ApiResult<List<ProductData>>> getAllProducts() async {
    try {
      final response = await _productsDataSource.getAllProducts();

      if (response.statusCode == 200) {
        List<ProductData> products = [];

        for (var product in response.data["data"]) {
          final data = ProductModel.fromJson(product);
          products.add(data);
        }

        return ApiResult.success(data: products);
      } else {
        return ApiResult.failure(
          exception: ServerFailure(
            statusCode: response.statusCode.toString(),
            message: response.data["message"] ?? "Unknown error",
          ),
        );
      }
    } on DioException catch (dioException) {
      return ApiResult.failure(
        exception: ServerFailure(
          statusCode: dioException.response?.statusCode.toString() ?? "",
          message: dioException.response?.data["message"] ?? "Network error",
        ),
      );
    } catch (e) {
      return ApiResult.failure(
        exception: ServerFailure(
          statusCode: "500",
          message: e.toString(),
        ),
      );
    }
  }
}
