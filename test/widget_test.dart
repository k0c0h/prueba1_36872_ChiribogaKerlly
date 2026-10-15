// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:prueba1_chiribogakerlly_36872/main.dart';

void main() {
  testWidgets('Permite navegar a los ejercicios', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Bienvenido'), findsOneWidget);
    await tester.tap(find.text('Ir a los ejercicios'));
    await tester.pumpAndSettle();

    expect(find.text('Ingresa un número entero'), findsOneWidget);
    expect(find.text('Calcular'), findsOneWidget);
  });
}
