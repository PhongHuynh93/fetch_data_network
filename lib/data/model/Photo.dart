import 'package:json_annotation/json_annotation.dart';
part 'Photo.g.dart';

@JsonSerializable(nullable: true)
class Photo {
  final int id;
  final String title;
  final String thumbnailUrl;

  Photo({this.id, this.title, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}