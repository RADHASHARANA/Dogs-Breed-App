import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'dog_breeds_list.g.dart';

DogBreedsList dogsBreedListFromJson(String str) =>
    DogBreedsList.fromJson(json.decode(str));

String dogsBreedListToJson(DogBreedsList data) => json.encode(data.toJson());

@JsonSerializable()
class DogBreedsList {
  @JsonKey(name: "message")
  Map<String, List<String>> message;
  @JsonKey(name: "status")
  String status;

  DogBreedsList({
    required this.message,
    required this.status,
  });

  factory DogBreedsList.fromJson(Map<String, dynamic> json) =>
      _$DogsBreedListFromJson(json);

  Map<String, dynamic> toJson() => _$DogsBreedListToJson(this);
  List<String> get breedList => message.keys.toList()..sort();
}
