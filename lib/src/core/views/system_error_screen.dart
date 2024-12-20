import 'package:flutter/material.dart';
import 'package:login_pro/src/app/route/route.constants.dart';
import 'package:login_pro/src/core/constants/app_strings.dart';


class CustomSystemErrorScreen extends StatelessWidget {
  const CustomSystemErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(child: Directionality(
      textDirection: TextDirection.ltr,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              AppStrings.appUnrecognisedError,
            ),
            const SizedBox(height: 50),
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context, RouteConstants.loginScreen,
                  ModalRoute.withName('/'),
                );
              },
              child: const Text("Go back"),
            ),
          ],
        ),
      ),
    ));
  }
}
