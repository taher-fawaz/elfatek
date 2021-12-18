import 'dart:convert';

CustomerRegistrationModel productsModelFromJson(String str) =>
    CustomerRegistrationModel.fromJson(json.decode(str));
String customerRegistrationModelToJson(
        CustomerRegistrationModel customerRegistration) =>
    json.encode(customerRegistration.toJson());

class CustomerRegistrationModel {
  List<CustomerRegistration> data;

  CustomerRegistrationModel({required this.data});

  factory CustomerRegistrationModel.fromJson(Map<String, dynamic> json) =>
      CustomerRegistrationModel(
        data: List<CustomerRegistration>.from(
            json['data'].map((p) => CustomerRegistration.fromJson(p))),
      );

  Map<String, dynamic> toJson() =>
      {"data": List<CustomerRegistration>.from(data.map((d) => d.toJson()))};
}

class CustomerRegistration {
  int id;
  String customerName;
  String customerTitle;
  String customerRepresentative;
  String adress;

  CustomerRegistration(
      {required this.id,
      required this.customerName,
      required this.customerTitle,
      required this.customerRepresentative,
      required this.adress});

  factory CustomerRegistration.fromJson(Map<String, dynamic> json) =>
      CustomerRegistration(
          id: json['id'],
          customerName: json['customer_name'],
          customerTitle: json['customer_title'],
          customerRepresentative: json['customer_representative'],
          adress: json['adress']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_name": customerName,
        "customer_title": customerTitle,
        "customer_representative": customerRepresentative,
        "adress": adress,
      };
}
