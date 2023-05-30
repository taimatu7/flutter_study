import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_test_response.freezed.dart';
part 'http_test_response.g.dart';

// APIテスト用のレスポンスクラス
@freezed
class HttpTestResponse with _$HttpTestResponse {
  factory HttpTestResponse({
    required Map<String, String> args, // パラメータ情報
    required Map<String, String> headers, // ヘッダー情報
    Map<String, String>? form, // フォーム情報
    String? data, // データ情報
    Map<String, String>? files, // ファイル情報
    required String origin, // アクセス元のIPアドレス
    required String url, // URL
  }) = _HttpTestResponse;

  factory HttpTestResponse.fromJson(Map<String, dynamic> json) =>
      _$HttpTestResponseFromJson(json);
}
