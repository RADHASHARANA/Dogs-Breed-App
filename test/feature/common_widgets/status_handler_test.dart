import 'package:flutter/material.dart';
import 'package:flutter_networking/feature/common_widgets/status_handler.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StatusHandler', () {
    const successWidget = Text('Success');
    const error = 'Server Error';

    testWidgets('renders SizedBox.shrink() for Status.initial', (tester) async {
      await tester.pumpWidget(
        StatusHandler(
          status: Status.initial,
          onSuccess: successWidget,
        ),
      );

      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text('Success'), findsNothing);
      expect(find.text('Server Error'), findsNothing);
      expect(find.text('No Breeds Found'), findsNothing);
    });

    testWidgets('renders CircularProgressIndicator for Status.loading',
        (tester) async {
      await tester.pumpWidget(
        StatusHandler(
          status: Status.loading,
          onSuccess: successWidget,
        ),
      );

      expect(find.byType(SizedBox), findsNothing);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Success'), findsNothing);
      expect(find.text('Server Error'), findsNothing);
      expect(find.text('No Breeds Found'), findsNothing);
    });

    testWidgets('renders onSuccess widget for Status.success', (tester) async {
      await tester.pumpWidget(
        const Directionality(
          // Wrap with Directionality
          textDirection: TextDirection.ltr, // Set text direction
          child: StatusHandler(
            status: Status.success,
            onSuccess: successWidget,
          ),
        ),
      );

      expect(find.byType(SizedBox), findsNothing);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text('Success'), findsOneWidget);
      expect(find.text('Server Error'), findsNothing);
      expect(find.text('No Breeds Found'), findsNothing);
    });

    testWidgets('renders Center with error text for Status.error',
        (tester) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: StatusHandler(
            status: Status.error,
            onSuccess: successWidget,
            error: error,
          ),
        ),
      );

      // Correct assertion
      expect(find.text('Success'), findsNothing); // This should be findsNothing
      expect(find.byType(SizedBox), findsNothing);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text(error), findsOneWidget); // This should be findsOneWidget
      expect(find.text('No Breeds Found'), findsNothing);
    });

    testWidgets(
        'renders Center with default error text for Status.error with null error',
        (tester) async {
      await tester.pumpWidget(
        const Directionality(
          // Wrap with Directionality
          textDirection: TextDirection.ltr, // Set text direction
          child: StatusHandler(
            status: Status.error,
            onSuccess: successWidget,
          ),
        ),
      );

      expect(find.byType(SizedBox), findsNothing);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text('Success'), findsNothing);
      expect(find.text('Server Error'), findsOneWidget);
      expect(find.text('No Breeds Found'), findsNothing);
    });

    testWidgets('renders Center with text for Status.empty', (tester) async {
      await tester.pumpWidget(
        const Directionality(
          // Wrap with Directionality
          textDirection: TextDirection.ltr, // Set text direction
          child: StatusHandler(
            status: Status.empty,
            onSuccess: successWidget,
          ),
        ),
      );

      expect(find.byType(SizedBox), findsNothing);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text('Success'), findsNothing);
      expect(find.text('Server Error'), findsNothing);
      expect(find.text('No Breeds Found'), findsOneWidget);
    });
  });
}
