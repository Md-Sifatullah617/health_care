import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_health_care/controller/doctor_controller.dart';
import 'package:patient_health_care/home/componects/drawer.dart';

class NewAppointment extends StatefulWidget {
  const NewAppointment({super.key});

  @override
  State<NewAppointment> createState() => _NewAppointmentState();
}

class _NewAppointmentState extends State<NewAppointment> {
  // final _doctorlist = ["doctor 1", "Doctor 2", "Doctor 3", "Doctor 4"];
  String? _selectedValue = "";
  // _NewAppointmentState() {
  //   _selectedValue = _doctorlist[0];
  // }
  // String dropdownvalue = 'Doctor 1';
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _controllerDate = TextEditingController();
  final TextEditingController _controllerTime = TextEditingController();
  final TextEditingController _controllerQuestions = TextEditingController();

  @override
  void dispose() {
    _controllerDate.dispose();
    _controllerTime.dispose();
    _controllerQuestions.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create appointment"),
      ),
      drawer: const AllDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: GetBuilder<DoctorController>(
            builder: (controller) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                const Text(
                  "Patient Name",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Patient Email",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Patient Phone Number",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField(
                  value: controller.doctorList[0].userId,
                  items: controller.doctorList
                      .map(
                        (e) => DropdownMenuItem(
                          value: e.userId,
                          child: Text(e.docName ?? ""),
                        ),
                      )
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedValue = val;
                      print(_selectedValue);
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down_circle,
                    color: Color.fromRGBO(32, 63, 129, 1.0),
                  ),
                  dropdownColor: const Color.fromRGBO(212, 223, 253, 1.0),
                  decoration: InputDecoration(
                    labelText: "Doctor",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controllerDate,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Date(20-11-2023)",
                    prefixIcon: const Icon(Icons.date_range),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter username.";
                    }
                    final datePattern = r'^\d{2}-\d{2}-\d{4}$';
                    final RegExp regExp = RegExp(datePattern);

                    if (!regExp.hasMatch(value)) {
                      return "Invalid date format. Please use 'dd-mm-yyyy'.";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controllerTime,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: "Time (12:55 AM)",
                    prefixIcon: const Icon(Icons.lock_clock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter time.";
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 9 * 20.0),
                  child: TextFormField(
                    controller: _controllerQuestions,
                    keyboardType: TextInputType.name,
                    maxLines: null, // Set to null to allow multiple lines

                    decoration: InputDecoration(
                      labelText: "What is your problem?",
                      labelStyle: const TextStyle(
                        fontSize: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "আপনার প্রশ্নটি লিখুন";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    controller.isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   SnackBar(
                                //     width: 200,
                                //     backgroundColor:
                                //         Theme.of(context).colorScheme.secondary,
                                //     shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(10),
                                //     ),
                                //     behavior: SnackBarBehavior.floating,
                                //     content: const Text("Appointment fixed"),
                                //   ),
                                // );

                                controller.setAppointment(
                                    _selectedValue!,
                                    _controllerDate.text,
                                    _controllerTime.text,
                                    _controllerQuestions.text);

                                _formKey.currentState?.reset();

                                // Navigator.pop(context,MaterialPageRoute(builder: (context){
                                //   return home();
                                // }));
                              }
                            },
                            child: const Text("Set Appointment"),
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
