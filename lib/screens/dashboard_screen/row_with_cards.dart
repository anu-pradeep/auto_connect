import 'package:auto_connect/api_service_classes/dashboard_data_fetching.dart';
import 'package:auto_connect/api_service_classes/joblist_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../api_service_classes/dashboard_api.dart';
import '../../api_service_classes/enquirylist_api.dart';
import '../Enquiry_screen/main_enquiry_screen.dart';
import '../common_custom_widgets/colors.dart';
import '../jobs_screen/main_job_screen.dart';
import '../quotation_screen/main_quotation_screen.dart';
import 'dashboard_cards.dart';

class CardRows extends StatefulWidget {
  const CardRows({super.key});

  @override
  State<CardRows> createState() => _CardRowsState();
}

class _CardRowsState extends State<CardRows> {
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (jobMetrics == null) {
      return const Center(child: Text('No data available'));
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          DashboardCards(
              cardColor: CustomColors.peachColor,
              icons: Icons.help,
              cardText1: '${jobMetrics!.enquiryCount}',
              textColor: CustomColors.whiteColor,
              fontSize: 15.sp,
              iconSize: 35.sp,
              cardText2: 'Enquiries',
              iconColor: CustomColors.whiteColor,
              onTap: fetchEnquiryList),
          const SizedBox(width: 20),
          DashboardCards(
            cardColor: CustomColors.navyBlueColor,
            icons: Icons.insert_drive_file,
            cardText1: '${jobMetrics!.quotationCount}',
            textColor: CustomColors.whiteColor,
            fontSize: 15.sp,
            iconSize: 35.sp,
            cardText2: 'Quotations',
            iconColor: CustomColors.whiteColor,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MainQuotationScreen()),
              );
            },
          ),
          const SizedBox(width: 20),
          DashboardCards(
            cardColor: CustomColors.greenColor,
            icons: Icons.work,
            cardText1: '${jobMetrics!.totalJobs}',
            textColor: CustomColors.whiteColor,
            fontSize: 15.sp,
            iconSize: 35.sp,
            cardText2: 'Total Jobs',
            iconColor: CustomColors.whiteColor,
            onTap:fetchJobsList
          ),
          const SizedBox(width: 20),
          DashboardCards(
            cardColor: CustomColors.lavenderColor,
            icons: Icons.check_circle,
            cardText1: '${jobMetrics!.inProgressJobs}',
            textColor: CustomColors.whiteColor,
            fontSize: 15.sp,
            iconSize: 35.sp,
            cardText2: 'Active Jobs',
            iconColor: CustomColors.whiteColor,
            onTap: () {},
          ),
          const SizedBox(width: 20),
          DashboardCards(
            cardColor: CustomColors.yellowColor,
            icons: Icons.pause_circle,
            cardText1: '${jobMetrics!.onHoldJobs}',
            textColor: CustomColors.whiteColor,
            fontSize: 15.sp,
            iconSize: 35.sp,
            cardText2: 'On Hold Jobs',
            iconColor: CustomColors.whiteColor,
            onTap: () {},
          ),
          const SizedBox(width: 20),
          DashboardCards(
            cardColor: CustomColors.orangeColor,
            icons: Icons.timer,
            cardText1: '${jobMetrics!.pendingJobs}',
            textColor: CustomColors.whiteColor,
            fontSize: 15.sp,
            iconSize: 35.sp,
            cardText2: 'Pending Jobs',
            iconColor: CustomColors.whiteColor,
            onTap: () {},
          ),
          const SizedBox(width: 20),
          DashboardCards(
            cardColor: CustomColors.greenColor,
            icons: Icons.restart_alt_outlined,
            cardText1: '', // Use actual value
            textColor: CustomColors.whiteColor,
            fontSize: 15.sp,
            iconSize: 35.sp,
            cardText2: 'Waiting for Parts',
            iconColor: CustomColors.whiteColor,
            onTap: () {},
          ),
          const SizedBox(width: 20),
          DashboardCards(
            cardColor: CustomColors.skyBlueColor,
            icons: Icons.directions_car,
            cardText1: '${jobMetrics!.completedJobs}',
            textColor: CustomColors.whiteColor,
            fontSize: 15.sp,
            iconSize: 35.sp,
            cardText2: 'Completed Jobs',
            iconColor: CustomColors.whiteColor,
            onTap: () {},
          ),
          const SizedBox(width: 20),
          DashboardCards(
            cardColor: CustomColors.borderColor,
            icons: Icons.traffic,
            cardText1: '${jobMetrics!.testingJobs}',
            textColor: CustomColors.whiteColor,
            fontSize: 15.sp,
            iconSize: 35.sp,
            cardText2: 'Road Testing',
            iconColor: CustomColors.whiteColor,
            onTap: () {},
          ),
          const SizedBox(width: 20),
          DashboardCards(
            cardColor: CustomColors.maronColor,
            icons: Icons.local_car_wash,
            cardText1: '${jobMetrics!.washingJobs}',
            textColor: CustomColors.whiteColor,
            fontSize: 15.sp,
            iconSize: 35.sp,
            cardText2: 'Washing',
            iconColor: CustomColors.whiteColor,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  JobMetrics? jobMetrics;
  bool isLoading = true;
  bool enquiryListLoading = false;
  bool jobListLoading = false;
  @override
  void initState() {
    fetchDashboardData();
    super.initState();
  }

// dashboard api calling
  Future<void> fetchDashboardData() async {
    final service = DashboardService();
    final response = await service.fetchDashboardData(3);
    if (response['success']) {
      final jobMetricsJson = response['data']['jobMetrics'];
      if (kDebugMode) {
        print(jobMetricsJson);
      }
      setState(() {
        jobMetrics = JobMetrics.fromJson(jobMetricsJson);
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      if (kDebugMode) {
        print('Error: ${response['message']}');
      }
    }
  }

  // enquiry list api calling
  Future<void> fetchEnquiryList()
  async {
    setState(() {
      enquiryListLoading = true;
    });
    final enquiryService = EnquiryListService();
    final response = await enquiryService.fetchEnquiryList(3);
    setState(() {
      enquiryListLoading = false;
    });
    if (response['success']) {
      if (kDebugMode) {
        print('enquiry list is : $response');
      }
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const MainEnquiryScreen()));
    }
  }

  // job list api calling
  Future<void> fetchJobsList()
  async {
    setState(() {
      jobListLoading = true;
    });

    final jobService = JobListService();
    final response = await jobService.fetchJobList(3);
    setState(() {
      jobListLoading = false;
    });
    if(response['success'])
    {
      if (kDebugMode) {
        print('Job List : $response');
      }
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const MainJobScreen()));
    }
  }
//   // job list api calling
// Future<void> fetchJobList()
// async {
//   final jobService = JobListService();
//     setState(() {
//       jobListLoading = true;
//     });
//   final response = await jobService.fetchJobsList(3);
//     setState(() {
//       jobListLoading = false;
//     });
//   if(response['success'])
//     {
//       if (kDebugMode) {
//         print('Job List : $response');
//       }
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MainJobScreen()));
//     }
// }
}
