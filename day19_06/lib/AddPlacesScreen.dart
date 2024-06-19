import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Addplacesscreen extends StatefulWidget {
  const Addplacesscreen({super.key});

  @override
  State<Addplacesscreen> createState() => _AddplacesscreenState();
}

class _AddplacesscreenState extends State<Addplacesscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm Địa Điểm'),
      ),
      body: Center(
        child: Text('Biểu mẫu để thêm địa điểm mới sẽ hiển thị ở đây!'),
      ),
    );
  }
}
