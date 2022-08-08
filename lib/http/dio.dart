import 'dart:developer';

import 'package:dio/dio.dart';

import 'interceptors/api_interceptor.dart';

final options = BaseOptions(
  connectTimeout: 240000,
  receiveTimeout: 240000,
);

final dio = Dio(options)
  ..interceptors.addAll(
    <Interceptor>[
      ApiInterceptor(),
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (res) {
          log(res.toString(), name: 'BE');
        },
      ),
    ],
  );

CancelToken cancelToken = CancelToken();
