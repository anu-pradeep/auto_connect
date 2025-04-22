import 'package:flutter/material.dart';

class MainQuotationScreen extends StatefulWidget {
  const MainQuotationScreen({super.key});

  @override
  State<MainQuotationScreen> createState() => _MainQuotationScreenState();
}

class _MainQuotationScreenState extends State<MainQuotationScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Quotation Screen'),
      ),
    );
  }
}
