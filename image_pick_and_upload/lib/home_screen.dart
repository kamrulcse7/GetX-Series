import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_pick_and_upload/image_controller.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends GetView<ImageController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ImageController());
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Container(
              child: Column(
                children: [
                  Text(
                    "Single Image",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Divider(
                    thickness: 1.0,
                  ),
                  Obx(
                    () => Container(
                        height: 150.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Stack(
                          children: [
                            controller.selectedImagePath.value == ''
                                ? Center(child: Text("No image"))
                                : Image.file(
                                    File(controller.selectedImagePath.value)),
                            Positioned(
                              top: 0,
                              right: 00,
                              child: IconButton(
                                  onPressed: () {
                                    controller.selectedImagePath.value = '';
                                    controller.selectedImageSize.value = '';
                                  },
                                  icon: Icon(Icons.close)),
                            )
                          ],
                        )),
                  ),
                  Obx(() => controller.selectedImageSize.value == ''
                      ? Text("")
                      : Text(controller.selectedImageSize.value)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          controller.getImage(ImageSource.camera);
                        },
                        child: Text("Camera"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.getImage(ImageSource.gallery);
                        },
                        child: Text("Gallery"),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        color: Colors.green,
                        child: Text(
                          "Upload",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
