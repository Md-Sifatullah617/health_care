import "package:flutter/material.dart";


class notAnswerd extends StatefulWidget {
  const notAnswerd({super.key});

  @override
  State<notAnswerd> createState() => _notAnswerdState();
}

class _notAnswerdState extends State<notAnswerd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("উত্তর পাওয়া যাইনি",),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context,int index){
          return Card(
            child: GestureDetector(

              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListTile(
                  title: const Text("Doctor Name"),
                  subtitle: Row(
                    children: const [
                      Expanded(child: Text("The painding question ?")),
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
