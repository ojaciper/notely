import 'package:flutter/material.dart';
import 'package:notely/screens/create_note.dart';
import 'package:notely/widgets/custom_button.dart';
import 'package:notely/widgets/custom_list.dart';
import 'package:notely/widgets/subscribe_card.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({Key? key}) : super(key: key);

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Notely Premium",
          style: TextStyle(
            color: Color(0xFF403B36),
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.cancel_rounded),
              color: Colors.black,
            ),
          )
        ],
        centerTitle: true,
        toolbarHeight: 75,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/img2.png',
              width: 250,
            ),
            const SizedBox(height: 25),
            const Text(
              "Start Using Notely\n with Premium Benefits",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w600,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const CustomList(text: "Save unlimited notes to a single project"),
            const SizedBox(height: 10),
            const CustomList(text: "Create unlimited projects and teams"),
            const SizedBox(height: 10),
            const CustomList(text: "Daily backups to keep your data safe"),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubscribeCard(
                  toggle: toggle,
                  title: "Annuel",
                  amt: 77.99,
                  subTitle: "per year",
                  onTap: () {
                    setState(() {
                      if (!toggle) {
                        toggle = true;
                      } else {
                        toggle = false;
                      }
                    });
                  },
                  color: !toggle ? Colors.white : const Color(0xFFF47F6B),
                ),
                SubscribeCard(
                  toggle: false,
                  title: "Monthly",
                  amt: 7.99,
                  subTitle: "per month",
                  onTap: () {
                    setState(
                      () {
                        if (!toggle) {
                          toggle = true;
                        } else {
                          toggle = false;
                        }
                      },
                    );
                  },
                  color: toggle ? Colors.white : const Color(0xFFF47F6B),
                ),
              ],
            ),
            const SizedBox(height: 40),
            CustomButton(
                text: "SUBSCRIBE",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateNote(),
                      ));
                }),
            const SizedBox(height: 10),
            const Text(
              "Restore Purchase",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xFFD9614C),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
