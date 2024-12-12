import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/screen/accounts/signup_screen.dart';
import 'package:realestateapi/screen/widgets/input_widget.dart';

class UserAccountScreen extends StatefulWidget {
  const UserAccountScreen({super.key});

  @override
  State<UserAccountScreen> createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.red.shade900,
              Colors.red.shade700,
              Colors.red.shade400
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            const Padding(
              padding: EdgeInsets.all(
                20.0,
              ),
              child: HeaderWidget(),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    18.0,
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/logoshelter.png",
                        width: 100,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputWidget(
                        hintText: "Email Address",
                        icon: Icons.email,
                        controller: emailController,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InputWidget(
                        hintText: "Password",
                        icon: Icons.lock_open_rounded,
                        controller: passwwordController,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 10,
                          ),
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                Get.to(() => const SignupScreen());
                              },
                              child: Text(
                                "Signup",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Welcome back',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          )
        ]);
  }
}
