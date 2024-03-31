import 'package:coding_app/EmailAuthentaction/forgot_password.dart';
import 'package:coding_app/EmailAuthentaction/signup.dart';
import 'package:coding_app/coding_screen.dart';
import 'package:coding_app/widgets/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

// this function check that users details on firebase database

  bool isLoading = false;

// Modify SignIn method to handle loading state
  Future<void> signIn(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      UiHelper.customAlertDilog('Enter the required details', context);
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Navigate to the next screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CodingScreen()),
      );
    } on FirebaseAuthException catch (e) {
      UiHelper.customAlertDilog(e.code.toString(), context);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Sign In "),
        centerTitle: true,
        backgroundColor: Color(0xFF012B5B),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        UiHelper.customTextField(emailController, Icons.mail_outline_outlined,
            "Enter your Email here", false),
        UiHelper.customTextField(passwordController, Icons.key_outlined,
            "Enter your password here", true),
        const SizedBox(height: 30),
        RichText(
          text: TextSpan(
              text: "Don\'t have an Account?",
              style: TextStyle(
                color: Colors.black87,
              ),
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap =
                        () => (Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ))),
                  text: " SignUp",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF012B5B),
                  ),
                ),
              ]),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ForgotPassword()));
                  },
                  child: const Text(
                    "Forgot Password",
                    style:
                        const TextStyle(color: Color(0xFF012B5B), fontSize: 18),
                  )),
              isLoading
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : UiHelper.customElevatedButton(
                      () {
                        signIn(
                          emailController.text.toString(),
                          passwordController.text.toString(),
                        );
                      },
                      "SignIn ",
                    ),
            ],
          ),
        ),
      ]),
    );
  }
}
