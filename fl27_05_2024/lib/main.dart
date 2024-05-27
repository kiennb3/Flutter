import 'dart:async';

import 'package:fl27_05_2024/DataModel.dart';
import 'package:fl27_05_2024/Dates.dart';
import 'package:fl27_05_2024/ListInsideList.dart';
import 'package:fl27_05_2024/Modal.dart';
import 'package:fl27_05_2024/TextField.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Dates()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late Timer _timer;
  bool _isRunning = false;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _startTimer(){
    _timer =Timer.periodic(Duration(seconds: 1), (Timer timer){
      setState(() {
        _counter ++;
      });
      setState(() {
        _isRunning =true;
      });
    });

  }
  void _stopTimer(){
    _timer.cancel();
    setState(() {
      _isRunning=false;
    });
  }

@override
  void iniState(){
    super.initState();
    _startTimer();
}
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20),
            _isRunning
            ?ElevatedButton(onPressed: _stopTimer, child: Text('Stop timer')
            ): ElevatedButton(onPressed: _startTimer, child: Text('start timer'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // setState(() {
          //   _counter++;
          // });
          _startTimer();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
