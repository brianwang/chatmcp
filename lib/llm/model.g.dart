// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
      name: json['name'] as String,
      label: json['label'] as String,
      providerId: json['providerId'] as String,
      icon: json['icon'] as String,
      providerName: json['providerName'] as String,
      apiStyle: json['apiStyle'] as String,
      priority: (json['priority'] as num?)?.toInt() ?? 0,
      displayName: json['displayName'] as String,
    );

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'name': instance.name,
      'label': instance.label,
      'providerId': instance.providerId,
      'apiStyle': instance.apiStyle,
      'icon': instance.icon,
      'providerName': instance.providerName,
      'priority': instance.priority,
    };
