import 'package:ecommerce_app/core/network_handler/api_result.dart';
import 'package:ecommerce_app/features/products_screen/domain/enities/product_data.dart';

abstract class ProductsRepository {
  Future<ApiResult<List<ProductData>>> getAllProducts();
}
