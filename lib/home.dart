import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> exclusiveOffers = [
    {"name": "Organic Bananas", "price": "\$4.99", "image": "lib/assets/images/banana.png"},
    {"name": "Red Apple", "price": "\$4.99", "image": "lib/assets/images/apple.png"},
    {"name": "Organic Bananas", "price": "\$4.99", "image": "lib/assets/images/banana.png"},
    {"name": "Red Apple", "price": "\$4.99", "image": "lib/assets/images/apple.png"},
  ];

  final List<Map<String, String>> bestSelling = [
    {"name": "Bell Pepper Red", "price": "\$4.99", "image": "lib/assets/images/bellPepper.png"},
    {"name": "Ginger", "price": "\$4.99", "image": "lib/assets/images/ginger.png"},
    {"name": "Bell Pepper Red", "price": "\$4.99", "image": "lib/assets/images/bellPepper.png"},
    {"name": "Ginger", "price": "\$4.99", "image": "lib/assets/images/ginger.png"},
  ];

  final List<Map<String, String>> groceries = [
    {"name": "Beef Bone", "price": "\$4.99", "image": "lib/assets/images/beef.png"},
    {"name": "Broiler Chicken", "price": "\$4.99", "image": "lib/assets/images/chicken.png"},
    {"name": "Beef Bone", "price": "\$4.99", "image": "lib/assets/images/beef.png"},
    {"name": "Broiler Chicken", "price": "\$4.99", "image": "lib/assets/images/chicken.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: roboto(400),
        unselectedLabelStyle: roboto(400),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.manage_search_rounded), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined), label: 'Favourite'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: 'Account'),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Image.asset(
              'lib/assets/images/carrot.png',
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on, color: Colors.black54),
                const SizedBox(width: 8),
                Text("Dhaka, Banassre", style: roboto(700)),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey.shade200,
                filled: true,

                hintText: 'Search Store',
                hintStyle: roboto(400),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            
              
                Image.asset(
                  'lib/assets/images/banner.png',
                  height: 80,
                  fit: BoxFit.cover,
              ),
           
            const SizedBox(height: 24),
            buildSection("Exclusive Offer", exclusiveOffers),
            const SizedBox(height: 24),
            buildSection("Best Selling", bestSelling),
            const SizedBox(height: 24),
            Text("Groceries", style: roboto(700).copyWith(fontSize: 18)),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Container(
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
                              height: 30,
                            ),
                            Text("Pulses", style: roboto(400)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'lib/assets/images/rice.png',
                              height: 30,
                            ),
                            Text("Rice", style: roboto(400)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            buildSection("", groceries),
          ],
        ),
      ),
    );
  }

  Widget buildSection(String title, List<Map<String, String>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: roboto(700).copyWith(fontSize: 18)),
              Text("See all", style: roboto(400).copyWith(color: Colors.green)),
            ],
          ),
        const SizedBox(height: 12),
        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final item = items[index];
              return Container(
                width: 175,
          
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      item["image"]!,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 8),
                    Text(item["name"]!, textAlign: TextAlign.center, style: roboto(400)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item["price"]!, style: roboto(700)),
                        
                        const IconButton(
                          color: Colors.black,
                          icon: Icon(Icons.add, color: Colors.orange),
                          onPressed: null,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  TextStyle roboto(int weight) {
    return TextStyle(fontFamily: 'RobotoRoboto', fontWeight: FontWeight.values.firstWhere(
      (fw) => fw.index * 100 == weight,
      orElse: () => FontWeight.normal,
    ));
  }
}
