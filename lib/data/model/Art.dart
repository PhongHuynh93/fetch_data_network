import 'package:json_annotation/json_annotation.dart';
part 'Art.g.dart';

@JsonSerializable(nullable: true)
class Art {
    @JsonKey(name: "preview")
    Thumb preview;

    Art({this.preview});
    factory Art.fromJson(Map<String, dynamic> json) => _$ArtFromJson(json);
}

@JsonSerializable(nullable: true)
class Thumb{
    @JsonKey(name: "src")
    String src;

    Thumb({this.src});
    factory Thumb.fromJson(Map<String, dynamic> json) => _$ThumbFromJson(json);
}
