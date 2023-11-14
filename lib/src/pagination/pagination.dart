import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

@JsonSerializable(
  explicitToJson: true,
  genericArgumentFactories: true,
  createToJson: false,
)
class PaginatedResponse<T> extends Equatable {
  static const int defaultItemPerPage = 10;

  const PaginatedResponse({
    required this.page,
    required this.total,
    required this.limit,
    required this.skip,
    required this.data,
    this.meta,
  });

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PaginatedResponseFromJson(json, fromJsonT);

  @JsonKey(defaultValue: 1)
  final int page;

  // "total": 100,
  final int total;

  // "skip": 10,
  final int skip;

  // "limit": 10
  final int limit;

  /// Current page data
  ///
  /// * must be object [List]
  @JsonKey(name: 'products', defaultValue: [])
  final List<T> data;

  final MetaData? meta;

  bool get isCompleted => page >= total;
  bool get isCompletedByMeta =>
      meta != null ? meta!.page >= meta!.totalPage : false;

  PaginationRequest nextPage() =>
      PaginationRequest(page: page + 1, limit: limit);

  @override
  List<Object?> get props => [
        page,
        total,
        limit,
        skip,
        data,
      ];

  @override
  bool? get stringify => true;
}

@JsonSerializable()
class PaginationRequest extends Equatable {
  const PaginationRequest({required this.page, required this.limit});

  factory PaginationRequest.fromJson(Map<String, dynamic> json) =>
      _$PaginationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationRequestToJson(this);

  final int page;
  final int limit;

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

@JsonSerializable()
class MetaData {
  const MetaData({
    required this.page,
    required this.perPage,
    required this.totalPage,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDataToJson(this);

  final int page;
  final int perPage;
  final int totalPage;
}
