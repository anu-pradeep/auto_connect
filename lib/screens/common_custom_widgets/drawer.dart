import 'package:auto_connect/screens/jobs_screen/main_job_screen.dart';
import 'package:auto_connect/screens/quotation_screen/main_quotation_screen.dart';
import 'package:flutter/material.dart';
import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:flutter_svg/svg.dart';
import '../Enquiry_screen/main_enquiry_screen.dart';
import '../customer_screen/main_customer_screen.dart';
import '../main_vehicle_screen/main_vehicle_screen.dart';
import '../sign_in_screen/sign_in_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColors.whiteColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: CustomColors.blackColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 200),
              child:  SvgPicture.asset('assets/images/dropdown_icon.svg')
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.help,
              color: CustomColors.blackColor,
            ),
            title: Text(
              'Enquiries',
              style: TextStyle(
                  fontFamily: 'PoppinsMedium', color: CustomColors.borderColor),
            ),
            onTap: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MainEnquiryScreen()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.insert_drive_file,
              color: CustomColors.blackColor,
            ),
            title: Text(
              'Quotations',
              style: TextStyle(
                  fontFamily: 'PoppinsMedium', color: CustomColors.borderColor),
            ),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MainQuotationScreen()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.work,
              color: CustomColors.blackColor,
            ),
            title: Text(
              'vehicles',
              style: TextStyle(
                  fontFamily: 'PoppinsMedium', color: CustomColors.borderColor),
            ),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const  MainVehicleScreen(),));
            },
          ), ListTile(
            leading: Icon(
              Icons.work,
              color: CustomColors.blackColor,
            ),
            title: Text(
              'Customers',
              style: TextStyle(
                  fontFamily: 'PoppinsMedium', color: CustomColors.borderColor),
            ),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const  MainCustomerScreen(),));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.work,
              color: CustomColors.blackColor,
            ),
            title: Text(
              'Jobs',
              style: TextStyle(
                  fontFamily: 'PoppinsMedium', color: CustomColors.borderColor),
            ),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MainJobScreen()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: CustomColors.blackColor,
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                  fontFamily: 'PoppinsMedium', color: CustomColors.borderColor),
            ),
            onTap: () {
              Navigator.pushReplacement(context, (MaterialPageRoute(builder: (context)=>const SignInScreen())));
            },
          ),
        ],
      ),
    );
  }
}
