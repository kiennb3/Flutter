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
      home: Firebase(),
    );
  }
}
class Firebase extends StatefulWidget {
  const Firebase({super.key});

  @override
  State<Firebase> createState() => _FirebaseState();
}

class _FirebaseState extends State<Firebase> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

