import 'package:chopper/chopper.dart';
import 'package:tasks/data/model/issues_result.dart';
import 'package:tasks/data/rest/model_converter.dart';

part 'issues_service.chopper.dart';

@ChopperApi()
abstract class IssuesService extends ChopperService {
  @Get(path: 'repos/flutter/flutter/issues')
  Future<Response<List<IssuesResult>>> getAllIssues(
    @Query('state') String state,
    @Query('per_page') int perPage,
    @Query('page') int page,
  );

  static IssuesService create() {
    final client = ChopperClient(
      baseUrl: 'https://api.github.com',
      interceptors: [HttpLoggingInterceptor()],
      converter: ModelConverter(),
      errorConverter: const JsonConverter(),
      services: [
        _$IssuesService(),
      ],
    );
    return _$IssuesService(client);
  }
}
