import 'package:ecommerce_app/core/network_handler/api_result.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/entities/sub_category_data.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repository/sub_category_repository.dart';

class GetSubCategoriesUseCase {
  final SubCategoryRepository subCategoryRepository;

  GetSubCategoriesUseCase(this.subCategoryRepository);

  Future<ApiResult<List<SubCategoryData>>> execute(String categoryID) async {
    return await subCategoryRepository.getAllSubCategories(categoryID);
  }
}
