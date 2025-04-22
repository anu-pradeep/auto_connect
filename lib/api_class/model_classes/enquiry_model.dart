class InspectionDetails {
  final String customerId;
  final bool isInsured;
  final String? insuranceId;
  final String? policyNumber;
  final String? policeReport;

  InspectionDetails({
    required this.customerId,
    required this.isInsured,
    this.insuranceId,
    this.policyNumber,
    this.policeReport,
  });
}