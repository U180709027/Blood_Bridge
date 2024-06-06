import 'package:blood_bridge/TextFormFieldWithIcon.dart';
import 'package:blood_bridge/homePage.dart';
import 'package:blood_bridge/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  late String _name,
      _identityNumber,
      _email,
      _password,
      _birthday,
      _phoneNumber,
      _address,
      _bloodGroup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'REGISTRATION FORM',
          style: TextStyle(
            color: Color.fromARGB(255, 60, 152, 192),
            fontSize: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Full Name field
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      icon: Icon(Icons.person),
                    ),
                    onSaved: (value) => _name = value!,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  // Email field
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      icon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) => _email = value!,
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  // Password field
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      icon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    onSaved: (value) => _password = value!,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return 'Please enter a password with at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  // Other fields remain the same
                  // ...
                  SizedBox(height: 40),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          _registerWithEmailAndPassword();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 60, 152, 192),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text(
                        'REGISTER',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _registerWithEmailAndPassword() async {
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      // Handle user registration success
      print('User registered successfully.');
      // Check if the user is registered
      await checkUserRegistration(_email); // Call checkUserRegistration here
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );
    } catch (e) {
      // Handle registration errors
      print('Failed to register: $e');
    }
  }

// Function to check if a user is registered
  Future<void> checkUserRegistration(String email) async {
    try {
      // Fetch sign-in methods for the provided email
      List<String> signInMethods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

      if (signInMethods.isNotEmpty) {
        print('User with email $email is registered.');
      } else {
        print('User with email $email is not registered.');
      }
    } catch (e) {
      print('Error checking user registration: $e');
    }
  }
}
