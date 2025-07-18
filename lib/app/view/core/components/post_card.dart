import 'package:fliggle/app/view/core/design/fliggle_colors.dart';
import 'package:fliggle/app/view/core/design/fliggle_icons.dart';
import 'package:fliggle/app/view/core/design/fliggle_text_styles.dart';
import 'package:fliggle/app/view/core/util/time_format.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.authorName,
    required this.content,
    required this.dateTime,
    this.isLiked = false,
    this.isCommented = false,
    this.likesCount = 0,
    this.commentsCount = 0,
    this.onLikeTap,
    this.onCommentTap,
  });

  final String authorName;
  final String content;
  final DateTime dateTime;
  final bool isLiked;
  final bool isCommented;
  final int likesCount;
  final int commentsCount;
  final void Function(bool beforeIsLiked)? onLikeTap;
  final void Function()? onCommentTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: FliggleColors.of(context).background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: FliggleColors.of(context).border, width: 1),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: FliggleColors.of(context).primary,
                radius: 16,
                child: Text(
                  authorName[0].toUpperCase(),
                  style: FliggleTextStyles.buttonText(
                    context,
                  ).copyWith(fontSize: 18),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            authorName,
                            style: TextStyle(
                              color: FliggleColors.of(context).text,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          timeFormat(dateTime),
                          style: TextStyle(
                            color: FliggleColors.of(context).outline,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      content,
                      style: TextStyle(
                        color: FliggleColors.of(context).text,
                        fontSize: 16,
                        height: 1.6,
                      ),
                      softWrap: true,
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (onLikeTap != null) {
                              onLikeTap!(isLiked);
                            }
                          },
                          child:
                              isLiked
                                  ? FliggleIcons.heartFull(
                                    color: FliggleColors.of(context).danger,
                                    size: 24,
                                  )
                                  : FliggleIcons.heart(size: 24),
                        ),
                        SizedBox(width: 4),
                        Text(
                          likesCount.toString(),
                          style: TextStyle(
                            color: FliggleColors.of(context).text,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 16),
                        GestureDetector(
                          onTap: onCommentTap,
                          child:
                              isCommented
                                  ? FliggleIcons.commentFull(
                                    color: FliggleColors.of(context).warning,
                                    size: 24,
                                  )
                                  : FliggleIcons.comment(size: 24),
                        ),
                        SizedBox(width: 4),
                        Text(
                          commentsCount.toString(),
                          style: TextStyle(
                            color: FliggleColors.of(context).text,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
