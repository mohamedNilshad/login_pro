
import 'package:flutter/material.dart';
import 'package:login_pro/src/core/constants/app_colors.dart';
import 'package:login_pro/src/core/constants/app_strings.dart';
import 'package:login_pro/src/core/constants/sizes.dart';
import 'package:login_pro/src/features/auth/views/widgets/login_form.widget.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.defaultSpace),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: Sizes.spaceBtwSections),
                Text(
                  AppStrings.loginLabel,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.black
                  ),
                ),
                const SizedBox(height: Sizes.spaceBtwSections),
                const LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
