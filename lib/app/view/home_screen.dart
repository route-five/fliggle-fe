import 'dart:math';

import 'package:fliggle/app/view/core/components/post_card.dart';
import 'package:fliggle/app/view/core/design/fliggle_icons.dart';
import 'package:fliggle/app/view/core/design/fliggle_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:fliggle/app/view/core/design/fliggle_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const postLength = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FliggleColors.of(context).background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            titleSpacing: 20,
            title: Row(
              children: [
                FliggleIcons.get(
                  'assets/images/logo.svg',
                  width: 30,
                  height: 32,
                  color: FliggleColors.of(context).text,
                ),
                SizedBox(width: 12),
                Text('Fliggle', style: FliggleTextStyles.stepTitle(context)),
              ],
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    // TODO: write a post
                  },
                  child: FliggleIcons.plus(
                    color: FliggleColors.of(context).text,
                  ),
                ),
              ),
            ],
            backgroundColor: FliggleColors.of(context).background,
            surfaceTintColor: FliggleColors.of(context).background,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: index == 0 ? 20 : 10,
                  bottom: index == postLength - 1 ? 20 : 10,
                ),
                child: PostCard(
                  authorName:
                      [
                        "Google",
                        "Microsoft",
                        "Netflix",
                        "Facebook",
                        "Instagram",
                      ][Random(index).nextInt(5)],
                  content:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu risus dolor. Suspendisse potenti. Duis sed ante vel augue accumsan hendrerit a ac odio. Quisque eu ante ut urna vulputate dapibus eget eu erat. Donec eu rutrum tellus, sit amet pulvinar libero. Sed et mi vestibulum, convallis nibh nec, convallis ipsum.",
                  isLiked: Random(index).nextBool(),
                  likesCount: Random(index).nextInt(50),
                  commentsCount: Random(index).nextInt(20),
                ),
              );
            }, childCount: postLength),
          ),
        ],
      ),
    );
  }
}
