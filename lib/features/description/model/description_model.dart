import '../../home/model/home_model.dart';

class DescriptionModel {
  final int id;
  final String name;
  final String description;
  final num price;
  final num discount;
  final bool available;
  final List<String> images;
  final List<CategoryModel> categories;
  final List<TagModel> tags;

  DescriptionModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.available,
    required this.images,
    required this.categories,
    required this.tags,
  });

  /// **تحويل كائن JSON إلى كائن `DescriptionModel`**
  factory DescriptionModel.fromJson(Map<String, dynamic> json) {
    return DescriptionModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      discount: json['discount'],
      available: json['available'],
      images: List<String>.from(json['images'] ?? []),
      categories: (json['categories']['main'] as List)
          .map((item) => CategoryModel.fromJson(item))
          .toList(),
      tags: (json['categories']['tags'] as List)
          .map((item) => TagModel.fromJson(item))
          .toList(),
    );
  }

  /// **تحويل كائن `DescriptionModel` إلى JSON**
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'available': available,
      'images': images,
      'categories': {
        'main': categories.map((item) => item.toJson()).toList(),
        'tags': tags.map((item) => item.toJson()).toList(),
      },
    };
  }
}
