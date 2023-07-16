import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_probe_mobile_app/constant/app/app_color.dart';
import 'package:media_probe_mobile_app/constant/app/app_constant.dart';
import 'package:media_probe_mobile_app/constant/text/text_constant.dart';
import 'package:media_probe_mobile_app/controller/news_controller.dart';
import 'package:media_probe_mobile_app/extension/navigation/navigation_extension.dart';
import 'package:media_probe_mobile_app/extension/widget/widget_extension.dart';
import 'package:media_probe_mobile_app/view/news_detail/news_detail_view.dart';
import 'package:media_probe_mobile_app/widgets/app_bar/custom_app_bar.dart';
import 'package:media_probe_mobile_app/widgets/card/custom_news_card.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(newsController).getNewsList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final watch = ref.watch(newsController);
    return Scaffold(
      appBar: const CustomAppBar(
        title: TextConstant.appBarTitle,
      ),
      body: watch.isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: AppColor.primaryGreen,
            ))
          : ListView.builder(
              shrinkWrap: true,
              itemCount: watch.newsModel?.results?.length ?? 0,
              itemBuilder: (context, index) {
                final item = watch.newsModel?.results?[index];
                return CustomNewsCard(
                        title: item?.title,
                        subtitle: item?.theAbstract,
                        publisher: item?.section,
                        date: item?.publishedDate,
                        image: item!.media!.isEmpty
                            ? AppConstant.NO_DATA_IMAGE
                            : item.media!.first!.mediaMetadata!.first!.url)
                    .gestureDetector(
                  onTap: () => context.navigateToPage(
                    NewsDetailView(
                      title: item.title,
                      subtitle: item.theAbstract,
                      publisher: item.section,
                      date: item.publishedDate,
                      image: item.media!.isEmpty
                          ? AppConstant.NO_DATA_IMAGE
                          : item.media!.first!.mediaMetadata!.first!.url,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
