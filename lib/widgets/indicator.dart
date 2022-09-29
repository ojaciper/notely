import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInCubic,
      duration: const Duration(milliseconds: 300),
      height: isActive ? 12 : 10,
      width: isActive ? 12 : 10,
      decoration: BoxDecoration(
        color: isActive
            ? const Color(0xFFD9614C)
            : const Color(0xFFD9614C).withOpacity(0.7),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
