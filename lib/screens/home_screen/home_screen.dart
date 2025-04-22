import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:flutter/material.dart';
import '../common_custom_widgets/drawer.dart';
import '../common_custom_widgets/appbar.dart';
import 'custom_column_with_dropdown.dart';
import 'home_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
      appBar: const HomeAppbar(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 50,top: 50),
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomColumn(),

            ],
          ),
        ),
      ),
    );
  }
}
