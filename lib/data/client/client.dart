import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_study/data/response/http_test_response.dart';
import 'package:retrofit/http.dart';

part 'client.g.dart';

@RestApi(baseUrl: "https://httpbin.org")
abstract class Client {
  factory Client(Dio dio, {String baseUrl}) = _Client;

  static const _headers = <String, dynamic>{
    "Content-Type": "application/json",
    "Custom-Header": "Your header"
  };

  @GET("/get")
  @Headers(_headers)
  Future<HttpTestResponse> getTest(@Query("id") String id);

  @POST("/post")
  @Headers(_headers)
  Future<HttpTestResponse> postTest(@Field("id") String id);

  @GET("/status/404")
  @Headers(_headers)
  Future<HttpTestResponse> errorTest();
}
