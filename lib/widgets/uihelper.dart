import 'package:flutter/material.dart';

class UiHelper {
  static customTextField(TextEditingController controller, IconData prefixicon,
      String text, bool toHide) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        obscureText: toHide,
        decoration: InputDecoration(
            prefixIcon: Icon(prefixicon),
            hintText: text,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }

  static customElevatedButton(VoidCallback voidCallback, String text) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF012B5B),
        ),
        onPressed: () {
          voidCallback();
        },
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ));
  }

  static customAlertDilog(String text, BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(text),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("ok"))
        ],
      ),
    );
  }
}
