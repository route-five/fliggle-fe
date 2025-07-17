import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const Color lightPrimaryColor = Color(0xFF6C98FF);
const Color lightSecondaryColor = Color(0xFF87A9F7);

const Color darkPrimaryColor = Color(0xFF497BEE);
const Color darkSecondaryColor = Color(0xFF6C98FF);

const Color disabledColor = Color(0xFF808080);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Variants Demo',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          primary: lightPrimaryColor,
          secondary: lightSecondaryColor,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: darkPrimaryColor,
          secondary: darkSecondaryColor,
        ),
      ),
      home: const ButtonDemoPage(),
    );
  }
}

class ButtonDemoPage extends StatelessWidget {
  const ButtonDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Button Variants")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            CustomButton(variant: 'surface', disabled: false),
            SizedBox(height: 10),
            CustomButton(variant: 'surface', disabled: true),
            SizedBox(height: 10),
            CustomButton(variant: 'outline', disabled: false),
            SizedBox(height: 10),
            CustomButton(variant: 'outline', disabled: true),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String variant;
  final bool disabled;

  const CustomButton({
    super.key,
    required this.variant,
    required this.disabled,
  });

  @override
  Widget build(BuildContext context) {
    final bool isOutline = variant == 'outline';
    final colorScheme = Theme.of(context).colorScheme;
    final Color primary = colorScheme.primary;

    return SizedBox(
      width: 120,
      height: 34,
      child: ElevatedButton(
        onPressed: disabled ? null : () {},
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return isOutline ? Colors.white : disabledColor;
            }
            return isOutline ? Colors.white : primary;
          }),
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return isOutline ? disabledColor : Colors.white;
            }
            return isOutline ? primary : Colors.white;
          }),
          side: WidgetStateProperty.resolveWith<BorderSide>((states) {
            if (!isOutline) return BorderSide.none;
            return BorderSide(
              color: states.contains(WidgetState.disabled)
                  ? disabledColor
                  : primary,
            );
          }),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          ),
          elevation: WidgetStateProperty.all(0),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        child: const Text('Button', style: TextStyle(fontSize: 12)),
      ),
    );
  }
}
