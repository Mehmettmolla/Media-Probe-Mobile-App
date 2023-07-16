import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:media_probe_mobile_app/model/base_model.dart';

import '../base/base_service.dart';

typedef FromJson<T> = T Function(Map<String, dynamic> json);

class ApiService extends BaseService {
  static final dio = Dio();
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
        if (response.data['success'] == true) {
          if (fromJson != null) {
            statusListener?.call(false, false);
            return fromJson(response.data);
          } else {
            statusListener?.call(false, false);
            return BaseModel.fromJson(response.data);
          }
        } else {
          statusListener?.call(false, true);
          throw "Hata: ${response.data['message']}";
        }
      } else {
        statusListener?.call(false, true);
        throw "Hata kodu: ${response.statusCode}\nHata mesajı: ${response.statusMessage}";
      }
    } on DioError catch (e) {
      var response = e.response;
      statusListener?.call(false, true);
      throw "Hata kodu: ${response?.statusCode}\nHata mesajı: ${response?.statusMessage}";
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
