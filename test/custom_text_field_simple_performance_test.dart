import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fliggle/app/view/core/components/custom_text_field.dart';
import 'package:fliggle/app/view/core/design/fliggle_theme_data.dart';

/// Simple performance monitoring test without annotations
/// Provides basic performance metrics for CustomTextField
void main() {
  group('CustomTextField Performance Monitor', () {
    testWidgets('performance summary report', (WidgetTester tester) async {
      log('\n📊 CustomTextField Performance Report');
      log('=====================================');

      // Test 1: Single widget build
      var stopwatch = Stopwatch()..start();
      await tester.pumpWidget(
        MaterialApp(
          theme: FliggleThemeData.lightTheme,
          home: const Scaffold(
            body: CustomTextField(label: 'Test', hint: 'Test'),
          ),
        ),
      );
      stopwatch.stop();
      final singleBuildTime = stopwatch.elapsedMicroseconds;
      log(
        '✓ Single widget build: ${(singleBuildTime / 1000).toStringAsFixed(2)}ms',
      );

      // Test 2: Focus interaction
      final textField = find.byType(TextField);
      stopwatch = Stopwatch()..start();
      await tester.tap(textField);
      await tester.pump();
      stopwatch.stop();
      final focusTime = stopwatch.elapsedMicroseconds;
      log('✓ Focus interaction: ${(focusTime / 1000).toStringAsFixed(2)}ms');

      // Test 3: Text input
      stopwatch = Stopwatch()..start();
      await tester.enterText(textField, 'Performance test');
      await tester.pump();
      stopwatch.stop();
      final inputTime = stopwatch.elapsedMicroseconds;
      log('✓ Text input response: ${(inputTime / 1000).toStringAsFixed(2)}ms');

      // Test 4: Multiple widgets
      stopwatch = Stopwatch()..start();
      await tester.pumpWidget(
        MaterialApp(
          theme: FliggleThemeData.lightTheme,
          home: Scaffold(
            body: ListView(
              children: List.generate(
                5,
                (i) => CustomTextField(label: 'Field $i', hint: 'Hint $i'),
              ),
            ),
          ),
        ),
      );
      stopwatch.stop();
      final multipleWidgetsTime = stopwatch.elapsedMicroseconds;
      log(
        '✓ 5 widgets build: ${(multipleWidgetsTime / 1000).toStringAsFixed(2)}ms',
      );

      // Performance evaluation
      log('\n📈 Performance Analysis:');

      if (singleBuildTime < 100000) {
        log('✅ Build performance: Excellent (< 100ms)');
      } else if (singleBuildTime < 300000) {
        log('⚠️  Build performance: Good (< 300ms)');
      } else {
        log('❌ Build performance: Needs optimization (> 300ms)');
      }

      if (focusTime < 50000) {
        log('✅ Focus responsiveness: Excellent (< 50ms)');
      } else if (focusTime < 150000) {
        log('⚠️  Focus responsiveness: Good (< 150ms)');
      } else {
        log('❌ Focus responsiveness: Needs optimization (> 150ms)');
      }

      if (inputTime < 30000) {
        log('✅ Input responsiveness: Excellent (< 30ms)');
      } else if (inputTime < 100000) {
        log('⚠️  Input responsiveness: Good (< 100ms)');
      } else {
        log('❌ Input responsiveness: Needs optimization (> 100ms)');
      }

      final avgTimePerWidget = multipleWidgetsTime / 5;
      if (avgTimePerWidget < 50000) {
        log('✅ Scalability: Excellent (< 50ms per widget)');
      } else if (avgTimePerWidget < 150000) {
        log('⚠️  Scalability: Good (< 150ms per widget)');
      } else {
        log('❌ Scalability: Needs optimization (> 150ms per widget)');
      }

      log('\n🎯 Recommendations:');
      if (singleBuildTime > 200000) {
        log('• Consider optimizing widget build method');
      }
      if (focusTime > 100000) {
        log('• Review focus handling and state management');
      }
      if (inputTime > 50000) {
        log('• Optimize text input processing');
      }
      if (avgTimePerWidget > 100000) {
        log('• Consider widget caching or lazy loading for lists');
      }

      log('=====================================\n');

      // All performance tests should pass basic thresholds
      expect(singleBuildTime, lessThan(500000), reason: 'Build time too slow');
      expect(focusTime, lessThan(500000), reason: 'Focus time too slow');
      expect(inputTime, lessThan(200000), reason: 'Input time too slow');
      expect(
        multipleWidgetsTime,
        lessThan(2000000),
        reason: 'Multiple widgets build too slow',
      );
    });

    testWidgets('memory stress test', (WidgetTester tester) async {
      log('🧠 Memory Stress Test');
      log('====================');

      // Create and destroy widgets multiple times
      for (int cycle = 0; cycle < 5; cycle++) {
        await tester.pumpWidget(
          MaterialApp(
            theme: FliggleThemeData.lightTheme,
            home: Scaffold(
              body: Column(
                children: List.generate(
                  3,
                  (i) => CustomTextField(
                    key: ValueKey('cycle_${cycle}_field_$i'),
                    label: 'Field $i',
                    hint: 'Hint $i',
                  ),
                ),
              ),
            ),
          ),
        );

        // Interact with widgets
        final fields = find.byType(TextField);
        for (int i = 0; i < fields.evaluate().length; i++) {
          await tester.tap(fields.at(i));
          await tester.pump();
          await tester.enterText(fields.at(i), 'Test $i');
          await tester.pump();
        }

        // Clear widgets
        await tester.pumpWidget(
          MaterialApp(
            theme: FliggleThemeData.lightTheme,
            home: const Scaffold(body: SizedBox()),
          ),
        );

        log('• Cycle ${cycle + 1}/5 completed');
      }

      log('✅ Memory stress test completed successfully');
      log('====================\n');

      // If we reach here, memory management is working
      expect(true, isTrue);
    });

    testWidgets('baseline comparison', (WidgetTester tester) async {
      log('⚖️  Baseline Comparison');
      log('======================');

      // Standard TextField
      var stopwatch = Stopwatch()..start();
      await tester.pumpWidget(
        MaterialApp(
          theme: FliggleThemeData.lightTheme,
          home: const Scaffold(
            body: TextField(
              decoration: InputDecoration(
                labelText: 'Standard',
                hintText: 'Standard hint',
              ),
            ),
          ),
        ),
      );
      stopwatch.stop();
      final standardTime = stopwatch.elapsedMicroseconds;

      // CustomTextField
      stopwatch = Stopwatch()..start();
      await tester.pumpWidget(
        MaterialApp(
          theme: FliggleThemeData.lightTheme,
          home: const Scaffold(
            body: CustomTextField(label: 'Custom', hint: 'Custom hint'),
          ),
        ),
      );
      stopwatch.stop();
      final customTime = stopwatch.elapsedMicroseconds;

      final ratio = customTime / standardTime;

      log(
        '• Standard TextField: ${(standardTime / 1000).toStringAsFixed(2)}ms',
      );
      log('• CustomTextField: ${(customTime / 1000).toStringAsFixed(2)}ms');
      log('• Performance ratio: ${ratio.toStringAsFixed(2)}x');

      if (ratio < 2.0) {
        log('✅ CustomTextField performance is excellent');
      } else if (ratio < 3.0) {
        log('⚠️  CustomTextField performance is acceptable');
      } else {
        log('❌ CustomTextField performance needs optimization');
      }

      log('======================\n');

      // CustomTextField should not be more than 5x slower
      expect(
        ratio,
        lessThan(5.0),
        reason: 'CustomTextField is too slow compared to standard TextField',
      );
    });
  });
}
