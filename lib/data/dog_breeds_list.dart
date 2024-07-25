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
  @JsonKey(name: "code")
  int? code;

  DogBreedsList({
    required this.message,
    required this.status,
    this.code,
  });

  factory DogBreedsList.fromJson(Map<String, dynamic> json) =>
      _$DogBreedsListFromJson(json);

  Map<String, dynamic> toJson() => _$DogBreedsListToJson(this);

  List<String> get breedList => message.keys.toList()..sort();
  Map<String, List<String>> get groupedBreeds {
    final groupedBreeds = <String, List<String>>{};
    for (final breed in breedList) {
      final firstLetter = breed[0].toUpperCase();
      groupedBreeds.putIfAbsent(firstLetter, () => []).add(breed);
    }
    return groupedBreeds;
  }
}
