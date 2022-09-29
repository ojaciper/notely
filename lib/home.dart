import 'package:flutter/material.dart';
import 'package:notely/onboard/screen/widget/onboard.dart';
import 'package:notely/screens/account_screen.dart';
import 'package:notely/utils/common.dart';
import 'package:notely/widgets/custom_button.dart';
import 'package:notely/widgets/indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController = PageController();
  int pageIndex = 0;

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF8EEE2),
      body: SafeArea(
          child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              "NOTELY",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          SizedBox(
            height: size.height * 0.5 + 5,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  pageIndex = index;
                });
              },
              itemCount: page.length,
              itemBuilder: (context, index) => Onboard(
                img: page[index].img,
                subTitle: page[index].subTitle,
                descrpt: page[index].descrpt,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                page.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(5),
                  child: Indicator(
                    isActive: index == pageIndex,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(flex: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: CustomButton(
              text: "GET STARTED",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountScreen()));
              },
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Already have an account?",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xFFD9614C)),
          ),
          const Spacer()
        ],
      )),
    );
  }
}
