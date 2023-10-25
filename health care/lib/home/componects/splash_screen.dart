import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:patient_health_care/home/Home.dart';
import 'package:patient_health_care/registration/log_in.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  final Box _boxLogin = Hive.box("login");

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
      if (_boxLogin.get('token') != null) {
        Get.offAll(() => home());
      } else {
        Get.offAll(() => const Login());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: const Center(
            child: Text('Welcome',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ))),
      ),
    );
  }
}
