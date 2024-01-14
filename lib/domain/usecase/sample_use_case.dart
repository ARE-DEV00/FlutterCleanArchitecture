import 'package:get_it/get_it.dart';
import 'package:architecture/data/remote/api/repository/api_repository_impl.dart';
import 'package:architecture/domain/entity/sample_entity.dart';

import 'package:architecture/domain/repository/api_repository.dart';

class SampleUseCase {
  final ApiRepository _apiRepository = GetIt.instance<ApiRepositoryImpl>();

  Future<SampleEntity?> createSample(String description) async {
    return await _apiRepository.createSample(description);
  }
}
