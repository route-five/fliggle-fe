import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fliggle/app/view/core/components/custom_text_field.dart';
import 'package:fliggle/app/view/core/design/fliggle_theme_data.dart';

void main() {
  group('CustomTextField Performance Tests', () {
    testWidgets('build performance test', (WidgetTester tester) async {
      final stopwatch = Stopwatch()..start();

      await tester.pumpWidget(
        MaterialApp(
          theme: FliggleThemeData.lightTheme,
          home: const Scaffold(
            body: CustomTextField(label: 'Test Label', hint: 'Test Hint'),
          ),
        ),
      );

      stopwatch.stop();
      log(
        'CustomTextField build time: ${stopwatch.elapsedMicroseconds} microseconds',
      );

      expect(stopwatch.elapsedMicroseconds, lessThan(750000));
    });

    testWidgets('focus change performance test', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: FliggleThemeData.lightTheme,
          home: const Scaffold(
            body: CustomTextField(label: 'Test Label', hint: 'Test Hint'),
          ),
        ),
      );

      final textField = find.byType(TextField);

      final stopwatch = Stopwatch()..start();

      // Tap to focus
      await tester.tap(textField);
      await tester.pump();

      stopwatch.stop();
      log('Focus change time: ${stopwatch.elapsedMicroseconds} microseconds');

      // Assert that focus change is under reasonable threshold (500ms)
      expect(stopwatch.elapsedMicroseconds, lessThan(500000));
    });

    testWidgets('text input performance test', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: FliggleThemeData.lightTheme,
          home: const Scaffold(
            body: CustomTextField(label: 'Test Label', hint: 'Test Hint'),
          ),
        ),
      );

      final textField = find.byType(TextField);
      await tester.tap(textField);
      await tester.pump();

      final stopwatch = Stopwatch()..start();

      // Enter text
      await tester.enterText(textField, 'Performance test text input');
      await tester.pump();

      stopwatch.stop();
      log('Text input time: ${stopwatch.elapsedMicroseconds} microseconds');

      // Assert that text input is under reasonable threshold (100ms)
      expect(stopwatch.elapsedMicroseconds, lessThan(100000));
    });

    testWidgets('multiple text fields build performance', (
      WidgetTester tester,
    ) async {
      final stopwatch = Stopwatch()..start();

      await tester.pumpWidget(
        MaterialApp(
          theme: FliggleThemeData.lightTheme,
          home: Scaffold(
            body: Column(
              children: List.generate(
                10,
                (index) =>
                    CustomTextField(label: 'Label $index', hint: 'Hint $index'),
              ),
            ),
          ),
        ),
      );

      stopwatch.stop();
      log(
        '10 CustomTextFields build time: ${stopwatch.elapsedMicroseconds} microseconds',
      );

      // Assert that building 10 text fields is under reasonable threshold (1 second)
      expect(stopwatch.elapsedMicroseconds, lessThan(1000000));
    });

    testWidgets('rapid focus changes performance', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: FliggleThemeData.lightTheme,
          home: Scaffold(
            body: Column(
              children: [
                CustomTextField(label: 'Field 1', hint: 'Hint 1'),
                CustomTextField(label: 'Field 2', hint: 'Hint 2'),
                CustomTextField(label: 'Field 3', hint: 'Hint 3'),
              ],
            ),
          ),
        ),
      );

      final textFields = find.byType(TextField);

      final stopwatch = Stopwatch()..start();

      // Rapidly change focus between fields
      for (int i = 0; i < 3; i++) {
        await tester.tap(textFields.at(i));
        await tester.pump();
      }

      stopwatch.stop();
      log(
        'Rapid focus changes time: ${stopwatch.elapsedMicroseconds} microseconds',
      );

      // Assert that rapid focus changes are under reasonable threshold (200ms)
      expect(stopwatch.elapsedMicroseconds, lessThan(200000));
    });

    testWidgets('memory usage during text input', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: FliggleThemeData.lightTheme,
          home: const Scaffold(
            body: CustomTextField(
              label: 'Memory Test',
              hint: 'Memory Test Hint',
            ),
          ),
        ),
      );

      final textField = find.byType(TextField);
      await tester.tap(textField);
      await tester.pump();

      // Simulate large text input
      final largeText = 'A' * 1000;

      final stopwatch = Stopwatch()..start();

      await tester.enterText(textField, largeText);
      await tester.pump();

      stopwatch.stop();
      log(
        'Large text input time: ${stopwatch.elapsedMicroseconds} microseconds',
      );

      // Verify the text was entered correctly
      expect(find.text(largeText), findsOneWidget);

      // Assert that large text input is handled efficiently (under 100ms)
      expect(stopwatch.elapsedMicroseconds, lessThan(100000));
    });

    testWidgets('rebuild performance on state changes', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: FliggleThemeData.lightTheme,
          home: const Scaffold(
            body: CustomTextField(
              label: 'Rebuild Test',
              hint: 'Rebuild Test Hint',
            ),
          ),
        ),
      );

      final textField = find.byType(TextField);

      final stopwatch = Stopwatch()..start();

      // Trigger multiple rebuilds by focusing and unfocusing
      await tester.tap(textField);
      await tester.pump();

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      await tester.tap(textField);
      await tester.pump();

      stopwatch.stop();
      log(
        'Multiple rebuilds time: ${stopwatch.elapsedMicroseconds} microseconds',
      );

      // Assert that multiple rebuilds are efficient (under 200ms)
      expect(stopwatch.elapsedMicroseconds, lessThan(200000));
    });

    testWidgets('performance baseline comparison', (WidgetTester tester) async {
      log('\n=== Performance Baseline Test ===');

      // Test standard TextField for comparison
      final standardStopwatch = Stopwatch()..start();

      await tester.pumpWidget(
        MaterialApp(
          theme: FliggleThemeData.lightTheme,
          home: const Scaffold(
            body: TextField(
              decoration: InputDecoration(
                labelText: 'Standard Field',
                hintText: 'Standard Hint',
              ),
            ),
          ),
        ),
      );

      standardStopwatch.stop();
      log(
        'Standard TextField build time: ${standardStopwatch.elapsedMicroseconds} microseconds',
      );

      // Test CustomTextField
      final customStopwatch = Stopwatch()..start();

      await tester.pumpWidget(
        MaterialApp(
          theme: FliggleThemeData.lightTheme,
          home: const Scaffold(
            body: CustomTextField(label: 'Custom Field', hint: 'Custom Hint'),
          ),
        ),
      );

      customStopwatch.stop();
      log(
        'CustomTextField build time: ${customStopwatch.elapsedMicroseconds} microseconds',
      );

      // CustomTextField should not be significantly slower than standard TextField
      final performanceRatio =
          customStopwatch.elapsedMicroseconds /
          standardStopwatch.elapsedMicroseconds;
      log(
        'Performance ratio (Custom/Standard): ${performanceRatio.toStringAsFixed(2)}',
      );

      // CustomTextField should be within 5x the performance of standard TextField
      expect(
        performanceRatio,
        lessThan(5.0),
        reason:
            'CustomTextField should not be more than 5x slower than standard TextField',
      );
    });
  });
}
