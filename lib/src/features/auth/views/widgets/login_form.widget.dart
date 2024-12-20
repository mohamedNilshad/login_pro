import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:login_pro/src/core/constants/app_colors.dart';
import 'package:login_pro/src/core/constants/app_strings.dart';
import 'package:login_pro/src/core/constants/sizes.dart';
import 'package:login_pro/src/core/utils/helpers/helper_functions.dart';
import 'package:login_pro/src/core/views/widgets/custom.circular_progress_indicator.dart';
import 'package:login_pro/src/features/auth/view_models/auth.view_model.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _usernameController;
  late TextEditingController _passController;
  bool obscurePass = true;
  bool loading = false;

  Future<void> login() async {
    if (loading) return;
    setState(() => loading = true);
    try {
      String baseUrl = 'https://api.ezuite.com/api/External_Api/Mobile_Api/Invoke';
      String userName = _usernameController.text.trim();
      String password = _passController.text.trim();
      context.read<AuthViewModel>().login(baseUrl, userName, password, context).then((_) {

      });

    } on Exception {
      setState(() => loading = false);
    }
    setState(() => loading = false);
  }

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _usernameController,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color:AppColors.black),
            decoration: const InputDecoration(
              labelText: AppStrings.userNameLabel,
              alignLabelWithHint: true,
              prefixIcon: Icon(Iconsax.sms),
            ),
          ),
          const SizedBox(height: Sizes.spaceBtwInputField),
          TextFormField(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: obscurePass,
            style: const TextStyle(color:AppColors.black),
            decoration: InputDecoration(
              labelText: AppStrings.passwordLabel,
              alignLabelWithHint: true,
              prefixIcon: const Icon(Iconsax.lock),
              suffixIcon: IconButton(
                  onPressed: () => setState(() => obscurePass = !obscurePass),
                  icon: Icon(
                    obscurePass ? Iconsax.eye_slash : Iconsax.eye,
                  )),
            ),
          ),
          const SizedBox(height: Sizes.spaceBtwItems),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(HelperFunctions.screenWidth(context), Sizes.buttonHeight)
            ),
            onPressed: loading ? null : () {
              login();
              },
            child: Visibility(
              visible: !loading,
              replacement:const CCircularProgressIndicator(),
              child: const Text(AppStrings.loginLabel),
            ),
          ),
          const SizedBox(height: Sizes.spaceBtwInputField),
        ],
      ),
    );
  }
}
