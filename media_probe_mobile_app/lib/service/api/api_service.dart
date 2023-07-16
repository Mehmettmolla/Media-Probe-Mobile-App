import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:media_probe_mobile_app/model/base_model.dart';

import '../base/base_service.dart';

typedef FromJson<T> = T Function(Map<String, dynamic> json);

class ApiService extends BaseService {
  static final Dio _dio = Dio();
  static Dio get dio => _dio;
  @override
  Future request(
      {String? url,
      ApiType type = ApiType.GET,
      FromJson? fromJson,
      void Function(bool loading, bool error)? statusListener,
      dynamic data}) async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      statusListener?.call(true, false);
    });
    try {
      late final Response response;
      switch (type) {
        case ApiType.GET:
          response = await dio.get(url!);
          break;
        case ApiType.POST:
          response = await dio.post(url!, data: data);
          break;
        case ApiType.PUT:
          response = await dio.put(url!, data: data);
          break;
        case ApiType.DELETE:
          response = await dio.delete(url!);
          break;
      }
      if (response.statusCode == 200) {
        if (fromJson != null) {
          statusListener?.call(false, false);
          return fromJson(response.data as Map<String, dynamic>);
        } else {
          statusListener?.call(false, false);
          return BaseModel.fromJson(response.data as Map<String, dynamic>);
        }
      } else {
        statusListener?.call(false, true);
        throw "Hata kodu: ${response.statusCode}\nHata mesajı: ${response.statusMessage}";
      }
    } on DioError catch (e) {
      var response = e.response;
      if (response != null) {
        String errorMessage =
            'Hata kodu: ${response.statusCode}\nHata mesajı: ${response.statusMessage}';
        statusListener?.call(false, true);
        throw errorMessage;
      } else {
        statusListener?.call(false, true);
        throw 'Bir hata oluştu. Lütfen tekrar deneyin.';
      }
    } catch (e) {
      statusListener?.call(false, true);
      rethrow;
    }
  }
}

enum ApiType {
  GET,
  POST,
  PUT,
  DELETE,
}
