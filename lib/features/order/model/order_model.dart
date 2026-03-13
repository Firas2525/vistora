class OrderModel {
  final int id;
  final num totalPrice;
  final int? couponsDiscount;
  final String status;
  final String note;
  final String image;
  final List<OrderProductModel> orderProducts;

  OrderModel({
    required this.id,
    required this.totalPrice,
    required this.couponsDiscount,
    required this.orderProducts,
    required this.status,
    required this.note,
    required this.image,
  });

  // تحويل من JSON إلى كائن Dart
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] ?? 0,
      totalPrice: json['total_price'] ?? 0,
      couponsDiscount: json['coupons'] != null ? json['coupons']['discount'] : 0,
      status: json['status'] ?? '',
      note: json['note'] ?? '',
      image: '',
      orderProducts: (json['Order_Product'] as List?)
          ?.map((item) => OrderProductModel.fromJson(item))
          .toList() ??
          [],
    );
  }

  // تحويل من كائن Dart إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'total_price': totalPrice,
      'coupons_discount': couponsDiscount,
      'status': status,
      'note': note,
      'image': image,
      'Order_Product': orderProducts.map((product) => product.toJson()).toList(),
    };
  }
}

class OrderProductModel {
  final int id;
  final String name;
  final int price;

  OrderProductModel({
    required this.id,
    required this.name,
    required this.price,
  });

  // تحويل من JSON إلى كائن Dart
  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      id: json['products']['id'] ?? 0,
      name: json['products']['name'] ?? '',
      price: json['price'] ?? 0,
    );
  }

  // تحويل من كائن Dart إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }
}
