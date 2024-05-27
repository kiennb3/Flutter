import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Dates extends StatefulWidget {
  const Dates({super.key});

  @override
  State<Dates> createState() => _DatesState();
}

class _DatesState extends State<Dates> {
  DateTime selectedDate=DateTime.now();
  TimeOfDay selectedTime =TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    String formattedTime = selectedTime.format(context);
    String formattedDate= DateFormat('yyy-MM-dd - kk:mm').format(selectedDate);
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Slected Date: $formattedDate',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Selected Time: $formattedTime',
                  style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () async{
                  DateTime? pickedDate =await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2024) ,
                      lastDate: DateTime(2101));
                  if(pickedDate !=null && pickedDate !=selectedDate){
                    setState(() {
                      selectedDate =pickedDate;
                    });
                  }
                }, 
                child: Text('Select date')
            ),
            ElevatedButton(
                onPressed: () async{
                  TimeOfDay?  pickedTime =await showTimePicker(
                      context: context,
                      initialTime: selectedTime);
                  if(pickedTime != null && pickedTime !=selectedTime){
                    setState(() {
                      selectedTime =pickedTime;
                    });
                  }
                },
                child: Text('Select time'))
          ],
        )
      ),
    );
  }
}
