import 'dart:convert';

Failure failureFromJson(String str) => Failure.fromJson(json.decode(str));

String failureToJson(Failure data) => json.encode(data.toJson());

class Failure {
  Failure({
    this.message,
  });

  String? message;

  factory Failure.fromJson(Map<String, dynamic> json) => Failure(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
