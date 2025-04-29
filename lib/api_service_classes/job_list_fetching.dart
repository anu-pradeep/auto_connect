
class Jobs {
  final String jobNumber;
  final String jobCardDate;
  final String status;
  final bool insured;
  final bool isAccounted;
  final String ?customerName;
  final String ? quotationNo;
  final String platePrefix;
  final String plateType;
  final String registerNumber;
  final String stateName;
  Jobs({
    required this.jobNumber,
    required this.jobCardDate,
    required this.status,
    required this.insured,
    required this.isAccounted,
     required this.customerName,
    required this.quotationNo,
    required this.platePrefix,
    required this.plateType,
    required this.registerNumber,
    required this.stateName,
  });

  factory Jobs.fromJson(Map<String, dynamic> json) {
    final vehicle = json['vehicle'];
    return Jobs(
      jobNumber: json['job_title'].toString() ,
      jobCardDate: json['assigned_date'].toString() ,
      status: json['status'].toString() ,
      insured: json['is_insured'] == 1,
      isAccounted: json['is_accounted'] == 1,
      customerName: json['enquiry'] != null && json['enquiry']['customer'] != null
          ? (json['enquiry']['customer']['name'] ?? 'Unknown').toString()
          : 'Unknown',
      quotationNo: json['quotation']?['quotation_number'].toString(),
      platePrefix: vehicle != null ? vehicle['plate_prefix'] ?? "" : "",
      plateType: vehicle != null ? vehicle['plate_type'] ?? "" : "",
      registerNumber: vehicle != null ? vehicle['register_number'] ?? "" : "",
      stateName: vehicle != null ? vehicle['state_name'] ?? "" : "",

    );
  }
}
