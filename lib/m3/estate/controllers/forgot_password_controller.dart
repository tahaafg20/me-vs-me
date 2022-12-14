import 'package:me_vs_me/m3/estate/views/full_app_screen.dart';
import 'package:me_vs_me/m3/estate/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class ForgotPasswordController extends FxController {
  late TextEditingController emailController = TextEditingController();

  @override
  String getTag() {
    return "forgot_password_controller";
  }

  void goToHome() {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(builder: (context) => FullAppScreen()),
    );
  }

  void goToRegisterScreen() {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(builder: (context) => RegisterScreen()),
    );
  }
}
