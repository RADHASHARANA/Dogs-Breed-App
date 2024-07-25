// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogDetails _$DogDetailsFromJson(Map<String, dynamic> json) => DogDetails(
      status: json['status'] as String,
      message: json['message'] as String,
      code: json['code'] as int,
    );

Map<String, dynamic> _$DogDetailsToJson(DogDetails instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
    };
