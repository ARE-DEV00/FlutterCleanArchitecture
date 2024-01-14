import 'package:dio/dio.dart';
import 'package:architecture/data/model/sample_request.dart';
import 'package:architecture/data/model/sample_response.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: "https://")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;


  @POST("sample")
  Future<SampleResponse> createSample(@Body() SampleRequest sampleRequest);

}