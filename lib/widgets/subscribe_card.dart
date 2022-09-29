import 'package:flutter/material.dart';

class SubscribeCard extends StatelessWidget {
  const SubscribeCard({
    Key? key,
    required this.toggle,
    required this.title,
    required this.amt,
    required this.subTitle,
    required this.onTap,
    required this.color,
  }) : super(key: key);
  final bool toggle;
  final String title;
  final double amt;
  final String subTitle;
  final VoidCallback onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFDFA),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: color,
            width: 5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF5A5266),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '\$ $amt',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Color(0xFF5A5266),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subTitle,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Color(0xFF5A5266),
              ),
            )
          ],
        ),
      ),
    );
  }
}
