import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_probe_mobile_app/constant/app/app_constant.dart';
import 'package:media_probe_mobile_app/model/news_model.dart';
import 'package:media_probe_mobile_app/service/api/api_service.dart';

final newsController = ChangeNotifierProvider((ref) => NewsController());
class NewsController extends ChangeNotifier {
  NewsModel? _newsModel;
  NewsModel? get newsModel => _newsModel;
  set setNewsModel(NewsModel? newsModel) {
    _newsModel = newsModel;
    notifyListeners();
  }

  bool isLoading = false;
  bool isError = false;
  void getNewsList() {
    isLoading = true;
    ApiService()
        .request(
      statusListener: (loading, error) {
        isLoading = loading;
        isError = error;
        notifyListeners();
      },
      url: '${AppConstant.BASE_URL}api-key=${dotenv.env['API_KEY']}',
      fromJson: NewsModel.fromJson,
    )
        .then((value) {
      if (value != null) {
        _newsModel = value  as NewsModel;
        _newsModel?.results
            ?.sort((a, b) => b!.publishedDate!.compareTo(a!.publishedDate!));
            isLoading = false;
        notifyListeners();
      } else {
        isError = true;
        notifyListeners();
      }
    });
    notifyListeners();
  }
}
