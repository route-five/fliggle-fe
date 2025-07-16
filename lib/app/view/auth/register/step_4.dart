import 'package:flutter/material.dart';
import 'package:fliggle/app/view/core/components/custom_text_field.dart';
import 'package:fliggle/app/view/core/design/fliggle_text_styles.dart';
import 'package:fliggle/app/view/core/design/fliggle_colors.dart';

class RegisterStep4 extends StatelessWidget {
  const RegisterStep4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FliggleColors.of(context).background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 28),

              // Title
              Text(
                '기본 정보를 입력해주세요',
                style: FliggleTextStyles.stepTitle(context),
              ),

              const SizedBox(height: 28),

              // ID
              CustomTextField(label: '아이디', hint: 'pretty_gist'),
              const SizedBox(height: 16),

              // Nickname
              CustomTextField(label: '닉네임', hint: 'GIST'),
              const SizedBox(height: 16),

              // Phone number
              CustomTextField(label: '휴대폰 번호', hint: '01011112222'),

              const Spacer(),

              // "다음으로" 버튼
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: FliggleColors.of(context).primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    '다음으로',
                    style: FliggleTextStyles.buttonText(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
