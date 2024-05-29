import 'package:fl29_05_2024/Dark_mode.dart';
import 'package:fl29_05_2024/Dismissible_Widget.dart';
import 'package:fl29_05_2024/forandloc.dart';
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
      home: const forloc()
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
               void _showFullScreenModal(BuildContext context){
                 showModalBottomSheet(context: context,
                     isScrollControlled: true,// Mở modal toàn màn hình
                     builder: (BuildContext context){
                   return FractionallySizedBox(
                     heightFactor: 1, // Chiếm toàn bộ chiều cao của màn hình
                     child: FullScreenModalContent() ,
                   );
                     });
               }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: ()=>{
          _showFullScreenModal(context)
        }, child: const Text('Show modal')),
      ),
    );
  }
}

class FullScreenModalContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey,
    appBar: AppBar(
      title: const Text('FullScreen Modal'),
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: (){
          Navigator.of(context).pop();
        },
      ),
    ),
    body: const Center(child: Text('This is a full-screen modal'),),
  );
  }
}
