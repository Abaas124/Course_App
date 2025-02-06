import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'home.dart';
import 'login.dart';

class UsersController extends GetxController {
  var isLoading = false.obs;
  var token = ''.obs;
  var users = [].obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final _storage = const FlutterSecureStorage();
  // @override
  // void onInit() {
  //   super.onInit();
  //   loadToken(); // Automatically load the token on app startup
  // }
  Future<void> loginUser() async {
    const String url =
        "https://flutter-test-server.onrender.com/api/users/login";
    print('email ${emailController.text}');
    print('password ${passwordController.text}');

    final Map<String, String> body = {
      "email": emailController.text,
      "password": passwordController.text,
    };

    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      isLoading.value = false;

      if (response.statusCode == 200) {
        print(response.body);
        final responseData = jsonDecode(response.body);

        // Extract and store the token
        token.value = responseData['token'] ?? '';
        await saveToken(token.value);
        Get.snackbar(
          "Success",
          "Login Successful",
          snackPosition: SnackPosition.TOP,
        );

        // Navigate to the next screen
        Get.to(() => const home());
      } else {
        print("Response Body: ${response.body}");

        Get.snackbar(
          "Error",
          "Login Failed: ${response.reasonPhrase}",
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      isLoading.value = false;

      // Handle network or parsing errors
      Get.snackbar(
        "Error",
        "An error occurred: $e",
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> saveToken(String token) async {
    await _storage.write(key: "auth_token", value: token);
  }

  Future<void> loadToken() async {
    final storedToken = await _storage.read(key: "auth_token");
    if (storedToken != null && storedToken.isNotEmpty) {
      token.value = storedToken;

      // If a valid token exists, navigate to Users List Screen
      Get.off(() => const home());
    }
  }

  Future<void> signupUser() async {
    const String url =
        "https://flutter-test-server.onrender.com/api/users/register";

    final Map<String, String> body = {
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text,
    };

    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      isLoading.value = false;

      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);

        token.value = responseData['token'] ?? '';

        Get.snackbar(
          "Success",
          "Sign Up Successful",
          snackPosition: SnackPosition.TOP,
        );

        // Navigate to Login Screen after successful sign-up
        Get.to(() => const login());
      } else {
        final responseData = jsonDecode(response.body);

        Get.snackbar(
          "Error",
          "Sign Up Failed: ${responseData['error']}",
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      isLoading.value = false;

      Get.snackbar(
        "Error",
        "An error occurred: $e",
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
