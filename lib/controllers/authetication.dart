import 'dart:convert';
import 'package:blubroject/constants/constants.dart';
import 'package:blubroject/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AutheticationController extends GetxController {
  final isloading = false.obs;
  final token = ''.obs;

  final box = GetStorage();

  Future register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      isloading.value = true;
      var data = {
        'nama': name,
        'username': username,
        'email': email,
        'password': password,
      };
      var response = await http.post(
        Uri.parse('${url} + register'),
        headers: {'Accept': 'application/json'},
        body: data,
      );
      if (response.statusCode == 201) {
        isloading.value = false;
        token.value = json.decode(response.body)['token'];
        box.write('token', token.value);
        Get.offAll(() => HomePage());
      } else {
        isloading.value = false;
        Get.snackbar('Error', json.decode(response.body)['message'],
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white);
        debugPrint(
          json.decode(response.body),
        );
        print(
          json.decode(response.body),
        );
      }
    } catch (e) {
      isloading.value = false;
      print(e.toString());
    }
  }

  Future login({
    required String username,
    required String password,
  }) async {
    try {
      isloading.value = true;
      var data = {
        'username': username,
        'password': password,
      };
      var response = await http.post(
        Uri.parse('${url} + login'),
        headers: {'Accept': 'application/json'},
        body: data,
      );
      if (response.statusCode == 200) {
        isloading.value = false;
        token.value = json.decode(response.body)['token'];
        box.write('token', token.value);
        Get.offAll(() => HomePage());
      } else {
        isloading.value = false;
        Get.snackbar('Error', json.decode(response.body)['message'],
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white);
        debugPrint(
          json.decode(response.body),
        );
        print(
          json.decode(response.body),
        );
      }
    } catch (e) {
      isloading.value = false;
      print(e.toString());
    }
  }
}
