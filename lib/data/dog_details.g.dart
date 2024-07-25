// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogImageDetails _$DogImageDetailsFromJson(Map<String, dynamic> json) =>
    DogImageDetails(
      status: json['status'] as String,
      message: json['message'] as String,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$DogImageDetailsToJson(DogImageDetails instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
    };
