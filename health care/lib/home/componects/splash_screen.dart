import 'dart:async';
import 'package:flutter/material.dart';
import 'package:patient_health_care/registration/log_in.dart';




class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4),(){

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),));
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: const Center(child: Text('Welcome',style: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ))),
      ),
    );
  }
}
