// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonImpl _$$PersonImplFromJson(Map<String, dynamic> json) => _$PersonImpl(
      bno: (json['bno'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      writer: json['writer'] as String,
      regdate: json['regdate'] as String,
      viewcnt: json['viewcnt'] as String,
    );

Map<String, dynamic> _$$PersonImplToJson(_$PersonImpl instance) =>
    <String, dynamic>{
      'bno': instance.bno,
      'title': instance.title,
      'content': instance.content,
      'writer': instance.writer,
      'regdate': instance.regdate,
      'viewcnt': instance.viewcnt,
    };
