import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tsumiki_shared/ui.dart';

void main() {
  testWidgets('a card without a picture keeps its name and takes a tap', (
    tester,
  ) async {
    var taps = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StyleCard(
            label: 'Goatee',
            preview: 'missing.jpg',
            selected: true,
            onTap: () => taps++,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Goatee'), findsOneWidget);
    expect(find.byIcon(Icons.face), findsOneWidget);
    await tester.tap(find.text('Goatee'));
    expect(taps, 1);
  });

}
