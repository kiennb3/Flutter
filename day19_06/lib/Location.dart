import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class Locations extends StatefulWidget {
  const Locations({super.key});

  @override
  State<Locations> createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  Location _location=Location();
  String _locationMessage='Vị trí hiện tại của bạn';

  Future<void> getLocation() async{
    try {
      bool serviceEnable;
      PermissionStatus permissionGranted;
      LocationData locationData;

      //kiểm tra vị trí bật chưa
      serviceEnable = await _location.serviceEnabled();
      if (!serviceEnable) {
        serviceEnable = await _location.requestService();
        if (!serviceEnable) {
          return;
        }
      }
      //kiểm tra yêu cầu truy cập
      permissionGranted = await _location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await _location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return;
        }
      }
      //Lấy dữ liệu vị trí hiện tại
      locationData = await _location.getLocation();

      //cập nhật trạng thái với vị trí mới
      setState(() {
        _locationMessage =
        "Latitude: ${locationData.latitude}, Longtitude:${locationData
            .longitude}";
      });
    }catch(e){
      setState(() {
        _locationMessage ='Lỗi khi lấy vị trí: $e';
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lấy vị trí hiện tại')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_locationMessage),
            SizedBox(height: 20,),
            ElevatedButton(onPressed:  getLocation, child: Text('Lấy vị trí'))
          ],
        ),
      ),
    );
  }
}
