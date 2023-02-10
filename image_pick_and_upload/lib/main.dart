import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_pick_and_upload/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      home: HomeScreen(),
    );
  }
}
