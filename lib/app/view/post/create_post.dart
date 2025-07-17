import 'package:flutter/material.dart';
import 'package:fliggle/app/view/core/design/fliggle_colors.dart';
import 'package:fliggle/app/view/core/design/fliggle_text_styles.dart';

class StoryUploadScreen extends StatelessWidget {
  const StoryUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FliggleColors.of(context).background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),

              // 제목
              Text(
                '게시글 작성',
                style: FliggleTextStyles.titleLarge(context),
              ),

              const SizedBox(height: 28),

              // 입력창
              Container(
                width: double.infinity,
                height: 258,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: FliggleColors.of(context).background,
                  border: Border.all(
                    color: FliggleColors.gray20,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    hintText: '어떤 이야기를 나누고 싶나요?',
                    hintStyle: TextStyle(
                      color: FliggleColors.gray80,
                      fontSize: 16,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w500,
                    ),
                    border: InputBorder.none,
                    isCollapsed: true,
                  ),
                  style: TextStyle(
                    color: FliggleColors.text,
                    fontSize: 16,
                    fontFamily: 'Pretendard Variable',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // 업로드 버튼
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: 업로드 기능 연결
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: FliggleColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      '업로드',
                      style: FliggleTextStyles.labelLargeWhite,
                    ),
                  ),
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
