import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';
import 'package:realestateapi/common/widget/divider.dart';
import 'package:realestateapi/utils/constants/text_strings.dart';
import 'package:realestateapi/controllers/login_controller.dart';
import 'package:realestateapi/screen/accounts/forget_password.dart';
import 'package:realestateapi/screen/accounts/registration.dart';
import 'package:realestateapi/screen/login/widgets/login_footer.dart';
import 'package:realestateapi/screen/login/widgets/login_header.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

class LoginSigninScreen extends StatefulWidget {
  const LoginSigninScreen({super.key});

  @override
  State<LoginSigninScreen> createState() => _LoginSigninScreenState();
}

class _LoginSigninScreenState extends State<LoginSigninScreen> {
  LoginController loginController = Get.put(LoginController());
  final _loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Logo

              const TLoginHeader(),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //Form inputs for Login

              Form(
                key: _loginKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: TSizes.spaceBtwSections,
                  ),
                  child: Column(
                    children: [
                      //Email
                      TextFormField(
                        controller: loginController.emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.direct_right),
                          labelText: TTexts.email,
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields,
                      ),
                      TextFormField(
                        controller: loginController.passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                        obscureText: true,
                        obscuringCharacter: "*",
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.password_check),
                            suffixIcon: Icon(
                              Iconsax.eye_slash,
                            ),
                            labelText: TTexts.password),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields / 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Remember me
                          Row(
                            children: [
                              Checkbox(value: true, onChanged: (value) {}),
                              const Text(TTexts.rememberMe),
                            ],
                          ),

                          //Forget Password
                          TextButton(
                            onPressed: () => Get.to(
                              () => const ForgetPasswordScreen(),
                            ),
                            child: const Text(
                              TTexts.forgetPassword,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      //Signin Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_loginKey.currentState!.validate()) {
                              loginController.loginWithEmail();
                            }
                          },
                          child: const Text("Sign In"),
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      //Create Account Button
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: OutlinedButton(
                          onPressed: () =>
                              Get.to(() => const RegistrationScreen()),
                          child: const Text("Create Account"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Divider
              TLoginDivider(
                dividerText: TTexts.signInWith.capitalize!,
              ),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //Footer
              const TLoginFooter()
            ],
          ),
        ),
      ),
    );
  }
}
