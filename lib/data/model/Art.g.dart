// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Art.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Art _$ArtFromJson(Map<String, dynamic> json) {
  return Art(
    preview: json['preview'] == null
        ? null
        : Thumb.fromJson(json['preview'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ArtToJson(Art instance) => <String, dynamic>{
      'preview': instance.preview,
    };

Thumb _$ThumbFromJson(Map<String, dynamic> json) {
  return Thumb(
    src: json['src'] as String,
  );
}

Map<String, dynamic> _$ThumbToJson(Thumb instance) => <String, dynamic>{
      'src': instance.src,
    };
