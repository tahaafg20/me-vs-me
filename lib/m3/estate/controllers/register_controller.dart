import 'package:me_vs_me/m3/estate/views/full_app_screen.dart';
import 'package:me_vs_me/m3/estate/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class RegisterController extends FxController {
  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  void goToHomeScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => FullAppScreen()),
    );
  }

  void goToLoginScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  String getTag() {
    return "register_controller";
  }
}
