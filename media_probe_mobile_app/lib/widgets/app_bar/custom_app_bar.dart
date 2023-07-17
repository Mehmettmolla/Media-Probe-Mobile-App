import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_probe_mobile_app/constant/app/app_color.dart';
import 'package:media_probe_mobile_app/constant/app/app_text_style.dart';

class CustomAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.title,
      this.preferredSize = const Size.fromHeight(55),
      this.isBack = false,});
  @override
  final Size preferredSize;

  final String? title;
  final bool? isBack;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends ConsumerState<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primaryGreen,
      leading: 
      widget.isBack == false ?
      IconButton(
        icon: const Icon(Icons.menu,color: AppColor.white,),
        onPressed: () {},
      ):
      IconButton(
        icon: const Icon(Icons.arrow_back,color: AppColor.white,),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title:  Text(
        widget.title!,
        style: AppTextStyle.regular17White,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search,color: AppColor.white,),
          onPressed: () {
          },
        ),
        PopupMenuButton(
          icon: const Icon(Icons.more_vert,color: AppColor.white,),
          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
            // 3 nokta menüsü öğelerini buraya ekleyebilirsiniz
            const PopupMenuItem(
              value: 1,
              child: Text('1'),
            ),
            const PopupMenuItem(
              value: 2,
              child: Text('2'),
            ),
            const PopupMenuItem(
              value: 3,
              child: Text('3'),
            ),
          ],
          onSelected: (value) {
          },
        ),
      ],
    );
  }
}
