import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stationary_application/screens/login_screen.dart';
import 'package:stationary_application/screens/main_screen.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // regsiter
  Future<void> createUser(
      {required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      Get.snackbar(
        'Success Account',
        'You\'r Account Is Created.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.off(LoginScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'week-password') {
        Get.snackbar(
          'Week Password',
          'The Password Provided is too week',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Email Already Use In',
          'The email address is already in use by another account',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'UnKnow Error',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  //sigin
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar(
        'Sign In',
        'Welcome To The Dashboard.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.off(MainScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'Not Found',
          'Sorry! User Not Found!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        // print('The Password Provided is too week');
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'Wrong Password',
          'Wrong Password Provied For that User',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        // print('The Account Already Exist For That Email.');
      }
    } catch (e) {
      // print(e);
      Get.snackbar(
        'Wrong',
        'Incorrect Email or password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  //signout
  Future<void> signOut() async {
    await _auth.signOut();
    Get.off(LoginScreen());
  }

  //forget Password
  Future<void> forgetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar(
        'Reset Password',
        'Check your email account to reset password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.off(LoginScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'Not Found',
          'Sorry! User Not Found!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'unknow Error',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
