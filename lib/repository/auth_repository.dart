import 'package:practice/service/auth_service.dart';

class AuthRepository {
  // service class 
  final autheticationService = AuthService();

  // registration of firebase
  Future<void> registration(String email, String password) async {
    autheticationService.firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
