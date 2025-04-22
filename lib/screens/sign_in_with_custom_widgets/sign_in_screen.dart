import 'package:auto_connect/api_service_classes/login_api.dart';
import 'package:auto_connect/screens/sign_in_with_custom_widgets/textform_field_email.dart';
import 'package:auto_connect/screens/sign_in_with_custom_widgets/textform_field_password.dart';
import 'package:flutter/material.dart';
import '../common_custom_widgets/colors.dart';
import '../common_custom_widgets/custom_heading_text.dart';
import '../home_screen/home_screen.dart';
import 'elevated_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: HeadingText(
                heading: 'Sign In',
                colorName: CustomColors.blackColor,
                fontSize: 20,
              )),
              const SizedBox(height: 40),
              TextformFieldEmail(
                hinttext: 'Email_Id',
                controller: emailController,
              ),
              const SizedBox(height: 35),
              TextFormFieldPassword(
                pwd: 'Password',
                iconVisible: true,
                controller: passwordController,
              ),
              const SizedBox(height: 35),
              SignInElevatedButton(
                text: 'Sign In',
                onClicked: signIn,
              )
            ],
          ),
        ),
      ),
    );
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginFunctionClass functionClass = LoginFunctionClass();
  Future<void> signIn() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (email.isEmpty) {
      loginAlert('Please enter email');
      return;
    } else if (password.isEmpty) {
      loginAlert('Please enter password');
      return;
    }
    bool success = await functionClass.login(email, password);
    if (success) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      loginAlert('Incorrect email or password');
    }
  }

  void loginAlert(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      message,
      style: TextStyle(
          fontFamily: 'PoppinsRegular',
          fontSize: 15,
          color: CustomColors.whiteColor),
    )));
  }
}
