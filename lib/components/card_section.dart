import 'package:flutter/material.dart';
import 'package:training_project/utils/globalFormat.dart';

class CardSection extends StatelessWidget {
  final String title;
  final List<Map<String, String>> items;

  const CardSection({Key? key, required this.title, required this.items})
    : super(key: key);

  Color parseColor(String? colorStr, {int alphaHex = 0x30}) {
    if (colorStr == null) return Colors.grey.shade200;
    try {
      final value = int.parse(colorStr);
      return Color(value).withAlpha(alphaHex);
    } catch (_) {
      return Colors.grey.shade200;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 175 / 190,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          final borderColor = Color(
            int.tryParse(item["color"] ?? "0xFFCCCCCC") ?? 0xFFCCCCCC,
          );
          final bgColor = parseColor(item["color"]);

          return Container(
            decoration: BoxDecoration(
              color: bgColor,
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(12),
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      item["image"]!,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      item["name"]!,
                      style: roboto(700).copyWith(fontSize: 18),
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
