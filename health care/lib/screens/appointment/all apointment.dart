import 'package:flutter/material.dart';
import 'package:patient_health_care/home/componects/drawer.dart';

class allAppointment extends StatefulWidget {
  const allAppointment({super.key});

  @override
  State<allAppointment> createState() => _allAppointmentState();
}

class _allAppointmentState extends State<allAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All question"),
      ),
      drawer: all_drower(),
    );
  }
}
