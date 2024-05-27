import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Textfield extends StatefulWidget {
  const Textfield({super.key});

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  String userInput='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          onChanged: (value){
            setState(() {
              userInput =value;
            });
          },
          decoration: InputDecoration(
            hintText: 'Enter you text here'
          ),
        ),
      ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print(userInput);
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
