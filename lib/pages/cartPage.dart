import 'package:flutter/material.dart';
import 'package:training_project/components/custom_dropdown.dart';
import 'package:training_project/utils/globalFormat.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> mockCategoryData = [
      {
        "name": "Fresh Fruits & Vegetables",
        "image": "lib/assets/images/vegetable.png",
        "desc": "Healthy and fresh from the farm.",
        "subItems": [
          {
            "name": "Organic Bananas",
            "unit": "7pcs, Priceg",
            "price": "\$4.99",
            "image": "lib/assets/images/banana.png",
          },
          {
            "name": "Red Apple",
            "unit": "1kg, Priceg",
            "price": "\$5.49",
            "image": "lib/assets/images/apple.png",
          },
          {
            "name": "Bell Pepper Red",
            "unit": "1kg, Priceg",
            "price": "\$3.49",
            "image": "lib/assets/images/bellPepper.png",
          },
          {
            "name": "Ginger",
            "unit": "250gm, Priceg",
            "price": "\$2.99",
            "image": "lib/assets/images/ginger.png",
          },
        ],
      },
      {
        "name": "Meat & Fish",
        "image": "lib/assets/images/fish.png",
        "desc": "Fresh meat and seafood products.",
        "subItems": [
          {
            "name": "Beef Bone",
            "unit": "1kg, Priceg",
            "price": "\$7.99",
            "image": "lib/assets/images/beef.png",
          },
          {
            "name": "Broiler Chicken",
            "unit": "1kg, Priceg",
            "price": "\$6.49",
            "image": "lib/assets/images/chicken.png",
          },
          {
            "name": "Fresh Salmon",
            "unit": "500gm, Priceg",
            "price": "\$10.99",
            "image": "lib/assets/images/salmon.png",
          },
          {
            "name": "Prawn",
            "unit": "500gm, Priceg",
            "price": "\$12.99",
            "image": "lib/assets/images/prawn.png",
          },
        ],
      },
      {
        "name": "Dairy & Eggs",
        "image": "lib/assets/images/milk.png",
        "desc": "Organic dairy and eggs.",
        "subItems": [
          {
            "name": "Milk",
            "unit": "1L, Priceg",
            "price": "\$1.99",
            "image": "lib/assets/images/milk_product.png",
          },
          {
            "name": "Cheese",
            "unit": "500gm, Priceg",
            "price": "\$4.99",
            "image": "lib/assets/images/cheese.png",
          },
          {
            "name": "Eggs",
            "unit": "12pcs, Priceg",
            "price": "\$3.49",
            "image": "lib/assets/images/eggs.png",
          },
          {
            "name": "Butter",
            "unit": "250gm, Priceg",
            "price": "\$2.79",
            "image": "lib/assets/images/butter.png",
          },
        ],
      },
      {
        "name": "Cooking Oil & Ghee",
        "image": "lib/assets/images/oil.png",
        "desc": "Best oils for daily cooking.",
        "subItems": [
          {
            "name": "Olive Oil",
            "unit": "1L, Priceg",
            "price": "\$8.99",
            "image": "lib/assets/images/olive_oil.png",
          },
          {
            "name": "Sunflower Oil",
            "unit": "1L, Priceg",
            "price": "\$5.99",
            "image": "lib/assets/images/sunflower_oil.png",
          },
          {
            "name": "Ghee",
            "unit": "500gm, Priceg",
            "price": "\$6.49",
            "image": "lib/assets/images/ghee.png",
          },
        ],
      },
      {
        "name": "Bakery & Snacks",
        "image": "lib/assets/images/bakery.png",
        "desc": "Tasty baked goods and snacks.",
        "subItems": [
          {
            "name": "Bread",
            "unit": "500gm, Priceg",
            "price": "\$1.99",
            "image": "lib/assets/images/bread.png",
          },
          {
            "name": "Cookies",
            "unit": "250gm, Priceg",
            "price": "\$2.49",
            "image": "lib/assets/images/cookies.png",
          },
          {
            "name": "Croissant",
            "unit": "3pcs, Priceg",
            "price": "\$3.99",
            "image": "lib/assets/images/croissant.png",
          },
        ],
      },
      {
        "name": "Beverages",
        "image": "lib/assets/images/beverages.png",
        "desc": "Drinks to refresh your day.",
        "subItems": [
          {
            "name": "Juice",
            "unit": "1L, Priceg",
            "price": "\$2.99",
            "image": "lib/assets/images/juice.png",
          },
          {
            "name": "Soda",
            "unit": "1.5L, Priceg",
            "price": "\$1.49",
            "image": "lib/assets/images/soda.png",
          },
          {
            "name": "Coffee",
            "unit": "200gm, Priceg",
            "price": "\$5.99",
            "image": "lib/assets/images/coffee.png",
          },
          {
            "name": "Tea",
            "unit": "250gm, Priceg",
            "price": "\$3.49",
            "image": "lib/assets/images/tea.png",
          },
        ],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 20.0),
            child: Text('My Cart', style: roboto(700).copyWith(fontSize: 22)),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0), 
            child: Divider(
              height: 1,
              thickness: 1,
              color: Color(0xFFE2E2E2),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: CustomDropdown(
            name: 'Food Type',
            items: mockCategoryData,
            onSelect: (value) {
              debugPrint('Selected: $value');
            },
          ),
        ),
      ),
    );
  }
}
