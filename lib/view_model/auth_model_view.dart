import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice/repository/auth_repository.dart';

class AuthModelView extends ChangeNotifier {
  final AuthRepository _repository = AuthRepository();
  String errorMessage = "";

  // registration

  Future<void> firebaseRegisterset(String email, String password) async {
    try {
      await _repository.registration(email, password);
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message.toString();

      print(errorMessage);
    } catch (e) {
      print("this is the error form ${e.toString()}");
    }
    notifyListeners();
  }
}
