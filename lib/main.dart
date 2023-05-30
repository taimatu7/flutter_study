import 'package:flutter/material.dart';
import 'package:flutter_study/data/repository/api_repository.dart';

void main() async {
  print("main start");
  ApiTestApp();
}

class ApiTestApp {
  ApiTestApp() {
    // api実行処理
    getTest();
    postTest();
    errorTest();
  }

  Future<void> getTest() async {
    // お試しなので実装クラスを直接呼び出す
    final repository = ApiRepositoryImpl();
    await repository.getTest("1").then((result) {
      result.when(success: (value) {
        print("success get: $value");
      }, failure: (error) {
        print("failure get: ${error.message}");
      });
    });
  }

  Future<void> postTest() async {
    // お試しなので実装クラスを直接呼び出す
    final repository = ApiRepositoryImpl();
    await repository.postTest("1").then((result) {
      result.when(success: (value) {
        print("success post: $value");
      }, failure: (error) {
        print("failure post: ${error.message}");
      });
    });
  }

  Future<void> errorTest() async {
    // お試しなので実装クラスを直接呼び出す
    final repository = ApiRepositoryImpl();
    await repository.errorTest().then((result) {
      result.when(success: (value) {
        print("success err: $value");
      }, failure: (error) {
        print("failure err: ${error.response?.statusCode}");
      });
    });
  }
}
