import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Darkmodee extends StatefulWidget {
  const Darkmodee({super.key});

  @override
  State<Darkmodee> createState() => _DarkmodeeState();
}

class _DarkmodeeState extends State<Darkmodee> {
  bool _isDarkMode =false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Chào mừng bạn đến với App Flutter',
                style: TextStyle(fontSize: 24.0),),
              Switch(value: _isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      _isDarkMode = value;
                    });
                  })
            ],
          ),
        ),
      ),

    );
  }}
