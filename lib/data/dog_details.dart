import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'dog_details.g.dart';

DogDetails dogDetailsFromJson(String str) =>
    DogDetails.fromJson(json.decode(str));

String dogDetailsToJson(DogDetails data) => json.encode(data.toJson());

@JsonSerializable()
class DogDetails {
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "code")
  int code;

  DogDetails({
    required this.status,
    required this.message,
    required this.code,
  });

  factory DogDetails.fromJson(Map<String, dynamic> json) =>
      _$DogDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DogDetailsToJson(this);
}
