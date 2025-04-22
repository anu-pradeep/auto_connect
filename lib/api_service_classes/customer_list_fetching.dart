// class Customer {
//   final  id;
//   // final int firmId;
//   // final int careOfId;
//   final String name;
//   // final String? address;
//   final  email;
//   final  phone;
//   // final String? contactPerson;
//   // final String? contactNo;
//   // final String? contact2;
//   // final String? fax;
//   // final String? paymentTerms;
//   // final String? paymentType;
//   // final String? fileNumber;
//   final String? outsideOrGp;
//   // final String creditOrCash;
//   // final int? creditDays;
//   // final String? trnNo;
//   // final String? trnAttachment;
//   // final String? tradeLicenseNo;
//   // final String? tradeLicenseExpiry;
//   // final String? tradeLicenseAttachment;
//   // final String? creditFormReferenceNumber;
//   // final String? creditFormAttachment;
//   // final String? followUpStaff;
//   // final String? vatCertificate;
//   // final String? passportEidNo;
//   // final String? passportEidExpiry;
//   // final String? logo;
//   // final String? website;
//   final String status;
//   // final String? billingEmail;
//   // final String? remark;
//   // final String createdAt;
//   // final String updatedAt;
//   // final int customerTypeId;
//   // final String? segment;
//   // final String? goldenConnectFirmId;
//   // final int isGpCompany;
//
//   Customer({
//     required this.id,
//     // required this.firmId,
//     // required this.careOfId,
//     required this.name,
//     // this.address,
//     required this.email ,
//     required this.phone ,
//     // this.contactPerson,
//     // this.contactNo,
//     // this.contact2,
//     // this.fax,
//     // this.paymentTerms,
//     // this.paymentType,
//     // this.fileNumber,
//     this.outsideOrGp,
//     // required this.creditOrCash,
//     // this.creditDays,
//     // this.trnNo,
//     // this.trnAttachment,
//     // this.tradeLicenseNo,
//     // this.tradeLicenseExpiry,
//     // this.tradeLicenseAttachment,
//     // this.creditFormReferenceNumber,
//     // this.creditFormAttachment,
//     // this.followUpStaff,
//     // this.vatCertificate,
//     // this.passportEidNo,
//     // this.passportEidExpiry,
//     // this.logo,
//     // this.website,
//     required this.status,
//     // this.billingEmail,
//     // this.remark,
//     // required this.createdAt,
//     // required this.updatedAt,
//     // required this.customerTypeId,
//     // this.segment,
//     // this.goldenConnectFirmId,
//     // required this.isGpCompany,
//   });
//
//   factory Customer.fromJson(Map<String, dynamic> json) => Customer(
//     id: json["id"],
//     // firmId: json["firm_id"],
//     // careOfId: json["care_of_id"],
//     name: json["name"],
//     // address: json["address"],
//     email: (json["email"] ?? '').toString(),
//     phone: (json["phone"] ?? '').toString(),
//     // contactPerson: json["contact_person"],
//     // contactNo: json["contact_no"],
//     // contact2: json["contact2"],
//     // fax: json["fax"],
//     // paymentTerms: json["payment_terms"],
//     // paymentType: json["payment_type"],
//     // fileNumber: json["file_number"],
//     outsideOrGp: json["outside_or_gp"].toString(),
//     // creditOrCash: json["credit_or_cash"],
//     // creditDays: json["credit_days"],
//     // trnNo: json["trn_no"],
//     // trnAttachment: json["trn_attachment"],
//     // tradeLicenseNo: json["trade_license_no"],
//     // tradeLicenseExpiry: json["trade_license_expiry"],
//     // tradeLicenseAttachment: json["trade_license_attachment"],
//     // creditFormReferenceNumber: json["credit_form_reference_number"],
//     // creditFormAttachment: json["credit_form_attachment"],
//     // followUpStaff: json["follow_up_staff"],
//     // vatCertificate: json["vat_certificate"],
//     // passportEidNo: json["passport_eid_no"],
//     // passportEidExpiry: json["passport_eid_expiry"],
//     // logo: json["logo"],
//     // website: json["website"],
//     status: json["status"],
//     // billingEmail: json["billing_email"],
//     // remark: json["remark"],
//     // createdAt: json["created_at"],
//     // updatedAt: json["updated_at"],
//     // customerTypeId: json["customer_type_id"],
//     // segment: json["segment"],
//     // goldenConnectFirmId: json["golden_connect_firm_id"],
//     // isGpCompany: json["is_gp_company"],
//   );
//
// }
// class Customer {
//   final int id;
//   final String name;
//   final String? email; // Nullable
//   final String? phone; // Nullable
//   final String? outsideOrGp;
//   final int status;
//
//   Customer({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.phone,
//     this.outsideOrGp,
//     required this.status,
//   });
//
//   factory Customer.fromJson(Map<String, dynamic> json) => Customer(
//     id: json["id"] ?? 0,
//     name: json["name"] ?? 'No Name',
//     email: json["email"] ?? json["customer_email"]?.toString(), // Fallback
//     phone: json["phone"] ?? json["mobile"]?.toString(), // Fallback
//     outsideOrGp: json["outside_or_gp"] ?? json["customer_type"]?.toString(), // Fallback
//     status: json["status"] as int? ?? 0,
//   );
//   String get statusText => status == 0 ? 'Active' : 'Inactive';
// }
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
    this.status = 0, // Default to Active
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"] ?? 0,
    name: json["name"] ?? 'No Name',
    email: json["email"], // Optional
    phone: json["phone"], // Optional
    outsideOrGp: json["outside_or_gp"], // Optional
    status: json["status"] as int? ?? 0, // Default to 0 (Active)
  );

  String get statusText => status == 0 ? 'Active' : 'Inactive';
}