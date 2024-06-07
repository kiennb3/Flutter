import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Availablespace extends StatefulWidget {
  const Availablespace({super.key});

  @override
  State<Availablespace> createState() => _AvailablespaceState();
}

class _AvailablespaceState extends State<Availablespace> {
  

  @override
  Widget build(BuildContext context) {
    var screenWidth=MediaQuery.of(context).size.width;
    var screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Space Example'),
      ),
      body: Center(
      child: Container(
        width: screenWidth * 0.8,
        height: screenHeight *0.5,
        color: Colors.blueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'responsive Container',
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                color: Colors.white
              ),
            ),
            SizedBox(height: screenHeight * 0.02,),
            Text(
              'Width: ${(screenWidth *0.8).toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: screenWidth *0.04,
                color: Colors.deepOrange
              ),
            ),
            Text('Height: ${(screenHeight * 0.5).toStringAsFixed(2)}'
            ,style: TextStyle(
                fontSize:  screenWidth * 0.04,
                color: Colors.deepOrange
              ),
            )
          ],
        ),
      ),
      ),
    );
  }
}
