import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:patient_health_care/home/Home.dart';
import 'package:patient_health_care/registration/forgetPassword/setNewPassword.dart';
import 'package:patient_health_care/screens/appointment/all%20apointment.dart';
import 'package:patient_health_care/screens/appointment/new_appointment.dart';
import 'package:patient_health_care/screens/appointment/painding_appointment.dart';
import 'package:patient_health_care/screens/diabetes.dart';
import 'package:patient_health_care/screens/question_answer/answer/answered_question.dart';
import 'package:patient_health_care/screens/question_answer/ask_question.dart';
import 'package:patient_health_care/screens/question_answer/not_answered.dart';

import '../../registration/log_in.dart';

class all_drower extends StatefulWidget {
  all_drower({super.key});

  @override
  State<all_drower> createState() => _drState();
}

class _drState extends State<all_drower> {
  final Box _boxLogin = Hive.box("login");

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(32, 63, 140, 1.0),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.apartment_sharp,
                  size: 30,
                  color: Colors.white,
                ),
                Text(
                  'হিয়ে',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('ড্যাশবোর্ড'),
            onTap: () {
              // Implement All Appoinment

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return home();
                  },
                ),
              );
            },
          ),
          ExpansionTile(
            leading: const Icon(Icons.note_alt),
            title: const Text('ডায়াবেটিস'),
            children: <Widget>[
              ListTile(
                title: const Text('প্রয়োজনীয় তথ্য'),
                onTap: () {
                  // Implement Necessary Information
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const diabates_info();
                    },
                  ));
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.question_answer),
            title: const Text('প্রশ্নোত্তর'),
            children: <Widget>[
              ListTile(
                title: const Text('প্রশ্ন করুন'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const askQuestion();
                    },
                  ));
                },
              ),
              ListTile(
                title: const Text('পেইনডিং প্রশ্ন'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const notAnswerd();
                    },
                  ));
                },
              ),
              ListTile(
                title: const Text('সকল উত্তর'),
                onTap: () {
                  // Implement All Question/Answer
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const answer();
                  }));
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.note_alt_outlined),
            title: const Text('এপোয়েনমেন্ট'),
            children: <Widget>[
              ListTile(
                title: const Text('নতুন অ্যাপয়েন্টমেন্ট'),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const newappointment();
                  }));
                },
              ),
              ListTile(
                title: const Text('পেন্ডিং এপোয়েনমেন্ট'),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const paindingAppointment();
                  }));
                },
              ),
              ListTile(
                title: const Text('সকল এপোয়েনমেন্ট'),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const allAppointment();
                  }));
                },
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('লগআউট'),
            onTap: () {
              _boxLogin.clear();
              Get.offAll(() => const Login());
            },
          ),
        ],
      ),
    );
  }
}
