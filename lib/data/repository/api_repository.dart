import 'package:dio/dio.dart';
import 'package:flutter_study/data/client/client.dart';
import 'package:flutter_study/data/response/http_test_response.dart';
import 'package:flutter_study/data/response/result/result.dart';

abstract class ApiRepository {
  Future<Result<HttpTestResponse>> getTest(String id);
  Future<Result<HttpTestResponse>> postTest(String id);
  Future<Result<HttpTestResponse>> errorTest();
}

class ApiRepositoryImpl implements ApiRepository {
  final Client _client;

  ApiRepositoryImpl([Client? client]) : _client = client ?? Client(Dio());

  @override
  Future<Result<HttpTestResponse>> getTest(String id) {
    return _client
        .getTest(id)
        .then((response) => Result<HttpTestResponse>.success(response))
        .catchError((error) => Result<HttpTestResponse>.failure(error));
  }

  @override
  Future<Result<HttpTestResponse>> postTest(String id) {
    return _client
        .postTest(id)
        .then((response) => Result<HttpTestResponse>.success(response))
        .catchError((error) => Result<HttpTestResponse>.failure(error));
  }

  @override
  Future<Result<HttpTestResponse>> errorTest() {
    return _client
        .errorTest()
        .then((response) => Result<HttpTestResponse>.success(response))
        .catchError((error) => Result<HttpTestResponse>.failure(error));
  }
}
