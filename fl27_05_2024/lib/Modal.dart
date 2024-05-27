import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Modal extends StatefulWidget {
  const Modal({super.key});

  @override
  State<Modal> createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: ElevatedButton(
          onPressed: (){
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context){
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ListTile(
                            leading: Icon(Icons.settings),
                            title: Text('Setting'),
                            onTap: (){
                              Navigator.pop(context);
                            },

                          ),
                          ListTile(
                            leading: Icon(Icons.info),
                            title: Text('About'),
                            onTap: (){
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ),
                  );
                }
                );
          },
          child: Text('Open Modal sheet'),
        ),
      ),

    );
  }
}
