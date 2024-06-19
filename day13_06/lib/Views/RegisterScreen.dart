import 'package:day13_06/Views/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  final formkey=GlobalKey<FormState>();
  final nameController=TextEditingController();
  final emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image:AssetImage('assets/images/background.png'),
                fit: BoxFit.cover
                )
              ),
            ),
            Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      child: const Center(
                        child: Text('HAPPY CONNECT',
                        style: TextStyle(fontSize: 30,fontWeight: FontWeight.normal,color: Colors.white),
                        ),
                      ),
                    )
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  )
                ),  
                child: Center(
                  child: SingleChildScrollView(
                    child: Container(
                      width: 350,
                      padding: EdgeInsets.all(20),
                      child: Form(
                          key: formkey,
                          child: Column(
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               IconButton(onPressed: () {
                                 Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginHPCN()));
                               }, icon: Icon(Icons.arrow_back_ios)),
                               Text('Đăng ký',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),

                               ),
                               IconButton(onPressed: () {
                                 Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginHPCN()));
                               }, icon: Icon(Icons.arrow_back_ios,color:Colors.transparent ,)),
    
                               
                               
                               
                               
                               ]
                                
                              ),
                             
                              
                              
                              SizedBox(height: 10,),
                            const Text('Nhập thông tin chi tiết của bạn bên dưới'),
                              const SizedBox(height: 15,),
                              TextFormField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  hintText: 'Nhập họ tên',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40)
                                  ),
                                ),
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return'Vui lòng nhap ten';
                                  }
                                  return null;

                                },
                              ),SizedBox(height: 15,),
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: 'Nhập email(VD: abc@gmail.com)',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40)
                                  )
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
                              ),SizedBox(height: 10,),
                            SizedBox(width: 200,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                onPressed: () {
                                       if(formkey.currentState!.validate()){
                                         print('Đăng ký: ${nameController.text}, email ${emailController.text}');
                                       };
                            }, child: Text('Đăng ký',style: TextStyle(color: Colors.white,fontSize: 20),)),
                            ),
                              SizedBox(height: 10,),
                              Text('Bản quyền thuộc về Viettel Software Service')
                            ],
                          )),
                    ),
                  ),
                ),      
                    ),
                )
              ],
            )
          ],
        ),

    );
  }
}
