class Customer {
  final int id;
  final String name;
  final String? email;
  final String? phone;
  final String? outsideOrGp;
  final int status;

  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.outsideOrGp,
    this.status = 0,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"] ?? 0,
        name: json["name"] ?? 'No Name',
        email: json["email"],
        phone: json["phone"],
        outsideOrGp: json["outside_or_gp"],
        status: json["status"] as int? ?? 0,
      );

  String get statusText => status == 0 ? 'Active' : 'Inactive';
}
