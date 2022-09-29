// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final String hintText;
  final TextEditingController controller;
  const CustomTextField({
    Key? key,
    required this.text,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color(0xFFF2E5D5),
      ),
      borderRadius: BorderRadius.circular(16),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            fillColor: const Color(0xFFFFFDFA),
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 23, horizontal: 15),
            enabledBorder: border,
            focusedBorder: border,
            enabled: true,
          ),
        ),
      ],
    );
  }
}
