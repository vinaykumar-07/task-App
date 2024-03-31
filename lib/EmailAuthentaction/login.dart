
import 'package:coding_app/EmailAuthentaction/forgetpassword.dart';
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
  SignIn(String email, String password) async {
    if (email == "" && password == "") {
      return UiHelper.customAlertDilog('enter the reqired details', context);
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CodingScreen())));
      } on FirebaseAuthException catch (e) {
        return UiHelper.customAlertDilog(e.code.toString(), context);
      }
      print(userCredential);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login page"),
        centerTitle: true,
        backgroundColor: Color(0xFF012B5B),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        UiHelper.customTextField(emailController, Icons.mail_outline_outlined,
            "Enter your Email here", false),
        UiHelper.customTextField(passwordController, Icons.key_outlined,
            "Enter your password here", true),
        RichText(
          text: TextSpan(
              text: "Don\'t have an account?",
              style: TextStyle(
                color: Colors.grey[500],
              ),
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap =
                        () => (Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ))),
                  text: "Create",
                  style: const TextStyle(),
                ),
              ]),
        ),
        const SizedBox(height: 30),
        UiHelper.customElevatedButton(() {
          SignIn(emailController.text.toString(),
              passwordController.text.toString());
        }, "Login Here.."),
        const SizedBox(height: 20),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ForgetPassword()));
            },
            child: const Text(
              "Forget password",
            ))
      ]),
    );
  }
}
