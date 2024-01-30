import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:forumapp/views/home.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:forumapp/constants/constants.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationController extends GetxController {
  final isLoading = false.obs;
  final token = ''.obs;

  final box = GetStorage();

  Future<void> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      final Map<String, String> data = {
        'name': name,
        'username': username,
        'email': email,
        'password': password,
      };

      final response = await http.post(
        Uri.parse('${url}register'),
        headers: {'Accept': 'application/json'},
        body: data,
      );

      if (response.statusCode == 201) {
        isLoading.value = false;
        token.value = json.decode(response.body)['token'];
        box.write('token', token.value);
        debugPrint(response.body);

        // Muestra un Snackbar de fondo verde indicando éxito
        Get.snackbar(
          'Éxito',
          'Usuario creado con éxito',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // Espera 5 segundos antes de redirigir al usuario a la vista de login
        await Future.delayed(const Duration(seconds: 5));

        // Redirige al usuario a la vista de home
        Get.offAll(() => const HomePage());
      } else {
        isLoading.value = false;
        final dynamic jsonResponse = json.decode(response.body);

        // Obtén el mensaje de error, o establece un mensaje predeterminado
        final String errorMessage =
            jsonResponse['message'] ?? 'Error desconocido';

        Get.snackbar(
          'Error de Registro',
          errorMessage,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );

        debugPrint(response.body);
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      isLoading.value = true;

      final Map<String, String> data = {
        'email': email,
        'password': password,
      };

      final response = await http.post(
        Uri.parse('${url}login'),
        headers: {'Accept': 'application/json'},
        body: data,
      );

      if (response.statusCode == 200) {
        isLoading.value = false;
        token.value = json.decode(response.body)['token'];
        box.write('token', token.value);
        Get.offAll(() => const HomePage());

        debugPrint(response.body);
      } else {
        isLoading.value = false;
        final dynamic jsonResponse = json.decode(response.body);

        // Obtén el mensaje de error, o establece un mensaje predeterminado
        final String errorMessage =
            jsonResponse['message'] ?? 'Error desconocido';

        Get.snackbar(
          'Error de Registro',
          errorMessage,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );

        debugPrint(response.body);
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }
}
