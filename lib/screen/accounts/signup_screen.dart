import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/controllers/authentication.dart';
import 'package:realestateapi/screen/accounts/accountscreen.dart';

import '../widgets/input_widget.dart';
import '../widgets/navigation_drawer.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _adminRoles = [
    "interior_decorator",
    "user",
    "agents",
    "developer",
  ];
  String _selectedRole = "";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwwordController = TextEditingController();

  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  _SignupScreenState() {
    _selectedRole = _adminRoles[3];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
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
            Padding(
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      Builder(builder: (context) {
                        return GestureDetector(
                          onTap: () => Scaffold.of(context).openDrawer(),
                          child: const Icon(
                            Icons.menu_open_rounded,
                            color: Colors.white,
                            size: 32,
                          ),
                        );
                      }),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Welcome back',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      20,
                    ),
                    topRight: Radius.circular(
                      20,
                    ),
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
                        hintText: "Full name",
                        icon: Icons.person,
                        controller: emailController,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InputWidget(
                        hintText: "Email Address",
                        icon: Icons.email,
                        controller: emailController,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 15,
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
                      DropdownButtonFormField(
                        value: _selectedRole,
                        items: _adminRoles
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            _selectedRole = val as String;
                            debugPrint(_selectedRole);
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down_circle,
                          color: Colors.deepPurple,
                        ),
                        decoration: const InputDecoration(
                          labelText: "Register as:",
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          prefixIcon: Icon(
                            Icons.accessible,
                            color: Colors.brown,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() {
                        return _authenticationController.isLoading.value
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
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
                                onPressed: () async {
                                  await _authenticationController.register(
                                    name: nameController.text.trim(),
                                    email: emailController.text.trim(),
                                    password: passwwordController.text.trim(),
                                    roles: _selectedRole,
                                  );
                                },
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                      }),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                Get.to(() => const UserAccountScreen());
                              },
                              child: RichText(
                                softWrap: true,
                                text: const TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(text: "Already Registered? "),
                                      TextSpan(text: "Click here to Login")
                                    ]),
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
