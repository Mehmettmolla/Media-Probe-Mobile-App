import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_probe_mobile_app/widgets/app_bar/custom_app_bar.dart';

class NewsDetailView extends ConsumerStatefulWidget {
  const NewsDetailView({super.key, this.title, this.subtitle, this.publisher, this.date, this.image});
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
      appBar:  CustomAppBar(
        title: "$widget.title Detail",
        isBack: true,
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}