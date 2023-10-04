import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:patient_health_care/home/Home.dart';

import '../../registration/log_in.dart';

class dr extends StatefulWidget {
   dr({super.key});

  @override
  State<dr> createState() => _drState();
}

class _drState extends State<dr> {
  final Box _boxLogin = Hive.box("login");

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.apartment_sharp,
                  size: 30,
                  color: Colors.blue,
                ),
                Text(
                  'হিয়ে',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('ড্যাশবোর্ড'),
            onTap: () {
              // Implement All Appoinment

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return  home();
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
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.question_answer),
            title: const Text('প্রশ্নোত্তর'),
            children: <Widget>[
              ListTile(
                title: const Text('পেন্ডিং প্রশ্নোত্তর'),
                onTap: () {
                  // Implement Pending Question/Answer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('সকল প্রশ্নোত্তর'),
                onTap: () {
                  // Implement All Question/Answer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.note_alt_outlined),
            title: const Text('এপোয়েনমেন্ট'),
            children: <Widget>[
              ListTile(
                title: const Text('পেন্ডিং এপোয়েনমেন্ট'),
                onTap: () {
                  // Implement Pending Appoinment
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('সকল এপোয়েনমেন্ট'),
                onTap: () {
                  // Implement All Appoinment
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('লগআউট'),
            onTap: () {
              // Implement All Appoinment
              _boxLogin.clear();
              _boxLogin.put("loginStatus", false);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const Login();
                  },
                ),
              );

            },
          ),
        ],
      ),

    );
  }
}
