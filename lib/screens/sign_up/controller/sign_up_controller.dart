import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  signUp() async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );

      Get.back();
      Get.snackbar("Success", "Signed up successfully");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Error", 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Error", 'The account already exists for that email.');
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
