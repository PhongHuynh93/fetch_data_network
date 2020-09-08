// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DeviantArtList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviantArtList<T> _$DeviantArtListFromJson<T>(Map<String, dynamic> json) {
  return DeviantArtList<T>(
    hasMore: json['has_more'] as bool,
    nextOffset: json['next_offset'] as int,
    data: _dataFromJson(json['results'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeviantArtListToJson<T>(DeviantArtList<T> instance) =>
    <String, dynamic>{
      'has_more': instance.hasMore,
      'next_offset': instance.nextOffset,
      'results': _dataToJson(instance.data),
    };
