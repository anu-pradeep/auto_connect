class Enquiry {
  final String customerName;
  final odometer;
  final String description;
  final bool isInsured;
  final String status;
  final String platePrefix;
  final String plateType;
  final String registerNumber;
  final String stateName;
  Enquiry(
  {
    required this.customerName,
    required this.odometer,
    required this.isInsured,
    required this.status,
    required this.description,
    required this.platePrefix,
    required this.plateType,
    required this.registerNumber,
    required this.stateName,
  });
  factory Enquiry.fromJson(Map<String, dynamic> json) {
    final customer = json['customer'];
    final vehicle = json['vehicle'];
    return Enquiry(
      customerName: customer['name'],
      odometer: json['odo_meter'],
      description: json['description'].toString(),
      isInsured: json['is_insured'] == 1,
      status: json['status'],
      platePrefix: vehicle != null ? vehicle['plate_prefix'] ?? "" : "",
      plateType: vehicle != null ? vehicle['plate_type'] ?? "" : "",
      registerNumber: vehicle != null ? vehicle['register_number'] ?? "" : "",
      stateName: vehicle != null ? vehicle['state_name'] ?? "" : "",

    );
  }
}
