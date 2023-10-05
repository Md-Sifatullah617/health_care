import 'package:flutter/material.dart';
import 'package:patient_health_care/home/Home.dart';
import 'package:patient_health_care/home/componects/drawer.dart';


class askQuestion extends StatefulWidget {
  const askQuestion({super.key});

  @override
  State<askQuestion> createState() => _askQuestionState();
}

class _askQuestionState extends State<askQuestion> {

  final _doctorlist = ["doctor 1","Doctor 2","Doctor 3","Doctor 4"];
  String? _selectedVal = "";
  _askQuestionState(){
    _selectedVal = _doctorlist[0];
  }
  String dropdownvalue='Doctor 1';
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _controllerQuestions = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("প্রশ্ন জিজ্ঞাস করুন"),
      ),
      //drawer: all_drower(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(height: 150),
              Text("ডাক্তার নির্বাচন করুন",
                style: Theme.of(context).textTheme.bodyMedium,),
              const SizedBox(height: 10),
              DropdownButtonFormField(
                value: _selectedVal,
                items: _doctorlist.map((e) => DropdownMenuItem(child: Text(e,),value: e,)
                ).toList(),
                onChanged: (val){
                  setState(() {
                    _selectedVal = val as String;
                  });
                },
                icon: const Icon(
                  Icons.arrow_drop_down_circle,
                  color: Color.fromRGBO(32, 63, 129, 1.0),
                ),
                dropdownColor: Color.fromRGBO(212, 223, 253, 1.0),
                decoration: InputDecoration(
                  labelText: "Doctor",

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Text("আপনার প্রশ্নটি লিখুন",
                style: Theme.of(context).textTheme.bodyMedium,),
              // question adding


              const SizedBox(height: 10,),

              ConstrainedBox(

                  constraints: BoxConstraints(maxHeight: 9* 20.0),
                      child: TextFormField(

                        controller: _controllerQuestions,
                        keyboardType: TextInputType.name,
                        maxLines: null,// Set to null to allow multiple lines

                        decoration: InputDecoration(
                          labelText: "Question",
                          labelStyle: TextStyle(

                            fontSize: 16,
                          ),


                          // prefixIcon: Padding(
                          //   padding: const EdgeInsets.all(1),
                          //
                          // ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "আপনার প্রশ্ন টি লিখুন";
                          }
                          return null;
                        },
                      ),

              ),





              const SizedBox(height: 50),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {


                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            width: 200,
                            backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            behavior: SnackBarBehavior.floating,
                            content: const Text("Question added successfully"),
                          ),
                        );

                        _formKey.currentState?.reset();

                        // Navigator.pop(context,MaterialPageRoute(builder: (context){
                        //   return home();
                        // }));
                      }
                    },
                    child: const Text("Submit"),
                  ),
                  const SizedBox(height: 10,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
