# flutter_networking

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Json serialization using json_serializable and json_annotation
- 1st import 'package:json_annotation/json_annotation.dart';
- part 'post.g.dart'; 
- write on class declaration 
    - @JsonSerializable()
       class Post{}
- declare prototype
     - factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
     - Map<String, dynamic> toJson() => _$PostToJson(this);
- Run
  - flutter pub run build_runner build --delete-conflicting-outputs

## To generate file using build_runner
# for first time run
- flutter pub run build_runner build --delete-conflicting-outputs
# instead of ruuning build command always run watch command
- flutter pub run build_runner watch --delete-conflicting-outputs