// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_test_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HttpTestResponse _$$_HttpTestResponseFromJson(Map<String, dynamic> json) =>
    _$_HttpTestResponse(
      args: Map<String, String>.from(json['args'] as Map),
      headers: Map<String, String>.from(json['headers'] as Map),
      form: (json['form'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      data: json['data'] as String?,
      files: (json['files'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      origin: json['origin'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$_HttpTestResponseToJson(_$_HttpTestResponse instance) =>
    <String, dynamic>{
      'args': instance.args,
      'headers': instance.headers,
      'form': instance.form,
      'data': instance.data,
      'files': instance.files,
      'origin': instance.origin,
      'url': instance.url,
    };
