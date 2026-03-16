import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network_handler/api_interface.dart';
import 'package:ecommerce_app/core/network_handler/end_points.dart';

abstract class SubCategoryDataSource {
  Future<Response> getAllSubCategories(String categoryID);
}

class RemoteSubCategoryDataSource implements SubCategoryDataSource {
  final ApiInterface _apiInterface;

  RemoteSubCategoryDataSource(this._apiInterface);

  @override
  Future<Response<dynamic>> getAllSubCategories(String categoryID) async {
    return await _apiInterface
        .get("${EndPoints.category}/$categoryID/subcategories");
  }
}
