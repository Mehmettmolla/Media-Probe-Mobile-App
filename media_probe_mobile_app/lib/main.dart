import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_probe_mobile_app/view/home/home_view.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Media Probe App',
      debugShowCheckedModeBanner: false,
      // color: AppColor.blue,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home:  const HomeView(),
    );
  }
}