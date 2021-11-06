// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issues_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$IssuesService extends IssuesService {
  _$IssuesService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = IssuesService;

  @override
  Future<Response<List<IssuesResult>>> getAllIssues(
      String state, int perPage, int page) {
    final $url = 'repos/flutter/flutter/issues';
    final $params = <String, dynamic>{
      'state': state,
      'per_page': perPage,
      'page': page
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<List<IssuesResult>, IssuesResult>($request);
  }
}
