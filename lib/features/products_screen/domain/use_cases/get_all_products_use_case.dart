import 'package:ecommerce_app/core/network_handler/api_result.dart';
import 'package:ecommerce_app/features/products_screen/domain/enities/product_data.dart';
import 'package:ecommerce_app/features/products_screen/domain/repository/products_repository.dart';

class GetAllProductsUseCase {
  final ProductsRepository productsRepository;

  GetAllProductsUseCase(this.productsRepository);

  Future<ApiResult<List<ProductData>>> execute() async {
    return await productsRepository.getAllProducts();
  }
}
