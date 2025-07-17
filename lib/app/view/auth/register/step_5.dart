import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fliggle/app/view/core/design/fliggle_colors.dart';
import 'package:fliggle/app/view/core/design/fliggle_text_styles.dart';

class RegisterStep5 extends StatelessWidget {
  const RegisterStep5({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = FliggleColors.of(context);

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const SizedBox(height: 28),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '회원가입이 완료되었습니다!',
                  style: FliggleTextStyles.stepTitle(context),
                ),
              ),

              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/images/logo.svg',
                        width: 160,
                        height: 160,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Hello, GIST!',
                        style: FliggleTextStyles.titleLarge(context),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    '로그인하기',
                    style: FliggleTextStyles.buttonText(context),
                  ),
                ),
              ),

              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }
}
