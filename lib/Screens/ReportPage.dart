import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../Components/Palette.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {

  File? pickedImage;
  // var uuid = Uuid();
  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(0.0),
          ),
          child: Container(
            color: Colors.blue,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });
      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.6,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back,
          size: 25,
        ),
        actions: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Send     ",
              style: TextStyle(
                color: Colors.red,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
        title: Text('\t \t\t\t\t\t\t\t\t Report Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                maxLines: null,
                style: TextStyle(fontSize: 18,),
                decoration: InputDecoration(

                  hintText: "Briefly explain what happened or what's not working...",
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // border: Border.all(
                        //     color: Colors.grey.withOpacity(0.6), width: 2),
                      ),
                      child: ClipRect(
                        child: pickedImage != null ? Image.file(
                          pickedImage!,
                          width: 500,
                          height: 200,
                          fit: BoxFit.cover,
                        )
                            : null,
                      ),
                    ),
                  ],
                ),
              ),

            Align(
              heightFactor: pickedImage ==null?13.5:5.5,
              alignment: Alignment.bottomCenter,
              child: InkWell(onTap: (){
                pickImage(ImageSource.gallery);
              }, child: Container(
                height: 40,

                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.save,size: 35,),
                    Text("Upload",style: TextStyle(fontSize: 20),)
                  ],
                ),
              ), ),
            ),
              
            ],
          ),
        ),
      ),
      );


  }
}
