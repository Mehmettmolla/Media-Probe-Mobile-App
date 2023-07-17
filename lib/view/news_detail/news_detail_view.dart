import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_probe_mobile_app/constant/app/app_padding.dart';
import 'package:media_probe_mobile_app/constant/app/app_text_style.dart';
import 'package:media_probe_mobile_app/extension/num/num_extension.dart';
import 'package:media_probe_mobile_app/extension/widget/widget_extension.dart';
import 'package:media_probe_mobile_app/widgets/app_bar/custom_app_bar.dart';

class NewsDetailView extends ConsumerStatefulWidget {
  const NewsDetailView({
    super.key,
    this.title,
    this.subtitle,
    this.publisher,
    this.date,
    this.image,
  });
  final String? title;
  final String? subtitle;
  final String? publisher;
  final String? date;
  final String? image;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewsDetailViewState();
}

class _NewsDetailViewState extends ConsumerState<NewsDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '${widget.title} Detail',
        isBack: true,
      ),
      body: Column(
        children: [
          Hero(
            tag: widget.image!,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(widget.image!),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          AppPadding.largePadding.height,
          Text(
            widget.title!,
            style: AppTextStyle.semiBold16Black,
            textAlign: TextAlign.center,
          ),
          AppPadding.smallPadding.height,
          Text(
            widget.date!,
            style: AppTextStyle.semiBold16Black,
            textAlign: TextAlign.center,
          ),
          AppPadding.smallPadding.height,
          Text(
            widget.subtitle!,
            style: AppTextStyle.medium16Grey,
            textAlign: TextAlign.center,
          ),
          AppPadding.smallPadding.height,
          Text(
            widget.publisher!,
            style: AppTextStyle.medium16Grey,
            textAlign: TextAlign.center,
          ),
        ],
      ).paddingSymetric(
        horizontal: AppPadding.horizontalPadding,
        vertical: AppPadding.verticalPadding,
      ),
    );
  }
}
