import 'package:json_annotation/json_annotation.dart';
part 'DeviantArtList.g.dart';

/// Created by Phong Huynh on 9/8/2020.
@JsonSerializable(nullable: true)
class DeviantArtList<T> {
    @JsonKey(name: "has_more")
    bool hasMore;
    @JsonKey(name: "next_offset")
    int nextOffset;
    @JsonKey(name: "results", fromJson: _dataFromJson, toJson: _dataToJson)
    List<T> data;

    DeviantArtList({this.hasMore, this.nextOffset, this.data});

    factory DeviantArtList.fromJson(Map<String, dynamic> json) => _$DeviantArtListFromJson(json);
}

T _dataFromJson<T>(Map<String, dynamic> input) =>
    input['value'] as T;

Map<String, dynamic> _dataToJson<T>(T input) =>
    {'value': input};
