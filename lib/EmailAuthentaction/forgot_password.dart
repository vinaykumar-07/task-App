import 'package:coding_app/EmailAuthentaction/sign_In.dart';
import 'package:coding_app/widgets/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

  void forgetPassword(String email) async {
    if (email.isEmpty) {
      UiHelper.customAlertDilog("Enter email to reset your password", context);

      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text('Reset email sent to $email'),
          duration: Duration(seconds: 4),
        ),
      );
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Failed to send reset email: $e'),
          duration: Duration(seconds: 4),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Forgot Password"),
        centerTitle: true,
        backgroundColor: Color(0xFF012B5B),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Icon(Icons.lock,size: 150,),
          SizedBox(
            height: 20,
          ),
          UiHelper.customTextField(
            emailController,
            Icons.mail_outline_outlined,
            "Enter your email",
            false,
          ),
          SizedBox(height: 30),
          UiHelper.customElevatedButton(
            () {
              forgetPassword(emailController.text.toString());
            },
            "Submit",
          )
        ],
      ),
    );
  }
}
