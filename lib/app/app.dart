import 'package:flutter/material.dart';
// import 'package:fliggle/app/view/auth/register/step_4.dart';
import 'package:fliggle/app/view/core/design/fliggle_theme_data.dart';
import 'package:fliggle/app/view/core/design/fliggle_colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fliggle',
      theme: FliggleThemeData.lightTheme,
      darkTheme: FliggleThemeData.darkTheme,
      themeMode: ThemeMode.system,
      home: FliggleBumperPage(),
    );
  }
}

class FliggleBumperPage extends StatelessWidget {
  const FliggleBumperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FliggleColors.of(context).primary,
      body: const Center(
        child: Text(
          'Fliggle',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
