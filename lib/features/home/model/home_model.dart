class CategoryModel {
  final int id;
  final String name;
  final String image;
  bool selected;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.selected = false,
  });

  // تحويل JSON إلى كائن
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'] ?? '',
    );
  }

  // تحويل كائن إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  // لإنشاء نسخة معدلة من الكائن
  CategoryModel copyWith({bool? selected}) {
    return CategoryModel(
      id: id,
      name: name,
      image: image,
      selected: selected ?? this.selected,
    );
  }
}

class TagModel {
  final int id;
  final String name;
  bool selected;

  TagModel({
    required this.id,
    required this.name,
    this.selected = false,
  });

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  TagModel copyWith({bool? selected}) {
    return TagModel(
      id: id,
      name: name,
      selected: selected ?? this.selected,
    );
  }
}

class ResultModel {
  final int id;
  final String name;
  final String description;
  final num discount;
  final num price;
  final bool available;
  final String image;

  ResultModel({
    required this.id,
    required this.name,
    required this.description,
    required this.discount,
    required this.price,
    required this.available,
    required this.image,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? '',
      discount: json['discount'] ?? 0,
      price: json['price'] ?? 0,
      available: json['available'] ?? false,
      image: json['Image'][0]['path'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'discount': discount,
      'price': price,
      'available': available,
      'image': image,
    };
  }
}

class AddsModel {
  final int id;
  final String image;

  AddsModel({
    required this.id,
    required this.image,
  });

  factory AddsModel.fromJson(Map<String, dynamic> json) {
    return AddsModel(
      id: json['id'],
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
    };
  }
}
