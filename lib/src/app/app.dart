
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_pro/src/app/route/route.constants.dart';
import 'package:login_pro/src/app/route/route.dart';
import 'package:login_pro/src/core/constants/app_strings.dart';
import 'package:login_pro/src/core/utils/helpers/helper_functions.dart';
import 'package:login_pro/src/features/auth/view_models/auth.view_model.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});
  static final navigatorKey = GlobalKey<NavigatorState>();
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    if (HelperFunctions.isDarkMode(context) && HelperFunctions.isAndroid()) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ));
    }
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(create: (_) => AuthViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: App.navigatorKey,
        title: AppStrings.brandLabel,
        initialRoute: RouteConstants.loginScreen,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
