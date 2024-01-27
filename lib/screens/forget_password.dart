import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stationary_application/controller/auth_controler.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final AuthController _authController = Get.put(AuthController());
  final TextEditingController _emailInput = TextEditingController();

  clearField() {
    _emailInput.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Reset Password',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            Text(
              "We will send link to this email",
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.0),
            TextFormField(
              controller: _emailInput,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              child: Text('Reset Password'),
              onPressed: () {
                _authController.forgetPassword(email: _emailInput.text.trim());
              },
            ),
          ],
        ),
      ),
    );
  }
}
