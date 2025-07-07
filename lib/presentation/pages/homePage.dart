import 'package:flutter/material.dart';
import 'package:training_project/presentation/components/product_section.dart';
import 'package:training_project/utils/globalFormat.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<Map<String, String>> exclusiveOffers = [
    {
      "name": "Organic Bananas",
      "unit": "7pcs, Priceg",
      "price": "\$4.99",
      "image": "lib/assets/images/banana.png",
    },
    {
      "name": "Red Apple",
      "unit": "1kg, Priceg",
      "price": "\$4.99",
      "image": "lib/assets/images/apple.png",
    },
    {
      "name": "Organic Bananas",
      "unit": "7pcs, Priceg",
      "price": "\$4.99",
      "image": "lib/assets/images/banana.png",
    },
    {
      "name": "Red Apple",
      "unit": "1kg, Priceg",
      "price": "\$4.99",
      "image": "lib/assets/images/apple.png",
    },
  ];

  final List<Map<String, String>> bestSelling = [
    {
      "name": "Bell Pepper Red",
      "unit": "1kg, Priceg",
      "price": "\$4.99",
      "image": "lib/assets/images/bellPepper.png",
    },
    {
      "name": "Ginger",
      "unit": "250gm, Priceg",
      "price": "\$4.99",
      "image": "lib/assets/images/ginger.png",
    },
    {
      "name": "Bell Pepper Red",
      "unit": "1kg, Priceg",
      "price": "\$4.99",
      "image": "lib/assets/images/bellPepper.png",
    },
    {
      "name": "Ginger",
      "unit": "250gm, Priceg",
      "price": "\$4.99",
      "image": "lib/assets/images/ginger.png",
    },
  ];

  final List<Map<String, String>> groceries = [
    {
      "name": "Beef Bone",
      "unit": "1kg, Priceg",
      "price": "\$4.99",
      "image": "lib/assets/images/beef.png",
    },
    {
      "name": "Broiler Chicken",
      "unit": "1kg, Priceg",
      "price": "\$4.99",
      "image": "lib/assets/images/chicken.png",
    },
    {
      "name": "Beef Bone",
      "unit": "1kg, Priceg",
      "price": "\$4.99",
      "image": "lib/assets/images/beef.png",
    },
    {
      "name": "Broiler Chicken",
      "unit": "1kg, Priceg",
      "price": "\$4.99",
      "image": "lib/assets/images/chicken.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Image.asset('lib/assets/images/carrot.png', height: 50),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on, color: Colors.black54, size: 30),
              const SizedBox(width: 8),
              Text(
                "Dhaka, Banassre",
                style: roboto(700).copyWith(fontSize: 18),
              ),
            ],
          ),
          const SizedBox(height: 25),
          TextField(
            decoration: InputDecoration(
              fillColor: Color(0xFFF2F3F2),
              filled: true,
              hintText: 'Search Store',
              hintStyle: roboto(
                400,
              ).copyWith(fontSize: 20, color: Colors.black54),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 12, bottom: 12),
                // child: const Icon(Icons.search, color: Colors.black, size: 40),
                child: IconButton(onPressed: ()=>{print("search button was clicked")}, icon:const Icon(Icons.search, color: Colors.black, size: 40)),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 24),

          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'lib/assets/images/banner.png',
              height: 125,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 44),
          ProductSection(title: "Exclusive Offer", items: exclusiveOffers),
          const SizedBox(height: 34),
          ProductSection(title: "Best Selling", items: bestSelling),
          const SizedBox(height: 24),
          Text("Groceries", style: roboto(700).copyWith(fontSize: 18)),
          const SizedBox(height: 12),

          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 280,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'lib/assets/images/pulses.png',
                            height: 80,
                          ),
                          const SizedBox(width: 22),
                          Text(
                            "Pulses",
                            style: roboto(700).copyWith(fontSize: 22),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 16),
                Container(
                  width: 280,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset('lib/assets/images/rice.png', height: 80),
                          const SizedBox(width: 22),
                          Text(
                            "Rice",
                            style: roboto(700).copyWith(fontSize: 22),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
          ProductSection(title: "", items: groceries),
        ],
      ),
    );
  }

}
