// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
    String userId;
    List<CartItem> cartItems;

    Order({
        required this.userId,
        required this.cartItems,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        userId: json["userId"],
        cartItems: List<CartItem>.from(json["cartItems"].map((x) => CartItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "cartItems": List<dynamic>.from(cartItems.map((x) => x.toJson())),
    };
}

class CartItem {
    String name;
    String id;
    String price;
    int cartQuantity;

    CartItem({
        required this.name,
        required this.id,
        required this.price,
        required this.cartQuantity,
    });

    factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        name: json["name"],
        id: json["id"],
        price: json["price"],
        cartQuantity: json["cartQuantity"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "price": price,
        "cartQuantity": cartQuantity,
    };
}
