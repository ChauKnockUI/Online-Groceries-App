import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<Map<String, dynamic>> {
  CartCubit()
      : super({
          "category": null,
          "cartItems": <Map<String, dynamic>>[],
        });

  void selectCategory(Map<String, dynamic> category) {
    emit({
      "category": category,
      "cartItems": state["cartItems"],
    });
  }

  void addItem(Map<String, dynamic> item, String categoryName) {
    final cartItems = List<Map<String, dynamic>>.from(state["cartItems"]);
    final index = cartItems.indexWhere((e) => e["item"]["name"] == item["name"]);
    if (index != -1) {
      cartItems[index]["quantity"] += 1;
    } else {
      cartItems.add({"item": item, "quantity": 1, "categoryName": categoryName,});
    }
    emit({
      "category": state["category"],
      "cartItems": cartItems,
    });
  }

  void increaseQuantity(String itemName) {
    final cartItems = List<Map<String, dynamic>>.from(state["cartItems"]);
    final index = cartItems.indexWhere((e) => e["item"]["name"] == itemName);
    if (index != -1) {
      cartItems[index]["quantity"] += 1;
      emit({
        "category": state["category"],
        "cartItems": cartItems,
      });
    }
  }

  void decreaseQuantity(String itemName) {
    final cartItems = List<Map<String, dynamic>>.from(state["cartItems"]);
    final index = cartItems.indexWhere((e) => e["item"]["name"] == itemName);
    if (index != -1 && cartItems[index]["quantity"] > 1) {
      cartItems[index]["quantity"] -= 1;
    } else if (index != -1) {
      cartItems.removeAt(index);
    }
    emit({
      "category": state["category"],
      "cartItems": cartItems,
    });
  }
}