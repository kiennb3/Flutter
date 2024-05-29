import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Texxtcontroller extends StatefulWidget {
  const Texxtcontroller({super.key});

  @override
  State<Texxtcontroller> createState() => _TexxtcontrollerState();
}

class _TexxtcontrollerState extends State<Texxtcontroller> {
  String userInput='';
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Padding(
            padding: const EdgeInsets.all(10.0),
        child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            TextField(
              controller: myController,
              onChanged: (value) {
                setState(() {
                  userInput =value;
                });
              },
              decoration: InputDecoration(
                hintText: 'enter your text here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),

              ),
            ),
            SizedBox(height: 20,),
            Text(
              'Current Input: $userInput',
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
        ),
      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print(userInput);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('UserInput :$userInput')),
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
