import 'package:fliggle/app/view/core/design/fliggle_colors.dart';
import 'package:fliggle/app/view/core/design/fliggle_icons.dart';
import 'package:fliggle/app/view/core/design/fliggle_text_styles.dart';
import 'package:fliggle/app/view/core/util/time_format.dart';
import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
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
  final int likesCount;
  final int commentsCount;
  final void Function(bool beforeIsLiked)? onLikeTap;
  final void Function()? onCommentTap;
  final bool isLiked;
  final bool isCommented;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
    isCommented = widget.isCommented;
  }

  late bool isLiked;
  late bool isCommented;

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  void toggleComment() {
    setState(() {
      isCommented = !isCommented;
    });
  }

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
                  widget.authorName[0].toUpperCase(),
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
                            widget.authorName,
                            style: TextStyle(
                              color: FliggleColors.of(context).text,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          timeFormat(widget.dateTime),
                          style: TextStyle(
                            color: FliggleColors.of(context).outline,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.content,
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
                        InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: () {
                            if (widget.onLikeTap != null) {
                              widget.onLikeTap!(isLiked);
                            }
                            toggleLike();
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
                          widget.likesCount.toString(),
                          style: TextStyle(
                            color: FliggleColors.of(context).text,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 16),
                        InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: () {
                            if (widget.onCommentTap != null) {
                              widget.onCommentTap!();
                            }
                            toggleComment(); // FIXME: comment는 누르면 댓글창이 뜨는 버튼이라 toggle을 바로 하면 안됨. 나중에 수정 예정
                          },
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
                          widget.commentsCount.toString(),
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
