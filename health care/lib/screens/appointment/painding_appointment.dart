import 'package:flutter/material.dart';
import 'package:patient_health_care/home/componects/drawer.dart';


class paindingAppointment extends StatefulWidget {
  const paindingAppointment({super.key});

  @override
  State<paindingAppointment> createState() => _paindingAppointmentState();
}

class _paindingAppointmentState extends State<paindingAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('পেন্ডিং এপোয়েনমেন্ট'),
      ),
      drawer: all_drower(),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context,int index){
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListTile(
                title: const Text("Doctor Name",style: TextStyle(
                  color: Colors.orange,
                ),),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("The reason for the appointment."),
                    Row(
                      children: [
                        Icon(Icons.email),
                        const SizedBox(width: 8),
                        Text("doctor@example.com",
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time),
                        const SizedBox(width: 8),
                        Text("20/10/2023 10:00 AM"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );

        },

      ),
    );
  }
}
