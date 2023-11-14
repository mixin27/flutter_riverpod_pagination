// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cursor_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CursorPaginationResponse<T> _$CursorPaginationResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    CursorPaginationResponse<T>(
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
      hasMore: json['hasMore'] as bool?,
    );

CursorPaginationRequest _$CursorPaginationRequestFromJson(
        Map<String, dynamic> json) =>
    CursorPaginationRequest(
      cursor: json['cursor'] as String?,
    );

Map<String, dynamic> _$CursorPaginationRequestToJson(
        CursorPaginationRequest instance) =>
    <String, dynamic>{
      'cursor': instance.cursor,
    };
