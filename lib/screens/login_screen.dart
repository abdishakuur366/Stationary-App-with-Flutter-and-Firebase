import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stationary_application/controller/auth_controler.dart';
import 'package:stationary_application/screens/forget_password.dart';
import 'package:stationary_application/screens/home_screen.dart';
import 'package:stationary_application/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController _authController = Get.put(AuthController());
  final TextEditingController _emailInput = TextEditingController();
  final TextEditingController _passwordInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Log in',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.0),
              Text(
                "welcome",
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
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordInput,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ForgetPasswordScreen()));
                      },
                      child: Text('Forget Password'))
                ],
              ),
              ElevatedButton(
                child: Text('Sign In'),
                onPressed: () {
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (c) => HomeScreen()));
                  if (_emailInput.text == "" || _passwordInput.text == "") {
                    Get.snackbar(
                      'Required!',
                      'Email and password are both required',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                    return;
                  } else {
                    _authController.signIn(
                        email: _emailInput.text.trim(),
                        password: _passwordInput.text.trim());
                  }
                },
              ),
              TextButton(
                child: Text('I dont have an account? || SignUp'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => RegisterScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
