// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_sub_breeds_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogSubBreedsList _$DogSubBreedsListFromJson(Map<String, dynamic> json) =>
    DogSubBreedsList(
      message:
          (json['message'] as List<dynamic>).map((e) => e as String).toList(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$DogSubBreedsListToJson(DogSubBreedsList instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
