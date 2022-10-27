import 'package:dio/dio.dart';

import 'network_consts.dart';

class DioClient {
  static final DioClient _dioClient = DioClient._internal();
  factory DioClient() {
    return _dioClient;
  }
  DioClient._internal();

  Dio? _dio;

  Dio get dio {
    if (_dio == null) {
      _dio = Dio();

      dio.options
        ..connectTimeout = NetworkConsts.apiTimeout
        ..receiveTimeout = NetworkConsts.apiTimeout;
    }

    return _dio!;
  }
}
