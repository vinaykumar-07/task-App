import 'package:coding_app/EmailAuthentaction/login.dart'; 
import 'package:coding_app/widgets/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignUp(String email, String password) async {
    if (email == "" && password == "") {
      return UiHelper.customAlertDilog('Enter the reqired details', context);
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen())));
      } on FirebaseAuthException catch (e) {
        return UiHelper.customAlertDilog(e.code.toString(), context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Sign Up"),
        centerTitle: true,
        backgroundColor: const Color(0xFF012B5B),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        UiHelper.customTextField(emailController, Icons.mail_outline_outlined,
            "Enter your Email here", false),
        UiHelper.customTextField(passwordController, Icons.key_outlined,
            "Enter your password here", true),
        const SizedBox(height: 30),
        RichText(
          text: TextSpan(
              text: "Already have an Account? ",
              style: TextStyle(
                color: Colors.black87,
              ),
              children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap =
                          () => (Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ))),
                    text: "SignIn",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFF012B5B))),
              ]),
        ),
        const SizedBox(height: 20),
        UiHelper.customElevatedButton(() {
          SignUp(emailController.text.toString(),
              passwordController.text.toString());
        }, "SignUp")
      ]),
    );
  }
}
