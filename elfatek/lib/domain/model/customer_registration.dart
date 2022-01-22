// To parse this JSON data, do
//
//     final customerRegistration = customerRegistrationFromJson(jsonString);

import 'dart:convert';

List<CustomerRegistration> customerRegistrationFromJson(String str) =>
    List<CustomerRegistration>.from(
        json.decode(str).map((x) => CustomerRegistration.fromJson(x)));

String customerRegistrationToJson(CustomerRegistration data) =>
    json.encode(data.toJson());

class CustomerRegistration {
  CustomerRegistration({
    this.id,
    required this.customerName,
    required this.customerTitle,
    required this.customerAuthorizedName,
    this.adress,
    this.currentMainGroup,
    this.currentSecondGroup,
    this.city,
    this.district,
    this.country,
    this.businessPhone1,
    this.businessPhone2,
    this.faxNumber,
    this.gsmNumber,
    this.taxAdministration,
    this.taxNumber,
    this.email1,
    this.email2,
    this.websiteAddress,
    this.isActive,
    this.customerStatus,
    this.customerRepresentative,
    this.franchisePossibility,
    this.dealerProbability,
    this.registrationDate,
    this.availableProductBrand,
    this.productQuantity,
    this.showReference,
    required this.customerSatisfied,
    this.explanation,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? customerName;
  String? customerTitle;
  String? customerAuthorizedName;
  String? adress;
  String? currentMainGroup;
  String? currentSecondGroup;
  String? city;
  String? district;
  String? country;
  int? businessPhone1;
  int? businessPhone2;
  int? faxNumber;
  int? gsmNumber;
  String? taxAdministration;
  int? taxNumber;
  String? email1;
  String? email2;
  String? websiteAddress;
  int? isActive;
  String? customerStatus;
  String? customerRepresentative;
  int? franchisePossibility;
  int? dealerProbability;
  DateTime? registrationDate;
  String? availableProductBrand;
  int? productQuantity;
  int? showReference;
  int? customerSatisfied;
  String? explanation;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory CustomerRegistration.fromJson(Map<String, dynamic> json) =>
      CustomerRegistration(
        id: json["id"],
        customerName: json["customer_name"],
        customerTitle: json["customer_title"],
        customerAuthorizedName: json["customer_authorized_name"],
        adress: json["adress"],
        currentMainGroup: json["current_main_group"],
        currentSecondGroup: json["current_second_group"],
        city: json["city"],
        district: json["district"],
        country: json["country"],
        businessPhone1: json["business_phone_1"],
        businessPhone2: json["business_phone_2"],
        faxNumber: json["fax_number"],
        gsmNumber: json["gsm_number"],
        taxAdministration: json["tax_administration"],
        taxNumber: json["tax_number"],
        email1: json["email_1"],
        email2: json["email_2"],
        websiteAddress: json["website_address"],
        isActive: json["is_active"],
        customerStatus: json["customer_status"],
        customerRepresentative: json["customer_representative"],
        franchisePossibility: json["franchise_possibility"],
        dealerProbability: json["dealer_probability"],
        registrationDate: DateTime.parse(json["registration_date"]),
        availableProductBrand: json["available_product_brand"],
        productQuantity: json["product_quantity"],
        showReference: json["show_reference"],
        customerSatisfied: json["customer_satisfied"],
        explanation: json["explanation"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_name": customerName,
        "customer_title": customerTitle,
        "customer_authorized_name": customerAuthorizedName,
        "adress": adress ?? '',
        "current_main_group": currentMainGroup ?? '',
        "current_second_group": currentSecondGroup ?? '',
        "city": city ?? '',
        "district": district ?? '',
        "country": country ?? '',
        "business_phone_1": businessPhone1 ?? 0,
        "business_phone_2": businessPhone2 ?? 0,
        "fax_number": faxNumber ?? 0,
        "gsm_number": gsmNumber ?? 0,
        "tax_administration": taxAdministration ?? '',
        "tax_number": taxNumber ?? 0,
        "email_1": email1 ?? '',
        "email_2": email2 ?? '',
        "website_address": websiteAddress ?? '',
        "is_active": isActive ?? 0,
        "customer_status": customerStatus ?? '',
        "customer_representative": customerRepresentative ?? '',
        "franchise_possibility": franchisePossibility ?? 0,
        "dealer_probability": dealerProbability ?? 0,
        "registration_date":
            "${registrationDate!.year.toString().padLeft(4, '0')}-${registrationDate!.month.toString().padLeft(2, '0')}-${registrationDate!.day.toString().padLeft(2, '0')}",
        "available_product_brand": availableProductBrand ?? '',
        "product_quantity": productQuantity ?? 0,
        "show_reference": showReference ?? 0,
        "customer_satisfied": customerSatisfied ?? 0,
        "explanation": explanation ?? '',
        "user_id": userId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
