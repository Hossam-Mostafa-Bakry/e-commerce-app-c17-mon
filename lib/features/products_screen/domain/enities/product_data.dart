import 'package:equatable/equatable.dart';

class ProductData extends Equatable {
  final String sold;
  final List<String> images;
  final List<Subcategory> subcategory;
  final String ratingsQuantity;
  final String id;
  final String title;
  final String slug;
  final String description;
  final int quantity;
  final String price;
  final String imageCover;
  final Category category;
  final Brand brand;
  final double ratingsAverage;
  final String createdAt;
  final String updatedAt;

  const ProductData({
    required this.sold,
    required this.images,
    required this.subcategory,
    required this.ratingsQuantity,
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageCover,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props => [
        sold,
        images,
        subcategory,
        ratingsQuantity,
        id,
        title,
        slug,
        description,
        quantity,
        price,
        imageCover,
        category,
        brand,
        ratingsAverage,
        createdAt,
        updatedAt,
      ];
}

class Subcategory extends Equatable {
  final String id;
  final String name;
  final String slug;
  final String category;

  const Subcategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.category,
  });

  @override
  List<Object> get props => [id, name, slug, category];
}

class Category extends Equatable {
  final String id;
  final String name;
  final String slug;
  final String image;

  const Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  @override
  List<Object> get props => [id, name, slug, image];
}

class Brand extends Equatable {
  final String id;
  final String name;
  final String slug;
  final String image;

  const Brand({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  @override
  List<Object> get props => [id, name, slug, image];
}