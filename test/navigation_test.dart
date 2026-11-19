import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widget/main.dart';

void main() {
  testWidgets('navigasi samping membuka kartu dan kontak pada layar lebar', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(1280, 800);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPhysicalSize);
    await tester.pumpWidget(const MainApp());
    expect(find.byType(NavigationRail), findsOneWidget);
    await tester.tap(find.byIcon(Icons.badge_outlined));
    await tester.pumpAndSettle();
    final kontak = find.text('Lihat kontak');
    await tester.ensureVisible(kontak);
    await tester.tap(kontak);
    await tester.pumpAndSettle();
    expect(find.text('TELEPON'), findsOneWidget);
  });

  testWidgets('bottom nav dan tautan halaman berpindah antar 6 halaman', (
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

    await tester.tap(find.byIcon(Icons.storefront_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Perlengkapan Kuliah'), findsOneWidget);
    expect(
      tester.widget<NavigationBar>(find.byType(NavigationBar)).selectedIndex,
      5,
    );

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    expect(find.text('Foto Profil'), findsOneWidget);

    final katalogLink = find.widgetWithText(TextButton, 'Katalog');
    await tester.ensureVisible(katalogLink);
    await tester.pumpAndSettle();
    await tester.tap(katalogLink);
    await tester.pumpAndSettle();
    expect(find.text('Perlengkapan Kuliah'), findsOneWidget);

    final homeLink = find.widgetWithText(TextButton, 'Beranda');
    await tester.ensureVisible(homeLink);
    await tester.pumpAndSettle();
    await tester.tap(homeLink);
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
    expect(find.text('Tentang Aplikasi'), findsOneWidget);
  });

  testWidgets('Tentang Aplikasi membuka SecondPage lalu kembali', (
    tester,
  ) async {
    await tester.pumpWidget(const MainApp());

    final tentang = find.text('Tentang Aplikasi');
    await tester.ensureVisible(tentang);
    await tester.pumpAndSettle();
    await tester.tap(tentang);
    await tester.pumpAndSettle();
    expect(find.text('Tentang Aplikasi'), findsOneWidget);
    expect(find.text('Versi 0.1.0'), findsOneWidget);

    final back = find.widgetWithText(OutlinedButton, 'Kembali');
    await tester.ensureVisible(back);
    await tester.pumpAndSettle();
    await tester.tap(back);
    await tester.pumpAndSettle();
    expect(find.text('Tentang Aplikasi'), findsOneWidget);
  });
}
