import 'package:flutter/material.dart';


class responseLi extends StatefulWidget {
  const responseLi({super.key});

  @override
  State<responseLi> createState() => _responseLiState();
}

class _responseLiState extends State<responseLi> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("উত্তর"),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context,int index){
          return Card(
            child: GestureDetector(

              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListTile(
                  title: const Text("The answered question?"),
                  subtitle: Row(
                    children: const [
                      Expanded(child: Text("here we have answered the question from the patient. now we are just checking it ")),
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
