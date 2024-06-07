import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Responsive extends StatefulWidget {
  const Responsive({super.key});

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {



  @override
  Widget build(BuildContext context) {
    // Lấy thông tin kích thước màn hình
    var screenWidth =MediaQuery.of(context).size.width;
    var screenHeight =MediaQuery.of(context).size.height;
    var isPortrait =MediaQuery.of(context).orientation ==Orientation.portrait;
    var screenSize =MediaQuery.of(context).size;
    // Xác định xem màn hình có phải là lớn hay không
    bool isLargeScreen= screenSize.width >600;

    return Scaffold(
      body: Center(
        child: isPortrait ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 0.8,
              height: screenHeight * 0.2,
              color: Colors.brown,
              child: Center(child: Text('Portrait Mode'),),
            )
          ],
        ):
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width:  screenHeight * 0.4,
                  height: screenHeight * 0.8,
                  color: Colors.cyan,
                  child: Center(child: Text('Landspace Mode'),),
                )
              ],
            )
      ),

    );
  }
}
