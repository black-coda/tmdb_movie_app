import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdb_movie_app/src/constant/konstant.dart';
import 'package:tmdb_movie_app/src/debug/devtool.dart';
import 'package:tmdb_movie_app/src/onboard/view/widget/btn.dart';
import 'package:tmdb_movie_app/src/shared/loading_overlay.dart';

import '../widgets/form_widget.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final AuthValidators authValidators = AuthValidators();

  bool obscureText = false;

  // controllers

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;

  // create focus nodes

  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordNode;
  late FocusNode firstNameNode;
  late FocusNode lastNameNode;

  @override
  void initState() {
    super.initState();
    // Form Based
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();

    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordNode = FocusNode();
    firstNameNode = FocusNode();
    lastNameNode = FocusNode();
    //* Animation Based
  }

  @override
  void dispose() {
    super.dispose();

    // controller
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();

    // Focus node
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordNode.dispose();
    lastNameNode.dispose();
    firstNameNode.dispose();
  }

  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff070F4C),
                  Color(0xff070F4C),
                  Color(0xff05031D),
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, bottom: 16, top: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Create Your Account",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Colors.white, fontSize: 40),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "You'll use this to watch on your favorite devices.",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w100,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "*Indicate a required field",
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w100,
                                ),
                      ),
                      const SizedBox(height: 24),
                      DynamicInputWidget(
                        isNonPasswordField: true,
                        controller: emailController,
                        obscureText: false,
                        focusNode: emailFocusNode,
                        prefIcon: null,
                        labelText: "Email Address *",
                        textInputAction: TextInputAction.next,
                        validator: authValidators.emailValidator,
                      ),
                      const SizedBox(height: 32),
                      DynamicInputWidget(
                        isNonPasswordField: false,
                        controller: passwordController,
                        obscureText: obscureText,
                        focusNode: passwordFocusNode,
                        prefIcon: null,
                        labelText: "Password *",
                        textInputAction: TextInputAction.next,
                        toggleObscureText: toggleObscureText,
                        onFieldSubmitted: (value) {
                          passwordController.text = value;
                        },
                        validator: authValidators.passwordWordValidator,
                      ),
                      const SizedBox(height: 32),
                      DynamicInputWidget(
                        isNonPasswordField: true,
                        controller: confirmPasswordController,
                        obscureText: obscureText,
                        focusNode: confirmPasswordNode,
                        prefIcon: null,
                        labelText: "Confirm Password *",
                        textInputAction: TextInputAction.next,
                        toggleObscureText: toggleObscureText,
                        validator: (value) {
                          final String password1 =
                              passwordController.text.trim();
                          if (value != null && password1 == value) {
                            return null;
                          }
                          return "Password not same";
                        },
                      ),
                      const SizedBox(height: 32),
                      DynamicInputWidget(
                        isNonPasswordField: true,
                        controller: firstNameController,
                        obscureText: false,
                        focusNode: firstNameNode,
                        prefIcon: null,
                        labelText: "First Name *",
                        textInputAction: TextInputAction.next,
                        validator: authValidators.defaultValidator,
                      ),
                      const SizedBox(height: 32),
                      DynamicInputWidget(
                        isNonPasswordField: true,
                        controller: lastNameController,
                        obscureText: false,
                        focusNode: lastNameNode,
                        prefIcon: null,
                        labelText: "Last Name*",
                        textInputAction: TextInputAction.done,
                        validator: authValidators.defaultValidator,
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        height: 42,
                        width: double.infinity,
                        child: FlatButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              LoadingScreenWidget.instance()
                                  .show(context: context);
                              await Future.delayed(const Duration(seconds: 3),
                                  () {
                                ("successful").log();
                                LoadingScreenWidget.instance().hide();
                              });
                            }
                          },
                          text: "Create Account",
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        "By selecting Create account, you agree with our Terms of use and acknowledge you have read our Privacy Policy. You also agree to receiving ads and other offers from max",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Konstant.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
