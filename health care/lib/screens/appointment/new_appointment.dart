import 'package:flutter/material.dart';


class newappointment extends StatefulWidget {
  const newappointment({super.key});

  @override
  State<newappointment> createState() => _newappointmentState();
}

class _newappointmentState extends State<newappointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create appointment"),
      ),
    );
  }
}
