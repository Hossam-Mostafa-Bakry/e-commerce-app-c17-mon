import 'package:equatable/equatable.dart';

class SubCategoryData extends Equatable {
  final String id;
  final String name;
  final String slug;
  final String category;

  const SubCategoryData({
    required this.id,
    required this.name,
    required this.slug,
    required this.category,
  });

  @override
  List<Object> get props => [id, name, slug, category];
}
