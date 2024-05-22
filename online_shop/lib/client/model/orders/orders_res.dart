// To parse this JSON data, do
//
//     final paidOrders = paidOrdersFromJson(jsonString);

import 'dart:convert';

List<PaidOrders> paidOrdersFromJson(String str) => List<PaidOrders>.from(json.decode(str).map((x) => PaidOrders.fromJson(x)));

class PaidOrders {
    String id;
    String userId;
    ProductId productId;
    int quantity;
    int total;
    String deliveryStatus;
    String paymentStatus;

    PaidOrders({
        required this.id,
        required this.userId,
        required this.productId,
        required this.quantity,
        required this.total,
        required this.deliveryStatus,
        required this.paymentStatus,
    });

    factory PaidOrders.fromJson(Map<String, dynamic> json) => PaidOrders(
        id: json["_id"],
        userId: json["userId"],
        productId: ProductId.fromJson(json["productId"]),
        quantity: json["quantity"],
        total: json["total"],
        deliveryStatus: json["delivery_status"],
        paymentStatus: json["payment_status"],
    );

}

class ProductId {
    String id;
    String name;
    String title;
    List<String> imageUrl;
    String price;

    ProductId({
        required this.id,
        required this.name,
        required this.title,
        required this.imageUrl,
        required this.price,
    });

    factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
        id: json["_id"],
        name: json["name"],
        title: json["title"],
        imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
        price: json["price"],
    );

}
