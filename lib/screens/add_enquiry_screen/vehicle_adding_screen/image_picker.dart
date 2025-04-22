import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Import image_picker
import 'dart:io';

import '../../common_custom_widgets/colors.dart'; // Assuming this is your custom colors file

class VehicleImagePicker extends StatefulWidget {
  const VehicleImagePicker({super.key});

  @override
  _VehicleImagePickerState createState() => _VehicleImagePickerState();
}

class _VehicleImagePickerState extends State<VehicleImagePicker> {
  File? _selectedFile;
  final ImagePicker _picker = ImagePicker(); // Create an instance of ImagePicker

  // Function to pick an image from the gallery
  Future<void> pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedFile = File(image.path); // Convert XFile to File
      });
    }
  }

  // Function to take a photo using the camera
  Future<void> pickImageFromCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      setState(() {
        _selectedFile = File(photo.path); // Convert XFile to File
      });
    }
  }

  // Function to show a bottom sheet for choosing between gallery and camera
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
                title: const Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(context); // Close the bottom sheet
                  pickImageFromGallery(); // Pick image from gallery
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a Photo'),
                onTap: () {
                  Navigator.pop(context); // Close the bottom sheet
                  pickImageFromCamera(); // Take a photo using the camera
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
                fontFamily: 'PoppinsMedium',
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
                  onTap: _showImageSourceBottomSheet, // Show bottom sheet to choose source
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