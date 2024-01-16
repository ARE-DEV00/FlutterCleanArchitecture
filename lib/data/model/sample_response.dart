
import 'package:json_annotation/json_annotation.dart';

part 'sample_response.g.dart';

@JsonSerializable()
class SampleResponse {
  int id;
  String? description;

  SampleResponse({required this.id, this.description});

  factory SampleResponse.fromJson(Map<String, dynamic> json) => _$SampleResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SampleResponseToJson(this);
}