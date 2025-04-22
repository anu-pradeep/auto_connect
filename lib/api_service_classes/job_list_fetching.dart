
class Jobs {
  final String jobNumber;
  final String jobCardDate;
  final String status;
  final bool insured;
  final bool isAccounted;
  final String ?customerName;
  final String ? quotationNo;

  Jobs({
    required this.jobNumber,
    required this.jobCardDate,
    required this.status,
    required this.insured,
    required this.isAccounted,
     required this.customerName,
    required this.quotationNo,
  });

  factory Jobs.fromJson(Map<String, dynamic> json) {
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
    );
  }
}
