import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: APi(),
    );
  }
}

class APi extends StatefulWidget {
  const APi({super.key});

  @override
  State<APi> createState() => _APiState();
}

class _APiState extends State<APi> {
  late Future<String> futureData;



  @override
  void initState() {
    super.initState();
    futureData =fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Example'),
      ),
      body: Center(
      child: FutureBuilder<String>(
        future: futureData ,
        builder: (BuildContext context,AsyncSnapshot snapshot) {
          if(snapshot.connectionState ==ConnectionState.waiting){
            return CircularProgressIndicator();
          }else if(snapshot.hasError){
            return Text('Error: ${snapshot.error}');
          }else if(snapshot.hasData){
            return Text('Date: ${snapshot.data}');
          }else{
            return Text('No data');
          }
        },
      ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: sendPostRequest,child: Icon(Icons.send),),
    );
  }

  Future<String> fetchData()async {
    final response =await http.get(Uri.parse('https://65d5c3c3f6967ba8e3bc7acb.mockapi.io/data'));

    if(response.statusCode ==200){
      return jsonEncode(response.body);
    }else{
      throw Exception('Fail to load data');
    }
  }

  Future<void> sendPostRequest() async {
 final String url='https://65d5c3c3f6967ba8e3bc7acb.mockapi.io/data';
 Map<String, dynamic> requestBody={
'key1':'value1',
   'key2':'value2'
 };
 try{
   final response =await http.post(
     Uri.parse(url),
     headers: {
       'Content-Type':'application/json',
     },
     body: json.encode(requestBody),
   );
   if(response.statusCode==200){
     final responseBody=json.decode(response.body);
     print('Responde: $responseBody');
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text('Post request Successfull: $responseBody'))
     );
   }else{
     print('Failed to send request. Status code: ${response.statusCode}');
     print('Response Body: ${response.body}');
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text('Faile to send request'))
     );
   }
 }catch(e){
   print('Error: $e');
   ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(content: Text('Error: $e'))
   );
 }

  }
}

