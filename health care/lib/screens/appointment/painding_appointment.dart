import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_health_care/controller/doctor_controller.dart';
import 'package:patient_health_care/home/componects/drawer.dart';

class PaindingAppointment extends StatefulWidget {
  const PaindingAppointment({super.key});

  @override
  State<PaindingAppointment> createState() => _PaindingAppointmentState();
}

class _PaindingAppointmentState extends State<PaindingAppointment> {
  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future<void> loadData() async {
    Get.put(DoctorController());
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Get.find<DoctorController>().fetchPendingAppointment();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('পেন্ডিং এপোয়েনমেন্ট'),
      ),
      drawer: const AllDrawer(),
      body: GetBuilder<DoctorController>(
        builder: (controller) => controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controller.pendingAppointment.length,
                itemBuilder: (BuildContext context, int index) {
                  String doctorName = controller.doctorList
                      .firstWhere((element) =>
                          element.userId ==
                          controller.pendingAppointment[index].docId)
                      .docName!;
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: ListTile(
                        title: Text(
                          doctorName,
                          style: TextStyle(
                            color: Colors.orange,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("The reason for the appointment."),
                            Row(
                              children: [
                                Icon(Icons.email),
                                SizedBox(width: 8),
                                Text(
                                  "doctor@example.com",
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.access_time),
                                SizedBox(width: 8),
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
      ),
    );
  }
}
