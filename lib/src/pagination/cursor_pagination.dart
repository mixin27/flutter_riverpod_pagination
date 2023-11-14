import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cursor_pagination.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
  createToJson: false,
)
class CursorPaginationResponse<T> extends Equatable {
  const CursorPaginationResponse({
    required this.data,
    this.hasMore,
  });

  factory CursorPaginationResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$CursorPaginationResponseFromJson(json, fromJsonT);

  /// APIs response data
  final List<T> data;

  /// Some APIs, this field may be null
  final bool? hasMore;

  // if we get empty data that mean we completed
  bool get isCompleted => data.isEmpty;

  @override
  List<Object?> get props => [data];

  @override
  bool? get stringify => true;
}

@JsonSerializable()
class CursorPaginationRequest extends Equatable {
  const CursorPaginationRequest({this.cursor});

  factory CursorPaginationRequest.fromJson(Map<String, dynamic> json) =>
      _$CursorPaginationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CursorPaginationRequestToJson(this);

  final String? cursor;

  @override
  List<Object?> get props => [cursor];

  @override
  bool? get stringify => true;
}
