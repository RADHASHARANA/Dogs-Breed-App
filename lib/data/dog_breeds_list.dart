import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'dog_breeds_list.g.dart';

DogsBreedList dogsBreedListFromJson(String str) =>
    DogsBreedList.fromJson(json.decode(str));

String dogsBreedListToJson(DogsBreedList data) => json.encode(data.toJson());

@JsonSerializable()
class DogsBreedList {
  @JsonKey(name: "message")
  Map<String, List<String>> message;
  @JsonKey(name: "status")
  String status;

  DogsBreedList({
    required this.message,
    required this.status,
  });

  factory DogsBreedList.fromJson(Map<String, dynamic> json) =>
      _$DogsBreedListFromJson(json);

  Map<String, dynamic> toJson() => _$DogsBreedListToJson(this);
}
