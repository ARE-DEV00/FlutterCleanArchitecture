
import 'package:json_annotation/json_annotation.dart';

part 'sample_request.g.dart';

@JsonSerializable()
class SampleRequest {
  late String description;

  SampleRequest({required this.description});

  factory SampleRequest.fromJson(Map<String, dynamic> json) => _$SampleRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SampleRequestToJson(this);
}