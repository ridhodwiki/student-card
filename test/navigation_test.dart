import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widget/main.dart';

void main() {
  testWidgets('bottom nav dan tautan halaman berpindah antar 5 halaman', (
    tester,
  ) async {
    await tester.pumpWidget(const MainApp());

    expect(find.byType(NavigationBar), findsOneWidget);

    await tester.tap(find.byIcon(Icons.person_outline));
    await tester.pumpAndSettle();
    expect(
      find.descendant(of: find.byType(AppBar), matching: find.text('Profil')),
      findsOneWidget,
    );
    expect(find.text('Program Studi'), findsOneWidget);

    final contactLink = find.widgetWithText(TextButton, 'Kontak');
    await tester.ensureVisible(contactLink);
    await tester.pumpAndSettle();
    await tester.tap(contactLink);
    await tester.pumpAndSettle();
    expect(
      find.descendant(of: find.byType(AppBar), matching: find.text('Kontak')),
      findsOneWidget,
    );
    expect(find.text('ridhodwiki768@gmail.com'), findsOneWidget);
    expect(find.text('089526352118'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.badge_outlined));
    await tester.pumpAndSettle();
    expect(find.text('STUDENT CARD'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.photo_library_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Foto Profil'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.home_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Ridho Dwiki Zakaria'), findsOneWidget);
  });
}
