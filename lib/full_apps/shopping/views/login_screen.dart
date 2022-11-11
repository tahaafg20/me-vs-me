import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:me_vs_me/images.dart';
import 'package:me_vs_me/theme/app_theme.dart';

import '../../../theme/constant.dart';
import '../controllers/login_controller.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen>
    with TickerProviderStateMixin {
  late ThemeData theme;
  late LogInController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingTheme;
    controller = FxControllerStore.putOrFind(LogInController(this));
    outlineInputBorder = OutlineInputBorder(
      borderRadius:
          BorderRadius.all(Radius.circular(Constant.textFieldRadius.medium)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<LogInController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    return Scaffold(
      body: ListView(
        padding: FxSpacing.fromLTRB(24, 50, 24, 0),
        children: [
          FxTwoToneIcon(
            FxTwoToneMdiIcons.menu_book,
            color: theme.colorScheme.primary,
            size: 64,
          ),
          FxSpacing.height(20),
          Center(
            child: FxText.displaySmall("Log In",
                color: theme.colorScheme.primary, fontWeight: 800),
          ),
          FxSpacing.height(32),
          Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  style:
                      FxTextStyle.bodyMedium(color: theme.colorScheme.primary),
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      isDense: true,
                      labelStyle: FxTextStyle.bodyMedium(),
                      fillColor: theme.colorScheme.primaryContainer,
                      prefixIcon: Icon(
                        FeatherIcons.mail,
                        color: theme.colorScheme.primary,
                      ),
                      hintText: "Email Address",
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      border: outlineInputBorder,
                      contentPadding: FxSpacing.all(16),
                      hintStyle: FxTextStyle.bodyMedium(
                          color: theme.colorScheme.primary),
                      isCollapsed: true),
                  maxLines: 1,
                  controller: controller.emailTE,
                  validator: controller.validateEmail,
                  cursorColor: theme.colorScheme.onPrimaryContainer,
                ),
                FxSpacing.height(20),
                TextFormField(
                  style:
                      FxTextStyle.bodyMedium(color: theme.colorScheme.primary),
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      isDense: true,
                      fillColor: theme.colorScheme.primaryContainer,
                      prefixIcon: Icon(
                        FeatherIcons.lock,
                        color: theme.colorScheme.primary,
                      ),
                      hintText: "Password",
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      border: outlineInputBorder,
                      contentPadding: FxSpacing.all(16),
                      hintStyle: FxTextStyle.bodyMedium(
                          color: theme.colorScheme.primary),
                      isCollapsed: true),
                  maxLines: 1,
                  controller: controller.passwordTE,
                  validator: controller.validatePassword,
                  cursorColor: theme.colorScheme.onBackground,
                ),
              ],
            ),
          ),
          FxSpacing.height(20),
          Align(
            alignment: Alignment.centerRight,
            child: FxButton.text(
                onPressed: () {
                  controller.goToForgotPasswordScreen();
                },
                padding: FxSpacing.zero,
                splashColor: theme.colorScheme.primaryContainer,
                child: FxText.labelMedium("Forgot Password?",
                    color: theme.colorScheme.primary)),
          ),
          FxSpacing.height(20),
          FxButton.block(
            borderRadiusAll: Constant.buttonRadius.large,
            onPressed: () {
              controller.login();
            },
            elevation: 0,
            backgroundColor: theme.colorScheme.primary,
            child: FxText.labelLarge(
              "Log In",
              color: theme.colorScheme.onPrimary,
            ),
          ),
          FxSpacing.height(16),
          FxButton.text(
            onPressed: () {
              controller.goToRegisterScreen();
            },
            splashColor: theme.colorScheme.primaryContainer,
            child: FxText.labelMedium("I don\'t have an account",
                decoration: TextDecoration.underline,
                color: theme.colorScheme.primary),
          ),
          FxSpacing.height(20),
          Row(
            children: [
              Expanded(child: Divider()),
              Padding(
                padding: FxSpacing.x(20),
                child: FxText.bodySmall(
                  'Or continue with',
                  muted: true,
                  fontWeight: 600,
                  fontSize: 10,
                ),
              ),
              Expanded(child: Divider()),
            ],
          ),
          FxSpacing.height(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FxContainer.bordered(
                padding: FxSpacing.all(16),
                borderRadiusAll: 8,
                child: Image(
                  height: 24,
                  width: 24,
                  image: AssetImage(Images.google),
                ),
              ),
              FxContainer.bordered(
                padding: FxSpacing.all(16),
                borderRadiusAll: 8,
                child: Image(
                  height: 24,
                  width: 24,
                  image: AssetImage(Images.apple),
                ),
              ),
              FxContainer.bordered(
                padding: FxSpacing.all(16),
                borderRadiusAll: 8,
                child: Image(
                  height: 24,
                  width: 24,
                  image: AssetImage(Images.facebook),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
