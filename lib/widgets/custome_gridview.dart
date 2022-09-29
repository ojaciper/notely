import 'package:flutter/material.dart';
import 'package:notely/model/notes_model.dart';

class CustomGridView extends StatelessWidget {
  final Notes notes;
  const CustomGridView({Key? key, required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDFA),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            notes.title!,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Color(0xFF595550),
                height: 1.5),
          ),
          const SizedBox(height: 10),
          Text(
            notes.description!,
            style: const TextStyle(
              fontSize: 14,
              height: 1.8,
              fontWeight: FontWeight.w400,
              color: Color(0xFF595550),
            ),
          ),
        ],
      ),
    );
  }
}
