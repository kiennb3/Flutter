import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imagepickers extends StatefulWidget {
  const Imagepickers({super.key});

  @override
  State<Imagepickers> createState  () => _ImagepickersState();
}

class _ImagepickersState extends State<Imagepickers> {
  File? image;

  Future<void> pickImage(ImageSource source) async{
    final picker=ImagePicker();
    final pickedFile=await picker.pickImage(source: source);

    setState(() {
      if(pickedFile !=null){
        image =File(pickedFile.path);
      }else{
        print('No image selected');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: Center(
        child: image==null
        ?Text('No image selected')
        :Image.file(image!),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: () => pickImage(ImageSource.camera),
          tooltip: 'Pick image form Camera',
            child: Icon(Icons.camera),
          ),
          SizedBox(height: 16,),
          FloatingActionButton(onPressed: () => pickImage(ImageSource.gallery),
          tooltip: 'Picl Image form gallery',child: Icon(Icons.photo_library),
          )
        ],
      ),
    );
  }
}
