import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class FutureExample extends StatefulWidget {
  const FutureExample({super.key});

  @override
  State<FutureExample> createState() => _FutureExampleState();
}

class _FutureExampleState extends State<FutureExample> {
late Future<String> _futureData;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future Example'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: _futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Hiển thị khi đợi dữ liệu
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // Hiển thị nếu có lỗi
              return Text('Error: ${snapshot.error}');
            } else {
              // Hiển thị dữ liệu đã nhận được
              return Text('Data: ${snapshot.data}');
              
            }
          },
        ),
      ),
    );
  }


  Future<String> fetchData() async{
         final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

         if(response.statusCode ==200){
           return jsonDecode(response.body)['title'];
         }else{
           throw Exception('Failed to load data');
         }

  }
}
