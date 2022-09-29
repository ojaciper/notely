import 'package:flutter/material.dart';
import 'package:notely/screens/premium_screen.dart';
import 'package:notely/widgets/custom_button.dart';
import 'package:notely/widgets/custom_text_field.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  // textEditting controller
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 45),
              const Text(
                "NOTELY",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                // textAlign: TextAlign.center,
              ),
              const Spacer(),
              const Text(
                "Create a free account",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Join Notely for free. Create and share unlimited notes with your friends.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    text: "Full Name",
                    hintText: "Salman Khan",
                    controller: nameController,
                  ),
                  const SizedBox(height: 25),
                  CustomTextField(
                    text: "Email Address",
                    hintText: "mesalmanwap@gmail.com",
                    controller: emailController,
                  ),
                  const SizedBox(height: 25),
                  CustomTextField(
                    text: "Password",
                    hintText: "############",
                    controller: passwordController,
                  ),
                ],
              ),
              const Spacer(flex: 1),
              CustomButton(
                  text: "Create Account",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PremiumScreen(),
                      ),
                    );
                  }),
              const SizedBox(height: 10),
              const Text(
                "Already have an account?",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFD9614C)),
              ),
              const Spacer(flex: 1)
            ],
          ),
        ),
      ),
    );
  }
}
