// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_breeds_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogBreedsList _$DogsBreedListFromJson(Map<String, dynamic> json) =>
    DogBreedsList(
      message: (json['message'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      status: json['status'] as String,
    );

Map<String, dynamic> _$DogsBreedListToJson(DogBreedsList instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
