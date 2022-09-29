import 'package:flutter/material.dart';

class Onboard extends StatelessWidget {
  final String img;
  final String subTitle;
  final String descrpt;
  const Onboard({
    Key? key,
    required this.img,
    required this.subTitle,
    required this.descrpt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Image.asset(
            img,
            width: size.width * 0.7,
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: size.width * 0.8,
            child: Column(
              children: [
                Text(
                  subTitle,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  descrpt,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    height: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
