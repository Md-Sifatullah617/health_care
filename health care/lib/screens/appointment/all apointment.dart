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
      body: ListView.builder(
        itemCount: 10,
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
                    Text("All the appoontments."),
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
