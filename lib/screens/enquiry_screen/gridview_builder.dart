import 'package:auto_connect/api_service_classes/enquirylist_fetching.dart';
import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:auto_connect/screens/common_custom_widgets/vehicle_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../api_service_classes/enquirylist_api.dart';

class EnquiryGridview extends StatefulWidget {
  const EnquiryGridview({super.key});

  @override
  State<EnquiryGridview> createState() => _EnquiryGridviewState();
}

class _EnquiryGridviewState extends State<EnquiryGridview> {
  final GlobalKey<_EnquiryGridviewState> _enquiryGridViewKey =
      GlobalKey<_EnquiryGridviewState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          key: _enquiryGridViewKey,
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
          childAspectRatio: 1.2,// grid card height
          crossAxisSpacing: 0.5
          ),
          itemCount: _enquiries.length + (_hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == _enquiries.length) {
              return const Center(child: CircularProgressIndicator());
            }
            final enquiry = _enquiries[index];
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Card(
                elevation: 4.0,
                color: CustomColors.whiteColor,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          VehicleCard(
                            prefixText: enquiry.platePrefix,
                            plateSourceText: enquiry.stateName,
                            plateCategoryText: enquiry.plateType,
                            plateNo: enquiry.registerNumber,
                          ),
                          const SizedBox(width: 20),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            decoration: BoxDecoration(
                              color: enquiry.status == 'Active'
                                  ? CustomColors.greenColor
                                  : CustomColors.redColor,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Text(
                              enquiry.status,
                              style: TextStyle(
                                  color: CustomColors.whiteColor,
                                  fontFamily: 'PoppinsMedium',
                                  fontSize: 12.sp),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Customer Name : ${enquiry.customerName}',
                        style: TextStyle(
                            color: CustomColors.blackColor,
                            fontFamily: 'PoppinsRegular',
                            fontSize: 13.sp),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 25),
                      Text(
                        enquiry.description,
                        style: TextStyle(
                            color: CustomColors.blackColor,
                            fontFamily: 'PoppinsRegular',
                            fontSize: 13.sp),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 25),
                      Text(
                        'Odometer : ${enquiry.odometer}',
                        style: TextStyle(
                            color: CustomColors.blackColor,
                            fontFamily: 'PoppinsRegular',
                            fontSize: 13.sp),
                      ),
                      const SizedBox(height: 25),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Insured: ',
                              style: TextStyle(
                                color: CustomColors.blackColor,
                                fontFamily: 'PoppinsRegular',
                                fontSize: 13.sp,
                              ),
                            ),
                            TextSpan(
                              text: enquiry.isInsured ? "Yes" : "No",
                              style: TextStyle(
                                  color: enquiry.isInsured
                                      ? CustomColors.greenColor
                                      : CustomColors.redColor,
                                  fontFamily: 'PoppinsMedium',
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  /// *** functions *** ///
  final EnquiryListService _enquiryListService = EnquiryListService();
  final ScrollController _scrollController = ScrollController();
  final List<Enquiry> _enquiries = [];
  bool _isLoading = false;
  bool _hasMore = true;
  @override
  void initState() {
    super.initState();
    fetchEnquiries();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          _hasMore) {
        fetchEnquiries();
      }
    });
  }

  Future<void> fetchEnquiries() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _enquiryListService.fetchEnquiryList(3);

      if (response['success'] == true) {
        final List<dynamic> enquiriesData =
            response['data']['enquiries']['data'] ?? [];
        setState(() {
          _enquiries.addAll(enquiriesData
              .map((json) => Enquiry.fromJson(json as Map<String, dynamic>))
              .toList());
          _hasMore = enquiriesData.isNotEmpty;
        });
      } else {
        if (kDebugMode) {
          print('Error: ${response['message']}');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching enquiries: $error');
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void refreshEnquiries() {
    if (mounted) {
      setState(() {
        _enquiries.clear();
        _hasMore = true;
      });
      fetchEnquiries();
    }
  }
}
