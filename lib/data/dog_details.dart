import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'dog_details.g.dart';

DogImageDetails dogDetailsFromJson(String str) =>
    DogImageDetails.fromJson(json.decode(str));

String dogDetailsToJson(DogImageDetails data) => json.encode(data.toJson());

@JsonSerializable()
class DogImageDetails {
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "code")
  int code;

  DogImageDetails({
    required this.status,
    required this.message,
    required this.code,
  });

  factory DogImageDetails.fromJson(Map<String, dynamic> json) =>
      _$DogImageDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DogImageDetailsToJson(this);
}
