import 'package:flutter/material.dart';
import 'package:fliggle/app/view/core/components/custom_text_field.dart';

class RegisterStep4 extends StatelessWidget {
  const RegisterStep4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '기본 정보를 입력해주세요',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        const CustomTextField(labelText: '아이디', hintText: 'pretty_gist'),
        const SizedBox(height: 16),
        const CustomTextField(labelText: '닉네임', hintText: 'GIST'),
        const SizedBox(height: 16),
        const CustomTextField(labelText: '휴대폰 번호', hintText: '01011112222'),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0XFF6C98FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text(
              '다음으로',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
