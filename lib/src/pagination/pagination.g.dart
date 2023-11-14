// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedResponse<T> _$PaginatedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginatedResponse<T>(
      page: json['page'] as int? ?? 1,
      total: json['total'] as int,
      limit: json['limit'] as int,
      skip: json['skip'] as int,
      data: (json['products'] as List<dynamic>?)?.map(fromJsonT).toList() ?? [],
      meta: json['meta'] == null
          ? null
          : MetaData.fromJson(json['meta'] as Map<String, dynamic>),
    );

PaginationRequest _$PaginationRequestFromJson(Map<String, dynamic> json) =>
    PaginationRequest(
      page: json['page'] as int,
      limit: json['limit'] as int,
    );

Map<String, dynamic> _$PaginationRequestToJson(PaginationRequest instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
    };

MetaData _$MetaDataFromJson(Map<String, dynamic> json) => MetaData(
      page: json['page'] as int,
      perPage: json['perPage'] as int,
      totalPage: json['totalPage'] as int,
    );

Map<String, dynamic> _$MetaDataToJson(MetaData instance) => <String, dynamic>{
      'page': instance.page,
      'perPage': instance.perPage,
      'totalPage': instance.totalPage,
    };
