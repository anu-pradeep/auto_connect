import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:auto_connect/screens/common_custom_widgets/custom_heading_text.dart';
import 'package:auto_connect/screens/jobs_views_screen/service_details_card.dart';
import 'package:auto_connect/screens/jobs_views_screen/vehicle_details_card.dart';
import 'package:flutter/material.dart';
import '../common_custom_widgets/drawer.dart';
import '../common_custom_widgets/appbar.dart';
import 'card_for_products.dart';
import 'card_for_services.dart';
import 'container_row.dart';
import 'customer_details_card.dart';


class JobViewScreen extends StatefulWidget {
  const JobViewScreen({super.key});

  @override
  State<JobViewScreen> createState() => _JobViewScreenState();
}

class _JobViewScreenState extends State<JobViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
      appBar: const CustomAppbar(),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadingText(
                      heading: 'Jobs',
                      colorName: CustomColors.blackColor,
                      fontSize: 20,
                    ),
                    const SizedBox(height: 18),
                    HeadingText(
                      heading: 'View - Jobs',
                      colorName: CustomColors.borderColor,
                      fontSize: 13,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ContainerRow(text: 'Overview'),
                    ContainerRow(text: 'Technicians'),
                    ContainerRow(text: 'Invoice'),
                    ContainerRow(text: 'Gate pass'),
                    ContainerRow(text: 'Attachments'),
                    ContainerRow(text: 'Service history'),
                    ContainerRow(text: 'Summary'),
                  ],
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: SizedBox(
                      height: 320,
                      width: 610,
                      child: CustomerCard(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: SizedBox(
                        height: 320, width: 610, child: VehicleCards()),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: SizedBox(height: 350, width: 1250, child: ServiceCard()),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: SizedBox(
                  height: 210,
                  width: 1250,
                  child: CardForServices(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: SizedBox( height: 210,
                    width: 1250,child: CardForProducts()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
