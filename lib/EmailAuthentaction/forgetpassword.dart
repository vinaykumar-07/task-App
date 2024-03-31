import 'package:coding_app/EmailAuthentaction/login.dart';
import 'package:coding_app/widgets/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();
  forgetPassword(String email) async {
    if (email == "") {
      return UiHelper.customAlertDilog(
          "Enter email to reset your password", context);
    } else {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      FirebaseAuth.instance.signOut().then((value) => const LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
        centerTitle: true,
        backgroundColor: Color(0xFF012B5B),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        UiHelper.customTextField(emailController, Icons.mail_outline_outlined,
            "Enter your email", false),
        UiHelper.customElevatedButton(() {
          forgetPassword(emailController.text.toString());
        }, "Submit")
      ]),
    );
  }
}
