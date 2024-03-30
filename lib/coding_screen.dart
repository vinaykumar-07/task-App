import 'package:flutter/material.dart';

class CodingScreen extends StatefulWidget {
  const CodingScreen({Key? key}) : super(key: key);

  @override
  _CodingScreenState createState() => _CodingScreenState();
}

class _CodingScreenState extends State<CodingScreen> {
  bool _isDarkMode = true;
  bool _isLoading = false;
  bool _runisLoading = false;
  String _selectedLanguage = 'C++'; // Initial selected option

  final List<String> _selectlanguage = [
    'C++',
    'C++ 14',
    'C++ 17',
    'C++ 20',
    'C',
    'Java',
    'Python',
    'Go',
    'PHP',
    'Ruby',
    'Kotlin',
  ];

  void _submit() {
    // Show circular progress indicator
    setState(() {
      _isLoading = true;
    });

    // Simulate a delay
    Future.delayed(const Duration(seconds: 2), () {
      // After delay, hide circular progress indicator
      setState(() {
        _isLoading = false;
      });

      // Show popup Dialog
      _showPopupSubmitButton();
    });
  }

  void _run() {
    // Show circular progress indicator
    setState(() {
      _runisLoading = true;
    });

    // Simulate a delay
    Future.delayed(const Duration(seconds: 2), () {
      // After delay, hide circular progress indicator
      setState(() {
        _runisLoading = false;
      });

      // Show popup Dialog
      _showPopupRunButton();
    });
  }

  //show popup for Run button
  void _showPopupRunButton() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Code Run sucessfully"),
          content: const Text("Hello World ."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

//show pop for the Submit button
  void _showPopupSubmitButton() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Submission Successful"),
          content: const Text("Your submission was successful."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coding Test App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Handle menu icon press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Problem Statement',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: 200,
              child: const Text(
                "The Hello World Program in C++ is the basic program that is used to demonstrate how the coding process works. All you have to do is display the message “Hello World” on the console screen.",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Example Input/Output:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Input: \nOutput:  Hello World .',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Constraints:  ',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Code Editor',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                DropdownButton<String>(
                  value: _isDarkMode ? 'Dark Mode' : 'Light Mode',
                  onChanged: (String? newValue) {
                    setState(() {
                      _isDarkMode = newValue == 'Dark Mode';
                    });
                  },
                  items: <String>['Dark Mode', 'Light Mode']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  width: 12,
                ),
                DropdownButton<String>(
                  value: _selectedLanguage,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedLanguage = newValue!;
                    });
                  },
                  items: _selectlanguage.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
                color: _isDarkMode ? Colors.grey[900] : Colors.white,
              ),
              child: TextField(
                maxLines: 15,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '''
#include <iostream>
  using namespace std;
  
  // Main() function: where the execution of
  // program begins
  int main()
  {
      // Prints hello world
      cout << "Hello World";
  
      return 0;
}
''',
                  hintStyle: TextStyle(
                    color: _isDarkMode ? Colors.white70 : Colors.black87,
                  ),
                ),
                style:
                    TextStyle(color: _isDarkMode ? Colors.white : Colors.black),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _runisLoading ? null : _run,
                  child: _runisLoading
                      ? const CircularProgressIndicator()
                      : const Text(
                          'Run',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                ),
                ElevatedButton(
                  onPressed: _isLoading ? null : _submit,
                  child: _isLoading
                      ? const CircularProgressIndicator()
                      : const Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
