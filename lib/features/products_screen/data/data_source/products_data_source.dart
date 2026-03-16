import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network_handler/api_interface.dart';
import 'package:ecommerce_app/core/network_handler/end_points.dart';

abstract class ProductsDataSource {
  Future<Response> getAllProducts();
}

class RemoteProductsDataSource implements ProductsDataSource {
  final ApiInterface _apiInterface;

  RemoteProductsDataSource(this._apiInterface);

  @override
  Future<Response<dynamic>> getAllProducts() async {
    return await _apiInterface.get(EndPoints.products);
  }
}
