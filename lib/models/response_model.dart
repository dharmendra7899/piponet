import 'dart:convert';

CommonModalClass commonModalClassFromJson(String str) =>
    CommonModalClass.fromJson(json.decode(str));

String commonModalClassToJson(CommonModalClass data) =>
    json.encode(data.toJson());

class CommonModalClass {
  int statusCode;
  bool status;
  String message;
  dynamic data;

  CommonModalClass({
    required this.statusCode,
    required this.status,
    required this.message,
    this.data,
  });

  factory CommonModalClass.fromJson(Map<String, dynamic> json) =>
      CommonModalClass(
        statusCode: json["statusCode"],
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "status": status,
        "message": message,
        "data": data,
      };
}
