import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF53B175); // Ví dụ: màu xanh đậm
TextStyle roboto(int weight) {
  return TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.values.firstWhere(
      (fw) => fw.index * 100 == weight,
      orElse: () => FontWeight.normal,
    ),
  );
}
