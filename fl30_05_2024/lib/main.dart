import 'package:fl30_05_2024/AvailableSpace.dart';
import 'package:fl30_05_2024/Responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,// Chỉ cho phép chế độ chân dung hướng lên
    // DeviceOrientation.portraitDown, // Chỉ cho phép chế độ chân dung hướng xuống
    // DeviceOrientation.landscapeLeft, // Chỉ cho phép chế độ phong cảnh hướng trái
    // DeviceOrientation.landscapeRight, // Chỉ cho phép chế độ phong cảnh hướng phải
  ]).then((_){
    runApp(const MyApp());
  });



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
      home: const Availablespace()
    );
  }
}
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey=GlobalKey<FormState>(); // quản lý trạng thái form
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passWordController=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Padding(padding: const EdgeInsets.all(16.0),
      child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email'
                ),
                validator: (value)  {
                  if (value ==null || value.isEmpty){
                    return 'Hãy nhập đủ thong tin';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)){
                     return 'hãy nhập dung dinh dang ';
                  } return null;
                },
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                controller: _passWordController ,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Pass'
                ),
                validator: (value) {
                  if (value ==null|| value.isEmpty){
                    return'please enter your pass';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0,),
              ElevatedButton(onPressed: () {
                if (_formKey.currentState?.validate() ?? false){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Logginf in')),
                  );
                }
                  
              }, child: Text('login'))
            ],

      )),
      ),
    );
  }
}


