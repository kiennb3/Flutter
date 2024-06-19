import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class Locationss extends StatefulWidget {
  const Locationss({super.key});

  @override
  State<Locationss> createState() => _LocationssState();
}

class _LocationssState extends State<Locationss> {
  Location _location = Location();
  String _locationMessage = "Vị trí hiện tại của bạn sẽ hiển thị ở đây.";

  Future<void> _getLocation() async {
    try {
      bool serviceEnabled;
      PermissionStatus permissionGranted;
      LocationData locationData;

      // Kiểm tra nếu dịch vụ vị trí đã được bật
      serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _location.requestService();
        if (!serviceEnabled) {
          return;
        }
      }

      // Kiểm tra và yêu cầu quyền truy cập vị trí
      permissionGranted = await _location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await _location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      // Lấy dữ liệu vị trí hiện tại
      locationData = await _location.getLocation();

      // Cập nhật trạng thái với vị trí mới
      setState(() {
        _locationMessage = "Latitude: ${locationData.latitude}, Longitude: ${locationData.longitude}";
      });
    } catch (e) {
      // Bắt và xử lý lỗi
      setState(() {
        _locationMessage = "Lỗi khi lấy vị trí: $e";
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lấy Vị Trí Hiện Tại'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_locationMessage),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getLocation,
              child: const Text('Lấy Vị Trí'),
            ),
          ],
        ),
      ),
    );
  }
}

