import 'package:auto_connect/screens/customer_screen/customer_elevated_button.dart';
import 'package:flutter/material.dart';

import '../common_custom_widgets/appbar.dart';
import '../common_custom_widgets/colors.dart';
import '../common_custom_widgets/custom_heading_text.dart';
import '../common_custom_widgets/drawer.dart';
import 'customer_container.dart';

class MainCustomerScreen extends StatefulWidget {
  const MainCustomerScreen({super.key});

  @override
  State<MainCustomerScreen> createState() => _MainCustomerScreenState();
}

class _MainCustomerScreenState extends State<MainCustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
      appBar: const CustomAppbar(),
      drawer: const CustomDrawer(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  HeadingText(
                      heading: 'Customers',
                      colorName: CustomColors.blackColor,
                      fontSize: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 980),
                    child: CustomerElevatedButton(
                        onClick: () {},
                        butColor: CustomColors.redColor,
                        texColor: CustomColors.whiteColor,
                        elevText: 'Add customer'),
                  )
                ],
              ),
              HeadingText(
                  heading: 'Home - Customer',
                  colorName: CustomColors.borderColor,
                  fontSize: 13),
              const SizedBox(height: 18),
              const CustomerContainer(),
            ],
          ),
        ),
      )),
    );
  }
}
