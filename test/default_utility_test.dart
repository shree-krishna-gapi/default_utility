import 'package:default_utility/helper/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:default_utility/default_utility.dart';

void main() {
  testWidgets('Test Default.toast and Default.dialog', (WidgetTester tester) async {
    // Create a navigator key to use with NavigationService.defaultKey.
    final navigatorKey = GlobalKey<NavigatorState>();
    NavigationService.defaultKey = navigatorKey; // You might need to expose this in your package or mock it

    // Build app skeleton for test
    await tester.pumpWidget(
      MaterialApp(
        key: navigatorKey,
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    Default.toast("Test Toast");
                    Default.dialog(
                      confirmationTitle: "Test Dialog",
                      confirmationTitleSubTitle: "Dialog Subtitle",
                      onOk: () => Navigator.of(context).pop(),
                    );
                  },
                  child: Text("Run Test"),
                ),
              );
            },
          ),
        ),
      ),
    );

    // Tap to call toast and dialog
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Here you could add expectations, e.g. check if snackbar/dialog appeared
    expect(find.text("Test Toast"), findsOneWidget);
    expect(find.text("Test Dialog"), findsOneWidget);
  });
}
