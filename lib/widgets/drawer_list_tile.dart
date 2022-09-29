import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final IconData trailingIcon;
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.leadingIcon,
    required this.trailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          leadingIcon,
          color: const Color(0xFFD9614C),
          size: 30,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF595555),
          ),
        ),
      ),
      trailing: Icon(trailingIcon),
    );
  }
}
