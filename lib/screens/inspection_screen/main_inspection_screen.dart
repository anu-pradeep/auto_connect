import 'package:flutter/material.dart';

class MainInspectionScreen extends StatefulWidget {
  const MainInspectionScreen({super.key});

  @override
  State<MainInspectionScreen> createState() => _MainInspectionScreenState();
}

class _MainInspectionScreenState extends State<MainInspectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('INSPECTION SCREEN'),
      ),
    );
  }
}
