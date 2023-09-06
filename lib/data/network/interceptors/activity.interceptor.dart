import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:starter/data/network/dio.client.dart';

///
@singleton
class ActivityInterceptor extends InterceptorsWrapper {

  ///
  final DioClient dioClient;

  ///
  ActivityInterceptor(this.dioClient) {
    _registerInterceptor();
  }

  Future<void> _onRequestInterceptor(RequestOptions options,
      RequestInterceptorHandler requestInterceptorHandler) async {
    requestInterceptorHandler.next(options);
    debugPrint('Test Interceptor');
    ///
    /// Intercept here
    ///
  }

  ///
  void _registerInterceptor() {
    dioClient.interceptors.add(QueuedInterceptorsWrapper(
        onRequest: _onRequestInterceptor,
        onResponse:
            (Response<dynamic> response, ResponseInterceptorHandler handler) {
          // Do something with response data
          return handler.next(response); // continue
        },
        onError: (DioError e, ErrorInterceptorHandler handler) {
          return handler.next(e); //continue
        }));
  }
}
