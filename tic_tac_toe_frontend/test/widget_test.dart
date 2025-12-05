import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe_frontend/main.dart';

void main() {
  testWidgets('Renders title and controls', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());

    expect(find.text('Tic Tac Toe'), findsOneWidget);
    expect(find.text('New Game'), findsOneWidget);
    expect(find.text('Reset All'), findsOneWidget);
  });

  testWidgets('Tapping alternates turns and places marks', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());

    // First move X in top-left
    await tester.tap(find.byType(InkWell).first);
    await tester.pumpAndSettle();
    expect(find.text('X'), findsWidgets);

    // Next move O in the second cell (first row, second col)
    final cells = find.byType(InkWell);
    await tester.tap(cells.at(1));
    await tester.pumpAndSettle();
    // We should now have at least one O
    expect(find.text('O'), findsWidgets);
  });
}
