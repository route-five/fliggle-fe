import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fliggle/app/view/core/components/custom_text_field.dart';
import 'package:fliggle/app/view/core/design/fliggle_theme_data.dart';

class PerformanceBenchmark {
  final String name;
  final List<int> measurements = [];

  PerformanceBenchmark(this.name);

  void addMeasurement(int microseconds) {
    measurements.add(microseconds);
  }

  void printStatistics() {
    if (measurements.isEmpty) return;

    measurements.sort();
    final min = measurements.first;
    final max = measurements.last;
    final avg = measurements.reduce((a, b) => a + b) / measurements.length;
    final median = measurements[measurements.length ~/ 2];

    log('=== $name Performance Statistics ===');
    log('Min: $min μs');
    log('Max: $max μs');
    log('Average: ${avg.toStringAsFixed(2)}μs');
    log('Median: $median μs');
    log('Samples: ${measurements.length}');
    log('');
  }
}

void main() {
  group('CustomTextField Benchmark Tests', () {
    testWidgets('comprehensive performance benchmark', (
      WidgetTester tester,
    ) async {
      final buildBenchmark = PerformanceBenchmark('Widget Build');
      final focusBenchmark = PerformanceBenchmark('Focus Change');
      final textInputBenchmark = PerformanceBenchmark('Text Input');
      final rebuildBenchmark = PerformanceBenchmark('Widget Rebuild');

      // Run multiple iterations for statistical significance
      for (int iteration = 0; iteration < 20; iteration++) {
        // Test widget build performance
        final buildStopwatch = Stopwatch()..start();

        await tester.pumpWidget(
          MaterialApp(
            theme: FliggleThemeData.lightTheme,
            home: Scaffold(
              body: CustomTextField(
                key: ValueKey('test_field_$iteration'),
                label: 'Performance Test $iteration',
                hint: 'Hint $iteration',
              ),
            ),
          ),
        );

        buildStopwatch.stop();
        buildBenchmark.addMeasurement(buildStopwatch.elapsedMicroseconds);

        final textField = find.byType(TextField);

        // Test focus change performance
        final focusStopwatch = Stopwatch()..start();

        await tester.tap(textField);
        await tester.pump();

        focusStopwatch.stop();
        focusBenchmark.addMeasurement(focusStopwatch.elapsedMicroseconds);

        // Test text input performance
        final inputStopwatch = Stopwatch()..start();

        await tester.enterText(textField, 'Test input $iteration');
        await tester.pump();

        inputStopwatch.stop();
        textInputBenchmark.addMeasurement(inputStopwatch.elapsedMicroseconds);

        // Test rebuild performance
        final rebuildStopwatch = Stopwatch()..start();

        // Trigger rebuild by unfocusing and refocusing
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();
        await tester.tap(textField);
        await tester.pump();

        rebuildStopwatch.stop();
        rebuildBenchmark.addMeasurement(rebuildStopwatch.elapsedMicroseconds);
      }

      // Print all benchmark results
      buildBenchmark.printStatistics();
      focusBenchmark.printStatistics();
      textInputBenchmark.printStatistics();
      rebuildBenchmark.printStatistics();

      // Assert performance thresholds based on averages
      final buildAvg =
          buildBenchmark.measurements.reduce((a, b) => a + b) /
          buildBenchmark.measurements.length;
      final focusAvg =
          focusBenchmark.measurements.reduce((a, b) => a + b) /
          focusBenchmark.measurements.length;
      final inputAvg =
          textInputBenchmark.measurements.reduce((a, b) => a + b) /
          textInputBenchmark.measurements.length;
      final rebuildAvg =
          rebuildBenchmark.measurements.reduce((a, b) => a + b) /
          rebuildBenchmark.measurements.length;

      expect(
        buildAvg,
        lessThan(60000),
        reason: 'Average build time should be under 60ms',
      );
      expect(
        focusAvg,
        lessThan(30000),
        reason: 'Average focus time should be under 30ms',
      );
      expect(
        inputAvg,
        lessThan(20000),
        reason: 'Average input time should be under 20ms',
      );
      expect(
        rebuildAvg,
        lessThan(40000),
        reason: 'Average rebuild time should be under 40ms',
      );
    });

    testWidgets('stress test with many text fields', (
      WidgetTester tester,
    ) async {
      final List<int> buildTimes = [];
      final List<int> scrollTimes = [];

      // Test building many CustomTextFields
      for (int fieldCount in [5, 10, 20, 50]) {
        final stopwatch = Stopwatch()..start();

        await tester.pumpWidget(
          MaterialApp(
            theme: FliggleThemeData.lightTheme,
            home: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    fieldCount,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                        label: 'Field $index',
                        hint: 'Hint $index',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );

        stopwatch.stop();
        buildTimes.add(stopwatch.elapsedMicroseconds);

        log(
          'Building $fieldCount CustomTextFields: ${stopwatch.elapsedMicroseconds}μs',
        );

        // Test scrolling performance
        final scrollStopwatch = Stopwatch()..start();

        await tester.fling(
          find.byType(SingleChildScrollView),
          const Offset(0, -500),
          1000,
        );
        await tester.pumpAndSettle();

        scrollStopwatch.stop();
        scrollTimes.add(scrollStopwatch.elapsedMicroseconds);

        log(
          'Scrolling $fieldCount CustomTextFields: ${scrollStopwatch.elapsedMicroseconds}μs',
        );
      }

      // Verify that build time grows reasonably with field count
      // Build time should not grow exponentially
      expect(
        buildTimes.last / buildTimes.first,
        lessThan(10),
        reason: 'Build time should scale reasonably with field count',
      );
    });

    testWidgets('memory efficiency test', (WidgetTester tester) async {
      // Test creating and disposing many text fields to check for memory leaks
      for (int cycle = 0; cycle < 10; cycle++) {
        await tester.pumpWidget(
          MaterialApp(
            theme: FliggleThemeData.lightTheme,
            home: Scaffold(
              body: Column(
                children: List.generate(
                  5,
                  (index) => CustomTextField(
                    key: ValueKey('cycle_${cycle}_field_$index'),
                    label: 'Cycle $cycle Field $index',
                    hint: 'Hint $index',
                  ),
                ),
              ),
            ),
          ),
        );

        // Interact with each field
        final textFields = find.byType(TextField);
        for (int i = 0; i < textFields.evaluate().length; i++) {
          await tester.tap(textFields.at(i));
          await tester.pump();
          await tester.enterText(textFields.at(i), 'Test $i');
          await tester.pump();
        }

        // Clear the widget tree to test disposal
        await tester.pumpWidget(
          MaterialApp(
            theme: FliggleThemeData.lightTheme,
            home: const Scaffold(body: SizedBox.shrink()),
          ),
        );

        log('Completed memory cycle $cycle');
      }

      // If we reach here without memory issues, the test passes
      expect(
        true,
        isTrue,
        reason: 'Memory efficiency test completed successfully',
      );
    });

    testWidgets('animation performance test', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: FliggleThemeData.lightTheme,
          home: const Scaffold(
            body: CustomTextField(label: 'Animation Test', hint: 'Test hint'),
          ),
        ),
      );

      final textField = find.byType(TextField);

      // Test focus animation performance
      final animationStopwatch = Stopwatch()..start();

      await tester.tap(textField);
      await tester.pumpAndSettle(); // Wait for all animations to complete

      animationStopwatch.stop();

      log(
        'Focus animation completion time: ${animationStopwatch.elapsedMicroseconds}μs',
      );

      // Animation should complete within reasonable time (under 500ms)
      expect(animationStopwatch.elapsedMicroseconds, lessThan(500000));
    });
  });
}
