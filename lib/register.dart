// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'login.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late TextEditingController _nameController = TextEditingController();
  late TextEditingController _emailController = TextEditingController();
  late TextEditingController _phoneController = TextEditingController();
  late TextEditingController _passwordController = TextEditingController();
  late TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
            Color.fromARGB(255, 9, 91, 107),
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
          _buildTextField("Enter Name", _nameController, Icons.person),
          SizedBox(height: 20),
          _buildTextField("Enter Email", _emailController, Icons.email),
          SizedBox(height: 20),
          _buildTextField("Enter Phone Number", _phoneController, Icons.phone),
          SizedBox(height: 20),
          _buildTextField("Password", _passwordController, Icons.lock,
              isPassword: true),
          SizedBox(height: 20),
          _buildTextField(
              "Confirm Password", _confirmPasswordController, Icons.lock,
              isPassword: true),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Add your registration logic here
              print('Name: ${_nameController.text}');
              print('Email: ${_emailController.text}');
              print('Phone Number: ${_phoneController.text}');
              print('Password: ${_passwordController.text}');
              print('Confirm Password: ${_confirmPasswordController.text}');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text("Register"),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Navigate back to login page
            },
            child: Text('Already have an account? Login'),
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
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
