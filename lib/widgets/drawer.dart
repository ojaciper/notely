import 'package:flutter/material.dart';
import 'package:notely/widgets/drawer_list_tile.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 60),
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "NOTELY",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 60),
            Container(
              // padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: const Color(0xFFE5D5C5),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image.asset(
                'assets/images/profile_img.png',
                width: 150,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Shambhavi Mishra',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Lucknow, India',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: const [
                  DrawerListTile(
                    title: "Buy Premium",
                    leadingIcon: Icons.person,
                    trailingIcon: Icons.arrow_forward_ios,
                  ),
                  SizedBox(height: 10),
                  DrawerListTile(
                    title: "Edit Profile",
                    leadingIcon: Icons.edit,
                    trailingIcon: Icons.arrow_forward_ios,
                  ),
                  SizedBox(height: 10),
                  DrawerListTile(
                    title: "App Theme",
                    leadingIcon: Icons.style,
                    trailingIcon: Icons.arrow_forward_ios,
                  ),
                  SizedBox(height: 10),
                  DrawerListTile(
                    title: "Notifications",
                    leadingIcon: Icons.notifications,
                    trailingIcon: Icons.arrow_forward_ios,
                  ),
                  SizedBox(height: 10),
                  DrawerListTile(
                    title: "Security",
                    leadingIcon: Icons.folder,
                    trailingIcon: Icons.arrow_forward_ios,
                  ),
                  SizedBox(height: 10),
                  DrawerListTile(
                    title: "Log Out",
                    leadingIcon: Icons.logout,
                    trailingIcon: Icons.arrow_forward_ios,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
