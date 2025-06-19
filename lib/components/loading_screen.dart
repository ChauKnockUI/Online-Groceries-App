import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.7),
      alignment: Alignment.center,
      child: const CircularProgressIndicator(
        color: Colors.black,
        strokeWidth: 2.0,
      ),
    );
  }
}
