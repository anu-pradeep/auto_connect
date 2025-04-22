import 'package:auto_connect/screens/common_custom_widgets/appbar.dart';
import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:auto_connect/screens/common_custom_widgets/custom_heading_text.dart';
import 'package:auto_connect/screens/common_custom_widgets/drawer.dart';
import 'package:auto_connect/screens/main_vehicle_screen/vehicle_container.dart';
import 'package:auto_connect/screens/main_vehicle_screen/vehicle_elevated_button.dart';
import 'package:flutter/material.dart';


class MainVehicleScreen extends StatefulWidget {
  const MainVehicleScreen({super.key});

  @override
  State<MainVehicleScreen> createState() => _MainVehicleScreenState();
}

class _MainVehicleScreenState extends State<MainVehicleScreen> {
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
                      heading: 'Vehicles',
                      colorName: CustomColors.blackColor,
                      fontSize: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 980),
                    child: VehicleElevatedButton(
                      onClick: () {},
                      butColor: CustomColors.redColor,
                      texColor: CustomColors.whiteColor,
                      elevText: 'Add Vehicle',
                    ),
                  )
                ],
              ),
              HeadingText(
                  heading: 'Home - Vehicles',
                  colorName: CustomColors.borderColor,
                  fontSize: 13),
              const SizedBox(height: 18),
              const VehicleContainer()
            ],
          ),
        ),
      )),
    );
  }
}
