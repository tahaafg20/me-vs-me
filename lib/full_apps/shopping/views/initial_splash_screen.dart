import 'package:me_vs_me/full_apps/shopping/controllers/splash_screen2_controller.dart';
import 'package:me_vs_me/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class InitialSplashScreen extends StatefulWidget {
  const InitialSplashScreen({Key? key}) : super(key: key);

  @override
  _InitialSplashScreenState createState() => _InitialSplashScreenState();
}

class _InitialSplashScreenState extends State<InitialSplashScreen> {
  late ThemeData theme;

  late InitialSplashScreenController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingTheme;
    controller = FxControllerStore.putOrFind(InitialSplashScreenController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<InitialSplashScreenController>(
        controller: controller,
        builder: (controller) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: "splash_username",
                    child: FxText.titleLarge(
                      "Welcome",
                      fontWeight: 700,
                    ),
                  ),
                  FxText.bodySmall(
                    "Wait here, we are fetching data",
                  ),
                ],
              ),
            ),
          );
        });
  }
}
