import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:architecture/data/model/sample_request.dart';
import 'package:architecture/data/remote/api/api_service.dart';
import 'package:architecture/domain/entity/sample_entity.dart';
import 'package:architecture/domain/repository/api_repository.dart';

class ApiRepositoryImpl implements ApiRepository {
  final ApiService _apiService = GetIt.instance<ApiService>();

  @override
  Future<SampleEntity?> createSample(String description) async {
    try {
      // API 호출 및 응답 대기
      final response = await _apiService.createSample(
        SampleRequest(description: "$description"),
      );

      // 성공적인 응답인 경우
      if (response != null) {
        log("[KSH]response - OK");
        return SampleEntity(response.id, response.description);
      } else {
        // API 호출은 성공했지만 응답이 예상대로 오지 않은 경우
        log("[KSH]response - Fail");
        return null;
      }
    } catch (e) {
      // API 호출 중 에러가 발생한 경우
      log("[KSH]response - ERROR");
      return null;
    }
  }
}
