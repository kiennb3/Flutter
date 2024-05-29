import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialogerror extends StatefulWidget {
  const Dialogerror({super.key});

  @override
  State<Dialogerror> createState() => _DialogerrorState();
}

class _DialogerrorState extends State<Dialogerror> {
  final TextEditingController _nameController =TextEditingController();
  final TextEditingController _ageController =TextEditingController();

  void _validateInput(){
    String name =_nameController.text.trim();
    String ageString=_ageController.text.trim();
    if(name.isEmpty){
      _showErrorDialog('Please enter your name');
      return;
    }
    int? age;
    try {
      age =int.parse(ageString);
      if(age<18 || age>100){
        _showErrorDialog('Please enter a valid age between 18 and 100.');
        return;
      }
    }catch(e){
      _showErrorDialog('please enter a valid age');
      return;
    }
    print('Name: $name');
    print('Age: $age');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(padding: EdgeInsets.all(16.0),

      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)
              )
            ),
            onTap: () {
              FocusScope.of(context).unfocus(); // Thoát khỏi ô nhập liệu khi người dùng nhấn vào chỗ trống
            },
          ),
          SizedBox(height: 12.0),
          TextField(
            controller: _ageController,
            decoration: InputDecoration(
              labelText: 'Age',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                )
            ),
            keyboardType: TextInputType.number,
            onTap: () {
              FocusScope.of(context).unfocus(); // Thoát khỏi ô nhập liệu khi người dùng nhấn vào chỗ trống
            },
          ),
          SizedBox(height: 20.0,),
          ElevatedButton(onPressed: _validateInput, child: Text('Submit'))
        ],
      )),

    );
  }

  void _showErrorDialog(String message) {
    showDialog(context: context,
        builder: (BuildContext context){
      return AlertDialog(
        title: Text('error'),
        content: Text(message),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text('OK'))
        ],
      );
        });
  }
}
