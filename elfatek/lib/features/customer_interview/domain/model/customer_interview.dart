// To parse this JSON data, do
//
//     final customerInterview = customerInterviewFromJson(jsonString);

import 'dart:convert';

List<CustomerInterview> customerInterviewFromJson(String str) =>
    List<CustomerInterview>.from(
        json.decode(str).map((x) => CustomerInterview.fromJson(x)));
String customerInterviewToJson(CustomerInterview data) =>
    json.encode(data.toJson());

class CustomerInterview {
  CustomerInterview({
    this.id,
    this.customerName,
    this.customerTitle,
    this.interviewDate,
    this.meetingHour,
    this.customerRepresentative,
    this.interviewNextDate,
    this.discussionSubject,
    this.interviewContent,
    this.isOffered,
    this.interviewStatus,
    this.explanation,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? customerName;
  String? customerTitle;
  DateTime? interviewDate;
  String? meetingHour;
  String? customerRepresentative;
  DateTime? interviewNextDate;
  String? discussionSubject;
  String? interviewContent;
  int? isOffered;
  String? interviewStatus;
  String? explanation;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory CustomerInterview.fromJson(Map<String, dynamic> json) =>
      CustomerInterview(
        id: json["id"],
        customerName: json["customer_name"],
        customerTitle: json["customer_title"],
        interviewDate: DateTime.parse(json["interview_date"]),
        meetingHour: json["meeting_hour"],
        customerRepresentative: json["customer_representative"],
        interviewNextDate: DateTime.parse(json["interview_next_date"]),
        discussionSubject: json["discussion_subject"],
        interviewContent: json["interview_content"],
        isOffered: json["is_offered"],
        interviewStatus: json["interview_status"],
        explanation: json["explanation"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_name": customerName,
        "customer_title": customerTitle,
        "interview_date":
            "${interviewDate!.year.toString().padLeft(4, '0')}-${interviewDate!.month.toString().padLeft(2, '0')}-${interviewDate!.day.toString().padLeft(2, '0')}",
        "meeting_hour": meetingHour,
        "customer_representative": customerRepresentative,
        "interview_next_date":
            "${interviewNextDate!.year.toString().padLeft(4, '0')}-${interviewNextDate!.month.toString().padLeft(2, '0')}-${interviewNextDate!.day.toString().padLeft(2, '0')}",
        "discussion_subject": discussionSubject,
        "interview_content": interviewContent,
        "is_offered": isOffered,
        "interview_status": interviewStatus,
        "explanation": explanation,
        "user_id": userId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
