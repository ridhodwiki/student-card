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

  testWidgets('Navigator.pop dari AppBar kembali ke halaman sebelumnya', (
    tester,
  ) async {
    await tester.pumpWidget(const MainApp());

    await tester.tap(find.byIcon(Icons.person_outline));
    await tester.pumpAndSettle();
    expect(find.text('Program Studi'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    expect(
      find.descendant(
        of: find.byType(AppBar),
        matching: find.text('Mini Project - Student Card'),
      ),
      findsOneWidget,
    );
    expect(find.text('Click Me'), findsOneWidget);
  });

  testWidgets('Click Me membuka SecondPage lalu kembali', (tester) async {
    await tester.pumpWidget(const MainApp());

    final clickMe = find.text('Click Me');
    await tester.ensureVisible(clickMe);
    await tester.pumpAndSettle();
    await tester.tap(clickMe);
    await tester.pumpAndSettle();
    expect(find.text('Tentang Aplikasi'), findsOneWidget);
    expect(find.text('Versi 0.1.0'), findsOneWidget);

    final back = find.widgetWithText(OutlinedButton, 'Kembali');
    await tester.ensureVisible(back);
    await tester.pumpAndSettle();
    await tester.tap(back);
    await tester.pumpAndSettle();
    expect(find.text('Click Me'), findsOneWidget);
  });
}
