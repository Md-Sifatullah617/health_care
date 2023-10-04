import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:patient_health_care/home/componects/drawer.dart';




class home extends StatelessWidget {
  home({super.key});

  final Box _boxLogin = Hive.box("login");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ড্যাশবোর্ড"),

      ),
      drawer:  all_drower(),


      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome ",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            Text(
              _boxLogin.get("userName"),
              style: Theme.of(context).textTheme.headlineLarge,

            ),
          ],
        ),
      ),
    );
  }
}
