import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:riverpod/riverpod.dart';

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
      home: const Main(),
      routes: {
        '/detail': (context) => const DetailScreen(),
      },
    );
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LayoutBuilder Example'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Container(
                  color: Colors.brown,
                  height: 100,
                  child: const Center(
                    child: Text('Brown container', textAlign: TextAlign.center),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  color: Colors.deepOrange,
                  height: 100,
                  child: const Center(
                    child: Text('DeepOrange container', textAlign: TextAlign.center),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  color: Colors.blue,
                  height: 100,
                  child: const Center(
                    child: Text('Blue container', textAlign: TextAlign.center),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.all(16.0),

                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/detail',
arguments: 'a'
                        );
                      },
                      child: const Text('Next'),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16.0),
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              children: [
                Container(
                  height: 100,
                  color: Colors.brown,
                  child: const Center(
                    child: Text('Brown container', textAlign: TextAlign.center),
                  ),
                ),
                Container(
                  color: Colors.deepOrange,
                  child: const Center(
                    child: Text('DeepOrange container', textAlign: TextAlign.center),
                  ),
                ),
                Container(
                  color: Colors.blue,
                  height: 100,
                  child: const Center(
                    child: Text('Blue container', textAlign: TextAlign.center),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.blue,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/detail',
                        arguments: 'a'
                        );
                      },
                      child: const Text('Next'),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
final _formkey=GlobalKey<FormState>();
String? _name;
String? _email;
String? _pass;
String? _nameError;
String? _emailError;
String? _passError;
bool _submitted = false; // Biến cờ để theo dõi trạng thái đã rời khỏi trường nhập liệu hay chưa

@override
  Widget build(BuildContext context) {
    final String message = ModalRoute.of(context)!.settings.arguments as String;
    // final String message = (ModalRoute.of(context)?.settings.arguments as String?) ?? 'default value';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: GestureDetector(
         onTap: (){
           FocusScope.of(context).unfocus();
         },
        child: Form(
          key: _formkey,

        child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            width: 450,

            child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'nhap name',
                  // contentPadding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2.0,)
                  ),
                  errorText: _submitted ? _nameError : null,
                ),
                  onChanged: (_){
                  setState(() {
                    _submitted = false;
                  });
                  },
                  onFieldSubmitted: (_){
                  _submitted=true;
                  },
                  validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Vui long nhap name';
                  }
                  return null;
                  },
              onSaved: (value){
                  _name=value;
              },
            ),


          ),
          Container(
            margin: EdgeInsets.all(16.0),
            width: 490,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'nhap email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 2)
                ),
                errorText: _submitted? _emailError :null,
              ),
              onChanged: (_) {
                setState(() {
                  _submitted = false;
                });
              },
              onFieldSubmitted: (_) {
                _submitted = true;
              },
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Vui lòng nhập email';
                } else if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b').hasMatch(value)) {
                  return 'Email không hợp lệ';
                }
                return null;
              },
              onSaved: (value) {
                _email = value;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            width: 450,

            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'nhap pass',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 2.0)
                ),
                errorText:_submitted? _passError:null,
              ),
              onChanged: (_) {
                setState(() {
                  _submitted=false;
                });
              },
              onFieldSubmitted: (_) {
                _submitted = true;
              },
              validator: (value){
                if(value == null || value.isEmpty  ){
                  return'vui long nhap pass';
                }else if(!RegExp(r'[!@#%^&*(),.?":{}|<>]').hasMatch(value) || value.length <6){
                  return 'Mật khẩu phải chứa ít nhất một ký tự đặc biệt \n và lớn hơn 6 ký tự';

                }
                return null;
              },
              onSaved: (value){
                _pass=value;
              },
            ),

          ),
          ElevatedButton(onPressed: () {
            setState(() {
              _submitted=true;

            });


            if (_formkey.currentState!.validate()){
             _formkey.currentState!.save();
             // developer.log('Name: $_name');
             // developer.log('Email: $_email');
             // developer.log('PassWord: $_pass');
              _showDialog(context, _name, _email, _pass);
            }
          },
              child: Text('submit'),
          )
        ],
        ),
        ),
      )
    );
  }
  void _showDialog(BuildContext context, String? name, String? email , String ? pass){
  showDialog(context: context,
      builder: (BuildContext context){
    return AlertDialog(
      title: Text('Thong tin da nhap'),
      content: Column(
mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name: $name'),
          Text('Email: $email'),
          Text('PassWord: $pass')
        ],
      ),
      actions: [
        TextButton(onPressed: () {
          Navigator.of(context).pop();
        }, child: Text('close'))
      ],
    );
      });
  }

}
