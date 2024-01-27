import 'package:get/get.dart';
import 'package:stationary_application/services/auth_service.dart';

class AuthController extends GetxController {
  final FirebaseAuthService _authService = FirebaseAuthService();

  // signup
  Future<void> signUp({required String email, required String password}) async {
    await _authService.createUser(email: email, password: password);
  }

  //sign In
  Future<void> signIn({required String email, required String password}) async {
    await _authService.signInWithEmailAndPassword(
        email: email, password: password);
  }

  //signout
  Future<void> signOut() async {
    await _authService.signOut();
  }

  //rest password
  Future<void> forgetPassword({required String email}) async {
    await _authService.forgetPassword(email: email);
  }
}
