import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/provider/todo_provider.dart';

void main() {
  testWidgets('Add todo test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => TodoProvider(),
        child: MyApp(),
      ),
    );

    // Verify if we are on the HomePage and the initial todo is present.
    expect(find.text('first todo'), findsOneWidget);

    // Tap the '+' icon and navigate to the add page.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Verify if we are on the AddPage.
    expect(find.text('Your todo'), findsOneWidget);

    // to Enter a new todo and press 'Add'.
    await tester.enterText(find.byType(TextField), 'New todo');
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();

    // Verify if the new todo is added to the list on the HomePage.
    expect(find.text('New todo'), findsOneWidget);
  });
}
