import 'package:flutter/material.dart';
import 'package:fliggle/app/view/core/components/custom_text_field.dart';

class RegisterStep4 extends StatelessWidget {
  const RegisterStep4({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.white,
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
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Pretendard',
                  color: colorScheme.onSurface,
                ),
              ),

              const SizedBox(height: 28),

              // ID
              const CustomTextField(label: '아이디', hint: 'pretty_gist'),
              const SizedBox(height: 16),

              // Nickname
              const CustomTextField(label: '닉네임', hint: 'GIST'),
              const SizedBox(height: 16),

              // Phone number
              const CustomTextField(label: '휴대폰 번호', hint: '01011112222'),

              const Spacer(),

              // "다음으로" 버튼
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    '다음으로',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Pretendard',
                    ),
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
