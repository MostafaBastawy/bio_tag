import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final Color color;
  final double size;

  const Logo({
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/logo.png",
      width: 50,
      height: 50,
    );
  }
}
