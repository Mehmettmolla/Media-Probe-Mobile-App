import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_probe_mobile_app/constant/app/app_constant.dart';
import 'package:media_probe_mobile_app/model/news_model.dart';
import 'package:media_probe_mobile_app/service/api/api_service.dart';

final newsController = ChangeNotifierProvider((ref) => NewsController());

class NewsController extends ChangeNotifier {
  NewsModel? _newsModel;
  NewsModel? get newsModel => _newsModel;

  bool isLoading = false;
  bool isError = false;
  void getNewsList() {
    ApiService()
        .request(
      statusListener: (loading, error) {
        isLoading = loading;
        isError = error;
        notifyListeners();
      },
      url: "${AppConstant.BASE_URL}api-key=${AppConstant.API_KEY}",
      fromJson: (json) => NewsModel.fromJson(json),
    )
        .then((value) {
      if (value != null) {
        _newsModel = value;
        _newsModel?.results
            ?.sort((a, b) => b!.publishedDate!.compareTo(a!.publishedDate!));
        notifyListeners();
      } else {
        print(
          value?.message ?? "Bir hata oluştu",
        );
        isError = true;
        notifyListeners();
      }
    });
    notifyListeners();
  }
}
