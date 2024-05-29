import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DismissibleWidget extends StatefulWidget {
  const DismissibleWidget({super.key});

  @override
  State<DismissibleWidget> createState() => _DismissibleWidgetState();
}

class _DismissibleWidgetState extends State<DismissibleWidget> {
  final List<String> items= List<String>.generate(20, (i) => 'Item ${i +1}');
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:   ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index){
          return Dismissible(key: Key(items[index]),
              onDismissed: (direction){
            setState(() {
              items.removeAt(index);
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Da xoa ${items[index]}')),
            );
              },
              background: Container(color: Colors.red,),
              child: ListTile(
                title: Text(items[index]),
              ));
        }
        )
    );
  }
}
