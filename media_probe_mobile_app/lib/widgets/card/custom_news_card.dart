import 'package:flutter/material.dart';
import 'package:media_probe_mobile_app/constant/app/app_padding.dart';
import 'package:media_probe_mobile_app/constant/app/app_text_style.dart';
import 'package:media_probe_mobile_app/extension/navigation/navigation_extension.dart';
import 'package:media_probe_mobile_app/extension/num/num_extension.dart';
import 'package:media_probe_mobile_app/view/news_detail/news_detail_view.dart';

class CustomNewsCard extends StatelessWidget {
  const CustomNewsCard(
      {super.key,
      this.title,
      this.publisher,
      this.date,
      this.subtitle,
      this.image});
  final String? title;
  final String? publisher;
  final String? date;
  final String? subtitle;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.horizontalPadding,
        vertical: AppPadding.verticalPadding,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: image!,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          AppPadding.smallPadding.width,
          Expanded(
            child: Column(
              children: [
                Text(
                  title!,
                  style: AppTextStyle.semiBold16Black,
                ),
                AppPadding.smallPadding.height,
                Text(
                  subtitle!,
                  style: AppTextStyle.medium16Grey,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                AppPadding.smallPadding.height,
                Row(
                  children: [
                    Text(
                      publisher!,
                      style: AppTextStyle.medium16Grey,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                        ),
                        5.width,
                        Text(
                          date!,
                          style: AppTextStyle.medium16Grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          AppPadding.smallPadding.width,
          const Icon(Icons.arrow_forward_ios_sharp),
        ],
      ),
    );
  }
}
