import 'package:flutter/material.dart';

class ProductSection extends StatelessWidget {
  final String title;
  final List<Map<String, String>> items;

  const ProductSection({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  TextStyle roboto(int weight) {
    return TextStyle(
      fontFamily: 'RobotoRoboto',
      fontWeight: FontWeight.values.firstWhere(
        (fw) => fw.index * 100 == weight,
        orElse: () => FontWeight.normal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    Text(item["name"]!, style: roboto(700)),
                    const SizedBox(height: 5),
                    Text(item["unit"]!, style: roboto(100)),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item["price"]!, style: roboto(700).copyWith(fontSize: 22)),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF53B175),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const IconButton(
                            icon: Icon(Icons.add, color: Colors.white, size: 28),
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
}
