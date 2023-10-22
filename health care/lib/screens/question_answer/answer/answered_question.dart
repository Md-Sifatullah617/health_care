import 'package:flutter/material.dart';
import 'package:patient_health_care/home/componects/drawer.dart';


class answer extends StatefulWidget {
  const answer({super.key});

  @override
  State<answer> createState() => _answerState();
}

class _answerState extends State<answer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("উত্তর সমূহ"),
      ),
      drawer: all_drower(),

      body: FutureBuilder(
        future: getPosts(),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            return ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context,int index){
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListTile(
                      leading: const SizedBox(
                        width: 100,
                        height: 100,
                      ),
                      title: const Text("Doctor Name"),
                      subtitle: Row(
                        children: const [
                          Expanded(child: Text("The Question ?")),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("20/10/2023"),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
