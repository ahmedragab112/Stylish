import 'package:flutter/material.dart';

class CustomBottomNavIcon extends StatelessWidget {
  const CustomBottomNavIcon({super.key, required this.icon});

  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Icon(
        icon,
        size: 25,
      ),
    );
  }
}
