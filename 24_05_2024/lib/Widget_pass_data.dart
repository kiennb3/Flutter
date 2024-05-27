import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
//Truyền dữ liệu thông qua hàm:
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Passing Data via Functions'),
        ),
        body: ParentWidget(),
      ),
    );
  }
}

class ParentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChildWidget(
            callback: (data) {
              print('Received data: $data');
            },
          ),
        ],
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  final Function(String) callback;

  const ChildWidget({Key? key, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Truyền dữ liệu từ widget con lên widget cha thông qua hàm callback
        callback('Hello from ChildWidget');
      },
      child: Text('Pass Data to Parent'),
    );
  }
}