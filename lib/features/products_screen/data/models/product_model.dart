import 'package:ecommerce_app/features/products_screen/domain/enities/product_data.dart';

class ProductModel extends ProductData {
  const ProductModel({
    required super.sold,
    required super.images,
    required super.subcategory,
    required super.ratingsQuantity,
    required super.id,
    required super.title,
    required super.slug,
    required super.description,
    required super.quantity,
    required super.price,
    required super.imageCover,
    required super.category,
    required super.brand,
    required super.ratingsAverage,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      sold: json["sold"].toString(),
      images: List<String>.from(json["images"]?.map((x) => x) ?? []),
      subcategory: List<Subcategory>.from(
        json["subcategory"]?.map((x) => SubcategoryModel.fromJson(x)) ?? [],
      ),
      ratingsQuantity: json["ratingsQuantity"].toString(),
      id: json["_id"] ?? json["id"] ?? "",
      title: json["title"] ?? "",
      slug: json["slug"] ?? "",
      description: json["description"] ?? "",
      quantity: json["quantity"] ?? 0,
      price: (json["price"] ?? 0).toString(),
      imageCover: json["imageCover"] ?? "",
      category: CategoryModel.fromJson(json["category"] ?? {}),
      brand: BrandModel.fromJson(json["brand"] ?? {}),
      ratingsAverage: (json["ratingsAverage"] ?? 0.0).toDouble(),
      createdAt: json["createdAt"] ?? "",
      updatedAt: json["updatedAt"] ?? "",
    );
  }
}

class SubcategoryModel extends Subcategory {
  const SubcategoryModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.category,
  });

  factory SubcategoryModel.fromJson(Map<String, dynamic> json) {
    return SubcategoryModel(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      slug: json["slug"] ?? "",
      category: json["category"] ?? "",
    );
  }
}

class CategoryModel extends Category {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      slug: json["slug"] ?? "",
      image: json["image"] ?? "",
    );
  }
}

class BrandModel extends Brand {
  const BrandModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.image,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      slug: json["slug"] ?? "",
      image: json["image"] ?? "",
    );
  }
}
