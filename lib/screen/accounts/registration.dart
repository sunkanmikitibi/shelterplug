import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:realestateapi/common/widget/divider.dart';
import 'package:realestateapi/utils/constants/helpers/helper_functions.dart';
import 'package:realestateapi/utils/constants/text_strings.dart';
import 'package:realestateapi/controllers/registration_controller.dart';
import 'package:realestateapi/utils/theme/custom_themes/image_strings.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  _RegistrationScreenState() {
    _selectedVal = _userRoles[0];
  }
  final _userRoles = [
    "developer",
    "agents",
    "interior decorator",
    "property manager"
  ];
  String? _selectedVal = "";
  final _regKey = GlobalKey<FormState>();

  RegistrationController registrationController =
      Get.put(RegistrationController());
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _regKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage(
                        dark ? TImages.lightAppLogo : TImages.darkAppLogo,
                      ),
                      width: 100,
                    ),
                    Text(
                      TTexts.signUpText,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: TSizes.sm,
                    ),
                    Text(
                      TTexts.loginSubTitle,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                TextFormField(
                  controller: registrationController.nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Name",
                    prefixIcon: Icon(
                      Iconsax.user,
                    ),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                TextFormField(
                  controller: registrationController.emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: TTexts.email),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                TextFormField(
                  obscureText: true,
                  controller: registrationController.passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(
                      Iconsax.password_check,
                    ),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                DropdownButtonFormField(
                  value: _selectedVal,
                  items: _userRoles
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedVal = val;
                    });
                  },
                  icon: const Icon(Icons.arrow_drop_down_circle_rounded),
                  dropdownColor: Colors.deepPurple.shade50,
                  decoration: const InputDecoration(
                      labelText: "User Role",
                      prefixIcon: Icon(
                        Icons.accessibility_new_rounded,
                      ),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_regKey.currentState!.validate()) {
                        registrationController.registerWithEmail();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: const Text("Register"),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                TLoginDivider(
                  dividerText: TTexts.signUpWith.capitalize!,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
