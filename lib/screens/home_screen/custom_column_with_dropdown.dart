
import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:auto_connect/screens/common_custom_widgets/custom_heading_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../api_service_classes/dashboard_api.dart';
import '../../api_service_classes/dropdown_selection_api.dart';
import '../common_custom_widgets/elevated_button.dart';
import '../dashboard_screen/dashboard.dart';
import 'firm_selection_dropdown.dart';

class CustomColumn extends StatefulWidget {
  const CustomColumn({super.key});

  @override
  State<CustomColumn> createState() => _CustomColumnState();
}

class _CustomColumnState extends State<CustomColumn> {
  List<Map<String, dynamic>> firms = [];
  String? selectedFirm;
  bool isLoading = true;

  final FirmSelectionClass _firmSelectionClass = FirmSelectionClass();
  final DashboardService _dashboardService = DashboardService();

  @override
  void initState() {
    super.initState();
    loadFirms();
  }

  Future<void> loadFirms() async {
    try {
      final fetchedFirms = await _firmSelectionClass.fetchFirms();
      setState(() {
        firms = fetchedFirms;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      if (kDebugMode) {
        print('Error fetching firms: $e');
      }
    }
  }

  Future<void> saveFirmSelection() async {
    if (selectedFirm == null) {

      return;
    }
    setState(() {
      isLoading = false;
    });
    final firmId =
    firms.firstWhere((firm) => firm['name'] == selectedFirm)['id'];

    final response = await _dashboardService.fetchDashboardData(firmId);

    if (response['success'] == true) {

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Dashboard()));
    } else {
      if (kDebugMode) {
        print('Error: ${response['message']}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, right: 20, bottom: 60),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingText(
              heading: 'Set Default Firm',
              colorName: CustomColors.blackColor,
              fontSize: 20,
            ),
            const SizedBox(height: 18),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
              width: 430,
              child: SearchableFirmDropdown(
                hintText: 'Select a Firm',
                firms: firms,
                onItemSelected: (selected) {
                  setState(() {
                    selectedFirm = selected;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 130,
                right: 50,
                top: 40,
              ),
              child: CommonElevatedButton(
                elevatedText: 'Save',
                buttonColor: CustomColors.redColor,
                textColor: CustomColors.whiteColor,
                onSave: saveFirmSelection, fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
