import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'dog_sub_breeds_list.g.dart';

DogSubBreedsList dogSubBreedsListFromJson(String str) =>
    DogSubBreedsList.fromJson(json.decode(str));

String dogSubBreedsListToJson(DogSubBreedsList data) =>
    json.encode(data.toJson());

@JsonSerializable()
class DogSubBreedsList {
  @JsonKey(name: "message")
  List<String> message;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "code")
  int? code;
  DogSubBreedsList({
    required this.message,
    required this.status,
    this.code,
  });

  factory DogSubBreedsList.fromJson(Map<String, dynamic> json) =>
      _$DogSubBreedsListFromJson(json);

  Map<String, dynamic> toJson() => _$DogSubBreedsListToJson(this);
}
