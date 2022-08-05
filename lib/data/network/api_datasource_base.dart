import 'package:dio/dio.dart';

import 'common/../dio_client.dart';
import 'network_consts.dart';

abstract class ApiDataSourceBase {
  final DioClient _dioClient = DioClient();

  Dio get dio {
    return _dioClient.dio;
  }

  EndPoints get endPoints => NetworkConsts.endPoints;
}
