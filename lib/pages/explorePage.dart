import 'package:flutter/material.dart';
import 'package:training_project/components/card_section.dart';
import 'package:training_project/utils/globalFormat.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final List<Map<String, String>> category = [
    {
      "name": "Frash Fruits \n& Vegetable",
      "image": "lib/assets/images/vegetable.png",
      "color": "0xFF82C69A"
    },
    {
      "name": "Cooking Oil \n& Ghee",
      "image": "lib/assets/images/oil.png",
      "color": "0xFFFABD7C"
    },
    {
      "name": "Meat & Fish",
      "image": "lib/assets/images/fish.png",
      "color": "0xFFF7A593"
    },
    {
      "name": "Bakery & Snacks",
      "image": "lib/assets/images/bakery.png",
      "color": "0xFFD3B0E0"
    },
    {
      "name": "Dairy & Eggs",
      "image": "lib/assets/images/milk.png",
      "color": "0xFFFDE598"
    },
    {
      "name": "Beverages",
      "image": "lib/assets/images/beverages.png",
      "color": "0xFFB7DFF5"
    },
    {
      "name": "Bakery & Snacks",
      "image": "lib/assets/images/vegetable.png",
      "color": "0xFFB7DFF5"
    },
    {
      "name": "Cooking Oil & Ghee",
      "image": "lib/assets/images/milk.png",
      "color": "0xFFB6A9F9"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text("Find Products", style: roboto(700).copyWith(fontSize: 25)),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                fillColor: Color(0xFFF2F3F2),
                filled: true,
                hintText: 'Search Store',
                hintStyle: roboto(
                  400,
                ).copyWith(fontSize: 20, color: Colors.black54),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    top: 10,
                    bottom: 10,
                  ),
                  child: IconButton(
                    onPressed: () => {print("search button was clicked")},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            CardSection(title: "", items: category),
          ],
        ),
      ),
    );
  }
}
