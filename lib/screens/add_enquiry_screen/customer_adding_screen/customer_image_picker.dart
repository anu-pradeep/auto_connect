import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart'; // Import image_picker
import 'dart:io';

import '../../common_custom_widgets/colors.dart';

class CustomerImagePicker extends StatefulWidget {
  const CustomerImagePicker({super.key});

  @override
  _CustomerImagePickerState createState() => _CustomerImagePickerState();
}

class _CustomerImagePickerState extends State<CustomerImagePicker> {
  File? _selectedFile;
  final ImagePicker _picker =
      ImagePicker();


  Future<void> pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedFile = File(image.path);

      });
    }
  }

  Future<void> pickImageFromCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      setState(() {
        _selectedFile = File(photo.path);

      });
    }
  }

  void _showImageSourceBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text(
                  'Choose from Gallery',
                  style: TextStyle(
                      color: CustomColors.borderColor,
                      fontFamily: 'PoppinsRegular',
                      fontSize: 09.sp),
                ),
                onTap: () {
                  Navigator.pop(context);
                  pickImageFromGallery();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Text(
                  'Take a Photo',
                  style: TextStyle(
                      color: CustomColors.borderColor,
                      fontFamily: 'PoppinsRegular',
                      fontSize: 09.sp),
                ),
                onTap: () {
                  Navigator.pop(context);
                  pickImageFromCamera();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Image",
            style: TextStyle(
                fontSize: 13,
                fontFamily: 'PoppinsRegular',
                color: CustomColors.blackColor),
          ),
          const SizedBox(height: 10),
          Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: CustomColors.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: CustomColors.greyColor,
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: _selectedFile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          _selectedFile!,
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Center(
                        child: Icon(
                          Icons.image,
                          color: CustomColors.greyColor,
                          size: 50,
                        ),
                      ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: GestureDetector(
                  onTap:
                      _showImageSourceBottomSheet,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: CustomColors.whiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.edit,
                      size: 18,
                      color: CustomColors.greyColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "Set the vehicle image. Only *.png, *.jpg and *.jpeg \n image files are accepted",
            style: TextStyle(
                fontSize: 12,
                color: CustomColors.greyColor,
                fontFamily: 'PoppinsRegular'),
          ),
        ],
      ),
    );
  }
}
