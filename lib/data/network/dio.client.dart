import 'package:dio/dio.dart';
import 'package:dio/io.dart';

///
/// [DioClient]
/// Check modules.dart
///
class DioClient extends DioForNative {

  ///
  /// [DioClient]
  ///
  DioClient._(String baseUrl) : super(BaseOptions(baseUrl: baseUrl));

  ///
  factory DioClient(String baseUrl) {
    return DioClient._(baseUrl);
  }
}
