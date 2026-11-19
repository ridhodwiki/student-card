import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widget/katalog.dart';
import 'package:flutter_widget/main.dart';
import 'package:flutter_widget/theme.dart';

void main() {
  testWidgets(
    'koleksi menampilkan pilihan dan jumlah saat katalog dibuka kembali',
    (tester) async {
      await tester.pumpWidget(const MainApp());
      Future<void> tekan(Finder tombol) async {
        await tester.ensureVisible(tombol);
        await tester.tap(tombol);
        await tester.pumpAndSettle();
      }

      final katalog = find.byIcon(Icons.storefront_outlined);
      await tekan(katalog);
      await tekan(find.byTooltip('Keranjang'));
      expect(find.text('Keranjang masih kosong.'), findsOneWidget);
      await tester.pageBack();
      await tester.pumpAndSettle();
      await tekan(find.byTooltip('Favorit'));
      expect(find.text('Belum ada produk favorit.'), findsOneWidget);
      await tester.pageBack();
      await tester.pumpAndSettle();
      await tekan(find.byTooltip('Favoritkan Buku Tulis'));
      await tekan(find.text('Tas Laptop'));
      await tekan(find.text('Tambah ke Keranjang'));
      await tekan(find.text('Tambah ke Keranjang'));
      await tekan(find.byTooltip('Keranjang'));
      expect(find.text('Tas Laptop'), findsOneWidget);
      expect(find.text('Rp150.000 · 2 buah'), findsOneWidget);
      expect(find.widgetWithText(Chip, 'Tas'), findsOneWidget);
      expect(
        tester.getCenter(find.text('Tas')).dx,
        greaterThan(tester.getCenter(find.text('Tas Laptop')).dx),
      );
      expect(find.text('Buku Tulis'), findsNothing);
      for (var i = 0; i < 2; i++) {
        await tester.pageBack();
        await tester.pumpAndSettle();
      }
      await tekan(find.byTooltip('Kembali'));
      await tekan(katalog);
      await tekan(find.byTooltip('Favorit'));
      expect(find.text('Buku Tulis'), findsOneWidget);
      expect(find.widgetWithText(Chip, 'Alat tulis'), findsOneWidget);
      expect(find.text('Tas Laptop'), findsNothing);
    },
  );

  testWidgets(
    'katalog menampilkan produk tanpa overflow pada berbagai ukuran',
    (tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      tester.view.devicePixelRatio = 1;

      for (final width in [320.0, 768.0, 1024.0, 1440.0]) {
        tester.view.physicalSize = Size(width, 800);
        await tester.pumpWidget(
          MaterialApp(
            theme: buildAppTheme(),
            home: MediaQuery(
              data: MediaQueryData.fromView(
                tester.view,
              ).copyWith(textScaler: const TextScaler.linear(2)),
              child: KatalogPage(onNavigate: (_) {}, koleksi: KoleksiProduk()),
            ),
          ),
        );

        expect(
          find.descendant(
            of: find.byType(AppBar),
            matching: find.text('Katalog'),
          ),
          findsOneWidget,
        );
        expect(find.text('Buku Tulis'), findsOneWidget);
        expect(find.text('Tas Laptop'), findsOneWidget);
        expect(find.byType(ListView), findsOneWidget);
        await tester.ensureVisible(find.text('Rp45.000'));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);

        await tester.ensureVisible(find.text('Grid'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Grid'));
        await tester.pumpAndSettle();
        expect(find.byType(GridView), findsOneWidget);
        final grid = tester.widget<GridView>(find.byType(GridView));
        expect(
          (grid.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount)
              .crossAxisCount,
          width >= 768 ? 3 : 2,
        );
        expect(find.byType(ListView), findsNothing);
        expect(find.byType(Image), findsNWidgets(9));
        await tester.ensureVisible(find.text('Rp45.000'));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);

        await tester.ensureVisible(find.text('List'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('List'));
        await tester.pumpAndSettle();
        expect(find.byType(ListView), findsOneWidget);
        expect(
          find.text('Paket pulpen, pensil, dan penghapus.'),
          findsOneWidget,
        );
        expect(tester.takeException(), isNull);
      }
    },
  );

  testWidgets('favorit tersimpan saat berpindah dari List ke Grid', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: KatalogPage(onNavigate: (_) {}, koleksi: KoleksiProduk()),
      ),
    );
    final tambah = find.byTooltip('Favoritkan Buku Tulis');
    await tester.ensureVisible(tambah);
    await tester.tap(tambah);
    await tester.pumpAndSettle();
    expect(find.text('Buku Tulis ditambahkan ke favorit'), findsOneWidget);
    await tester.ensureVisible(find.text('Grid'));
    await tester.tap(find.text('Grid'));
    await tester.pumpAndSettle();
    final hapus = find.byTooltip('Hapus Buku Tulis dari favorit');
    await tester.ensureVisible(hapus);
    await tester.tap(hapus);
    await tester.pumpAndSettle();
    expect(find.text('Buku Tulis dihapus dari favorit'), findsOneWidget);
  });

  testWidgets('List dan Grid membuka detail produk yang dipilih', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: KatalogPage(onNavigate: (_) {}, koleksi: KoleksiProduk()),
      ),
    );
    for (final (mode, nama, harga, kategori) in [
      ('List', 'Tas Laptop', 'Rp150.000', 'Tas'),
      ('Grid', 'Mouse', 'Rp75.000', 'Elektronik'),
    ]) {
      await tester.ensureVisible(find.text(mode));
      await tester.tap(find.text(mode));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text(nama));
      await tester.tap(find.text(nama));
      await tester.pumpAndSettle();
      expect(find.widgetWithText(AppBar, nama), findsOneWidget);
      expect(find.widgetWithText(Chip, kategori), findsOneWidget);
      expect(find.text(harga), findsOneWidget);
      await tester.tap(find.text('Tambah ke Keranjang'));
      await tester.pump();
      expect(find.text('$nama ditambahkan ke keranjang'), findsOneWidget);
      await tester.pageBack();
      await tester.pumpAndSettle();
    }
  });
}
