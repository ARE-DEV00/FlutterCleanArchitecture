import 'package:architecture/domain/entity/sample_entity.dart';

abstract class ApiRepository {

  Future<SampleEntity?> createSample(String description);


}