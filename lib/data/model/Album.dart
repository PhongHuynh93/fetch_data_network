import 'package:json_annotation/json_annotation.dart';
part 'Album.g.dart';

@JsonSerializable(nullable: true)
class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}