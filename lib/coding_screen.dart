import 'package:firebase_auth/firebase_auth.dart';
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
          content: const Text("Sum is 27 ."),
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
        backgroundColor: const Color(0xFF012B5B),
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Coding Test App'),
      ),
      // added drawer for user details and logout implementation
      drawer: Drawer(
        child: Container(
          width:
              MediaQuery.of(context).size.width * 0.35, // 35% of screen width
          color: Colors.white,
          child: ListView(
            children: [
              DrawerHeader(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.blue,
                        Colors.blueAccent,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Stack(fit: StackFit.loose, children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: 140.0,
                              height: 140.0,
                              decoration: const BoxDecoration(
                                color: Color(0xFF1976D2),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image:
                                      ExactAssetImage('assets/images/as.png'),
                                  fit: BoxFit.cover,
                                ),
                              )),
                        ],
                      ),
                      const Padding(
                          padding: EdgeInsets.only(top: 90.0, right: 100.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Color(0xFF1976D2),
                                radius: 25.0,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )),
                    ]),
                  )),
              ListTile(
                leading: const Icon(
                  Icons.person,
                  size: 30,
                ),
                title: const Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF1976D2),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUsPage()));
                  // Add your logic here to navigate to the home page
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.contact_page,
                  size: 30,
                ),
                title: const Text(
                  'Contect us',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF1976D2),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // navProvider.navigate('/contectUs');

                  // Add your logic here to navigate to the home page
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                  size: 30,
                ),
                title: const Text(
                  'Setting',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF1976D2),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Add your logic here to navigate to the home page
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text(
                  'SignOut',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF1976D2),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  //auth.logout();
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      dismissDirection: DismissDirection.up,
                      behavior: SnackBarBehavior.floating,
                      content: Text('logout sucessful'),
                      duration:
                          Duration(seconds: 2), // Adjust duration as needed
                    ),
                  );
                  // Add your logic here to navigate to the home page
                },
              ),
            ],
          ),
        ),
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
            const SizedBox(
              width: 200,
              child: Text(
                textAlign: TextAlign.justify,
                'Write a progarm using C++ to add two number ',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Example :',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 201, 203, 205)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Input :',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15),
                        ),
                        TextSpan(
                          text: ' 12',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        TextSpan(
                          text: ' , 15',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                        text: 'Output :',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15)),
                    TextSpan(
                      text: ' 27',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ])),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Explanation :',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  const Text('if num1 and num2 is 12 and 15 respectively '),
                  const Text('sum=num1+num2'),
                  const Text('sum=12+15'),
                  const Text('sum=27'),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Constraints:  ',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const Text('the value of sum <10^9')
                ],
              ),
            ),
            const SizedBox(height: 10),
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
                  style: const TextStyle(color: Colors.black),
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

int main() {

  int num1, num2, sum;
  cout << "Enter two integers: ";
  cin >> num1 >> num2;
  // sum of two numbers in stored in variable sum
  sum = num1 + num2;
  // prints sum 
  cout << num1 << " + " <<  num2 << " = " << sum;     
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
            const Text(
              'Custom Input',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 100,
              width: 200,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300]),
                child: const TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: ' 12\n 15',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF012B5B),
                  ),
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF012B5B),
                  ),
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
