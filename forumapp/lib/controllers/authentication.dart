import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:forumapp/constants/constants.dart';

class AuthenticationController extends GetxController {
  // Utilizamos RxBool para manejar el estado de carga de manera reactiva
  final isLoading = false.obs;

  Future<void> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      // Cambiamos el estado de carga a true al iniciar la solicitud
      isLoading.value = true;

      // Creamos un mapa con los datos que se enviarán en la solicitud
      final Map<String, String> data = {
        'name': name,
        'username': username,
        'email': email,
        'password': password,
      };

      // Enviamos la solicitud POST al servidor
      final response = await http.post(
        Uri.parse(url + 'register'),
        headers: {'Accept': 'application/json'},
        body: data,
      );

      // Verificamos el código de estado de la respuesta
      if (response.statusCode == 201) {
        // Si el registro es exitoso, cambiamos el estado de carga a false
        isLoading.value = false;
        // Imprimimos el cuerpo de la respuesta para propósitos de depuración
        debugPrint(json.decode(response.body));
      } else {
        // Si hay un error en el registro, cambiamos el estado de carga a false
        isLoading.value = false;
        // Imprimimos el cuerpo de la respuesta para propósitos de depuración
        debugPrint(json.decode(response.body));
      }
    } catch (e) {
      // Si hay una excepción, cambiamos el estado de carga a false
      isLoading.value = false;
      // Imprimimos la excepción para propósitos de depuración
      print(e.toString());
    }
  }
}
