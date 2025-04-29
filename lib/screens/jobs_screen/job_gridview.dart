import 'package:auto_connect/api_service_classes/job_list_fetching.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../api_service_classes/joblist_api.dart';
import '../common_custom_widgets/colors.dart';
import '../common_custom_widgets/vehicle_card.dart';

class JobGridview extends StatefulWidget {
  const JobGridview({super.key});

  @override
  State<JobGridview> createState() => _JobGridviewState();
}

class _JobGridviewState extends State<JobGridview> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        controller: _scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          // childAspectRatio: 1.2,
        ),
        itemCount: _jobs.length + (hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == _jobs.length) {
            return const Center(child: CircularProgressIndicator());
          }
          final job = _jobs[index];

          return Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              elevation: 4.0,
              color: CustomColors.whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                         Expanded(
                            child: VehicleCard(
                          prefixText: job.platePrefix,
                          plateSourceText: job.stateName,
                          plateCategoryText: job.plateType,
                          plateNo: job.registerNumber,
                        )),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          decoration: BoxDecoration(
                              color: job.status == 'Active'
                                  ? CustomColors.greenColor
                                  : CustomColors.redColor,
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Text(
                            job.status,
                            style: TextStyle(
                                color: CustomColors.whiteColor,
                                fontFamily: 'PoppinsMedium',
                                fontSize: 10.sp),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        text: 'Job Number: ',
                        style: TextStyle(
                          color: CustomColors.blackColor,
                          fontFamily: 'PoppinsRegular',
                          fontSize: 12.sp,
                        ),
                        children: [
                          TextSpan(
                            text: job.jobNumber,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: CustomColors.blackColor,
                              fontFamily: 'PoppinsMedium',
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Customer Name: ${job.customerName}',
                      style: TextStyle(
                          color: CustomColors.blackColor,
                          fontFamily: 'PoppinsRegular',
                          fontSize: 12.sp),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Quotation No : ${job.quotationNo}',
                      style: TextStyle(
                          color: CustomColors.blackColor,
                          fontFamily: 'PoppinsRegular',
                          fontSize: 12.sp),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Assigned Date: ${job.jobCardDate}',
                      style: TextStyle(
                          color: CustomColors.blackColor,
                          fontFamily: 'PoppinsRegular',
                          fontSize: 12.sp),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: 'Insured : ',
                            style: TextStyle(
                              color: CustomColors.blackColor,
                              fontFamily: 'PoppinsRegular',
                              fontSize: 12.sp,
                            ),
                          ),
                          TextSpan(
                              text: job.insured ? 'Yes' : 'No',
                              style: TextStyle(
                                  color: job.insured
                                      ? CustomColors.greenColor
                                      : CustomColors.redColor,
                                  fontFamily: 'PoppinsRegular',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold))
                        ])),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: 'Accounted : ',
                            style: TextStyle(
                              color: CustomColors.blackColor,
                              fontFamily: 'PoppinsRegular',
                              fontSize: 12.sp,
                            ),
                          ),
                          TextSpan(
                              text: job.isAccounted ? 'Yes' : 'No',
                              style: TextStyle(
                                  color: job.isAccounted
                                      ? CustomColors.greenColor
                                      : CustomColors.redColor,
                                  fontFamily: 'PoppinsRegular',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold))
                        ]))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// ***on scroll function*** ///
  final JobListService _jobListService = JobListService();
  final ScrollController _scrollController = ScrollController();

  final List<Jobs> _jobs = [];
  bool loading = false;
  bool hasMore = true;
  bool firstLoad = true;

  @override
  void initState() {
    super.initState();
    fetchJobList();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          hasMore) {
        fetchJobList();
      }
    });
  }

  Future<void> fetchJobList() async {
    if (loading) return;
    setState(() {
      loading = true;
    });

    try {
      final response = await _jobListService.fetchJobList(3);
      if (response['success'] == true) {

        final List<dynamic> jobListData =
            response['data']['jobs']['data'] ?? [];

        setState(() {
          _jobs.addAll(jobListData
              .map((json) => Jobs.fromJson(json as Map<String, dynamic>))
              .toList());
          hasMore = jobListData.isNotEmpty;
          firstLoad = false;
        });


      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching jobs: $error');
      }
    } finally {
      setState(() {
        loading = false;
      });
    }
  }
}
