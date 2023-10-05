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
    );

  }
}
