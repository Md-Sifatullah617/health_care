import 'dart:convert';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:patient_health_care/home/Home.dart';
import 'package:patient_health_care/model/response_login.dart';
import 'package:patient_health_care/utils/custom_toast.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  String baseUrl = 'https://hiyehealth.com/api';
  final Box _boxLogin = Hive.box('login');
  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      var response = await http.post(
        Uri.parse('$baseUrl/login'),
        body: {
          'email': email,
          'password': password,
        },
      );
      final RpLoginModel loginModel =
          RpLoginModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        _boxLogin.put('token', loginModel.data!.token!.split('|')[1]);
        _boxLogin.put('name', loginModel.data!.name);
        customToast(msg: loginModel.message!);
        Get.offAll(() => home());
        isLoading.value = false;
      } else {
        customToast(msg: loginModel.message!, isError: true);
        isLoading.value = false;
      }
    } catch (e) {
      print('error: $e');
      isLoading.value = false;
    }
  }

  // void logout() async {
  //   loginData.delete('token');
  //   loginData.delete('name');
  //   Get.offAll(() => const Login());
  // }

  saveUserData() {}
}
