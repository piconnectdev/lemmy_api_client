// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'captcha.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Captcha _$_$_CaptchaFromJson(Map<String, dynamic> json) {
  return _$_Captcha(
    png: json['png'] as String,
    wav: json['wav'] as String,
    uuid: json['uuid'] as String,
  )..instanceHost = json['instance_host'] as String;
}

Map<String, dynamic> _$_$_CaptchaToJson(_$_Captcha instance) =>
    <String, dynamic>{
      'instance_host': instance.instanceHost,
      'png': instance.png,
      'wav': instance.wav,
      'uuid': instance.uuid,
    };
