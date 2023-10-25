import 'package:flutter/material.dart';
import 'package:patient_health_care/home/componects/drawer.dart';
import 'package:patient_health_care/screens/question_answer/answer/response_list.dart';


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

      body:

             ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context,int index){
                return Card(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to another page when the card is tapped
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            // here we will sent the question , response, doctor name date
                            return responseLi();
                          },
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ListTile(
                        title: const Text("Doctor Name"),
                        subtitle: Row(
                          children: const [
                            Expanded(child: Text("The answered quesion ?")),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("20/10/2023"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );

              },

            ),



    );
  }
}
