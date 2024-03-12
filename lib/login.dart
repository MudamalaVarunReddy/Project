// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'register.dart';
import 'homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController = TextEditingController();
  late TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 233, 234, 229),
            Color.fromARGB(255, 9, 97, 107),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _icon(),
          SizedBox(height: 20),
          _buildTextField("Enter Email", _emailController, Icons.email),
          SizedBox(height: 20),
          _buildTextField("Password", _passwordController, Icons.lock,
              isPassword: true),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Add your login logic here
              print('Email: ${_emailController.text}');
              print('Password: ${_passwordController.text}');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EcommerceHomePage()),
              );
            },
            child: Text("Login"),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegistrationPage()),
              );
            },
            child: Text('Create an Account'),
          ),
        ],
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.person,
        color: Colors.white,
        size: 120,
      ),
    );
  }

  Widget _buildTextField(
    String text,
    TextEditingController controller,
    IconData iconData, {
    bool isPassword = false,
  }) {
    return SizedBox(
      width: 300,
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(iconData, color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 244, 70, 54)),
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
