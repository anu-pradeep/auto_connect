// class Vehicle {
//   final  customerId;
//   final String platePrefix;
//   final String plateType;
//   final String registerNumber;
//   final String stateName;
//   final  model;
//   final  brand;
//    String ? brandName;
//
//   Vehicle( {
//     required this.customerId,
//     required this.platePrefix,
//     required this.plateType,
//     required this.registerNumber,
//     required this.stateName,
//     required this.model,
//     required this.brand,
//      this.brandName,
//   });
//
//   factory Vehicle.fromJson(Map<String, dynamic> json) {
//     return Vehicle(
//         customerId: json['customer_id'],
//         platePrefix: json['plate_prefix'] ?? '',
//         plateType: json['plate_type'] ?? '',
//         registerNumber: json['register_number'].toString(),
//         stateName: json['state_name'] ?? '',
//         model: json['model_id'] ?? 0,
//         brand: json['brand_id'] ?? 0
//     );
//   }
// }
class Vehicle {
  final String customerId;
  final String platePrefix;
  final String plateType;
  final String registerNumber;
  final String stateName;
  final String model;
  final String brand;
  String? brandName;
  String? modelName;
  String customerName;

  Vehicle({
    required this.customerId,
    required this.platePrefix,
    required this.plateType,
    required this.registerNumber,
    required this.stateName,
    required this.model,
    required this.brand,
    this.brandName,
    this.modelName,
   required this.customerName,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      customerId: json['customer_id'].toString(),
      platePrefix: json['plate_prefix'] ?? '',
      plateType: json['plate_type'] ?? '',
      registerNumber: json['register_number'].toString(),
      stateName: json['state_name'] ?? '',
      model: json['model_id'].toString(),
      brand: json['brand_id'].toString(), customerName: json['name'].toString(),
    );
  }
}