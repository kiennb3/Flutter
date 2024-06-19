import 'package:day13_06/Views/HomeScreen.dart';
import 'package:day13_06/Views/RegisterScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LoginHPCN extends StatefulWidget {
  const LoginHPCN({super.key});

  @override
  State<LoginHPCN> createState() => _LoginHPCNState();
}

class _LoginHPCNState extends State<LoginHPCN> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
var _obscurePassword=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Ảnh nền
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'), // Đường dẫn tới ảnh nền
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Nội dung chia màn hình
          Column(
            children: [
              Expanded(
                flex: 2, // Tùy chọn, để đảm bảo rằng phần này chiếm 1/3 chiều cao của màn hình
                child: Container(
                  // Màu nền có độ mờ
                  child: const Center(
                    child: Text(
                      'HAPPY CONNECT',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2, // Tùy chọn, để đảm bảo rằng phần này chiếm 2/3 chiều cao của màn hình
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30)
                    )
                  ),


                  child: Center(
                    child: SingleChildScrollView(
                      child: Container(
                        width: 350,
                        padding: EdgeInsets.all(20),
                        child: Form(
                          key: _formkey,
                          child: Column(
                      
                            children: [
                              const Column(
                      
                                children: [
                                  Text(
                                    'Đăng nhập',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text('Nhập thông tin chi tiết của bạn bên dưới'),
                                ],
                              ),
                              const SizedBox(height: 30,),
                              TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  hintText: 'Nhập tài khoản',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Vui lòng nhập địa chỉ email';
                                  }
                                  // Kiểm tra định dạng email bằng biểu thức chính quy
                                  bool isValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
                                  if (!isValid) {
                                    return 'Địa chỉ email không hợp lệ';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20,),
                              TextFormField(
                                controller: _passwordController,
                                obscureText: _obscurePassword,
                                decoration: InputDecoration(
                                  hintText: 'Nhập mật khẩu',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscurePassword= !_obscurePassword;
                                      });
                                    },
                                    child: Icon(_obscurePassword ? PhosphorIconsBold.eyeClosed : PhosphorIconsBold.eye),
                                  )
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Vui lòng nhập mật khẩu';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20,),
                              SizedBox(
                                width: 200,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  onPressed: () {
                                    if (_formkey.currentState!.validate()) {
                                      print(
                                        'Đăng nhập với tên đăng nhập: ${_emailController.text}, mật khẩu: ${_passwordController.text}',
                                      );
                                    };
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homescreen()));
                                  },
                                  child: const Text(
                                    'Đăng nhập',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                               Navigator.push(context,MaterialPageRoute(builder: (context) =>Registerscreen()) );
                                    },
                                    child: const Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                              text: 'Bạn chưa có tài khoản?'
                                          ),
                                          TextSpan(
                                            text: ' Đăng ký',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Text('Chính sách bảo mật và quyền riêng tư'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
