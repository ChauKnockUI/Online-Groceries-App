import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
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
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
          
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: BottomNavigationBar(
            currentIndex: 0,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.black,
            selectedLabelStyle: roboto(400),
            unselectedLabelStyle: roboto(400),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.store_mall_directory_outlined, size: 35),
                label: 'Shop',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.manage_search_rounded, size: 40),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined, size: 35),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined, size: 35),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_rounded, size: 40),
                label: 'Account',
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
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
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    top: 12,
                    bottom: 12,
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 40,
                  ),
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
            buildSection("Exclusive Offer", exclusiveOffers),
            const SizedBox(height: 34),
            buildSection("Best Selling", bestSelling),
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
                            Text("Pulses", style: roboto(700).copyWith(fontSize: 22)),
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
                            Image.asset(
                              'lib/assets/images/rice.png',
                              height: 80,
                            ),
                            const SizedBox(width: 22),
                            Text("Rice", style: roboto(700).copyWith(fontSize: 22)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
        const SizedBox(height: 16),
        SizedBox(
          height: 265,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final item = items[index];
              return Container(
                width: 190,

                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Image.asset(item["image"]!, height: 100, fit: BoxFit.cover),
                    const SizedBox(height: 20),
                    Text(
                      item["name"]!,
                      textAlign: TextAlign.start,
                      style: roboto(700),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      item["unit"]!,
                      textAlign: TextAlign.start,
                      style: roboto(100),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item["price"]!,
                          style: roboto(700).copyWith(fontSize: 22),
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF53B175),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 28,
                            ),
                            onPressed: null,
                          ),
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
    return TextStyle(
      fontFamily: 'RobotoRoboto',
      fontWeight: FontWeight.values.firstWhere(
        (fw) => fw.index * 100 == weight,
        orElse: () => FontWeight.normal,
      ),
    );
  }
}
