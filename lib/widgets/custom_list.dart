// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomList extends StatelessWidget {
  final String text;

  const CustomList({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.check,
          color: Color(0xFF5A5266),
          size: 30,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF5A5266)),
        )
      ],
    );
  }
}
