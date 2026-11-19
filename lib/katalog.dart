import 'package:flutter/material.dart';

import 'app_scaffold.dart';
import 'data/produk.dart';
import 'navigation.dart';
import 'widgets/app_page.dart';
import 'widgets/page_links.dart';

Widget _gambar(Map<String, String> item, double tinggi) {
  return SizedBox(
    height: tinggi,
    width: double.infinity,
    child: Image.network(
      item['gambar']!,
      semanticLabel: item['nama'],
      fit: BoxFit.cover,
      loadingBuilder: (_, child, progress) => progress == null
          ? child
          : const Center(child: CircularProgressIndicator()),
      errorBuilder: (_, error, stack) => const Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          semanticLabel: 'Gambar tidak tersedia',
        ),
      ),
    ),
  );
}

class KoleksiProduk extends ChangeNotifier {
  final _favorit = <String>{};
  final _keranjang = <String, int>{};

  bool ubahFavorit(String nama) {
    final tambah = _favorit.add(nama);
    if (!tambah) _favorit.remove(nama);
    notifyListeners();
    return tambah;
  }

  void tambahKeKeranjang(String nama) {
    _keranjang.update(nama, (jumlah) => jumlah + 1, ifAbsent: () => 1);
    notifyListeners();
  }
}

class KatalogPage extends StatefulWidget {
  const KatalogPage({
    super.key,
    required this.onNavigate,
    required this.koleksi,
  });
  final KoleksiProduk koleksi;
  final ValueChanged<int> onNavigate;

  @override
  State<KatalogPage> createState() => _KatalogPageState();
}

class _KatalogPageState extends State<KatalogPage> {
  bool _grid = false;

  void _bukaDetail(Map<String, String> item) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => DetailProduk(item: item, koleksi: widget.koleksi),
      ),
    );
  }

  void _ubahFavorit(String nama) {
    final tambah = widget.koleksi.ubahFavorit(nama);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            tambah
                ? '$nama ditambahkan ke favorit'
                : '$nama dihapus dari favorit',
          ),
        ),
      );
  }

  Widget _productCard(int index) {
    final item = daftarProduk[index];
    final nama = item['nama']!;
    final favorit = widget.koleksi._favorit.contains(nama);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _bukaDetail(item),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                _gambar(item, _grid ? 96 : 140),
                Positioned(
                  top: 4,
                  right: 4,
                  child: IconButton.filled(
                    tooltip: favorit
                        ? 'Hapus $nama dari favorit'
                        : 'Favoritkan $nama',
                    onPressed: () => _ubahFavorit(nama),
                    icon: Icon(
                      favorit ? Icons.favorite : Icons.favorite_border,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  if (!_grid) Text(item['deskripsi']!),
                  Text(
                    item['harga']!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '★ ${item['rating']}',
                    semanticsLabel: 'Rating ${item['rating']} dari 5',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.koleksi,
      builder: (_, _) => AppScaffold(
        current: AppTab.katalog,
        actions: _aksiKoleksi(context, widget.koleksi),
        onNavigate: widget.onNavigate,
        child: SafeArea(
          child: AppPage(
            children: [
              Text(
                'Perlengkapan Kuliah',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              SegmentedButton<bool>(
                segments: const [
                  ButtonSegment(
                    value: false,
                    icon: Icon(Icons.view_list_outlined),
                    label: Text('List'),
                  ),
                  ButtonSegment(
                    value: true,
                    icon: Icon(Icons.grid_view_outlined),
                    label: Text('Grid'),
                  ),
                ],
                selected: {_grid},
                onSelectionChanged: (value) =>
                    setState(() => _grid = value.single),
              ),
              const SizedBox(height: 16),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: _grid ? 1000 : 480),
                child: _grid
                    ? GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              MediaQuery.sizeOf(context).width >= 768 ? 3 : 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          mainAxisExtent:
                              136 + MediaQuery.textScalerOf(context).scale(144),
                        ),
                        itemCount: daftarProduk.length,
                        itemBuilder: (_, index) => _productCard(index),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: daftarProduk.length,
                        separatorBuilder: (_, index) =>
                            const SizedBox(height: 8),
                        itemBuilder: (_, index) => _productCard(index),
                      ),
              ),
              PageLinks(current: AppTab.katalog, onNavigate: widget.onNavigate),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> _aksiKoleksi(BuildContext context, KoleksiProduk koleksi) {
  return [
    for (final keranjang in [false, true])
      IconButton(
        tooltip: keranjang ? 'Keranjang' : 'Favorit',
        icon: Icon(
          keranjang ? Icons.shopping_cart_outlined : Icons.favorite_outline,
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) =>
                _HalamanKoleksi(keranjang: keranjang, koleksi: koleksi),
          ),
        ),
      ),
  ];
}

class _HalamanKoleksi extends StatelessWidget {
  const _HalamanKoleksi({required this.keranjang, required this.koleksi});
  final bool keranjang;
  final KoleksiProduk koleksi;

  @override
  Widget build(BuildContext context) {
    final judul = keranjang ? 'Keranjang' : 'Favorit';
    return Scaffold(
      appBar: AppBar(title: Text(judul)),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: koleksi,
          builder: (_, _) {
            final items = daftarProduk
                .where(
                  (item) => keranjang
                      ? koleksi._keranjang.containsKey(item['nama'])
                      : koleksi._favorit.contains(item['nama']),
                )
                .toList();
            if (items.isEmpty) {
              return Center(
                child: Text(
                  keranjang
                      ? 'Keranjang masih kosong.'
                      : 'Belum ada produk favorit.',
                ),
              );
            }
            return Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: items.length,
                  separatorBuilder: (_, _) => const Divider(),
                  itemBuilder: (_, index) {
                    final item = items[index];
                    final nama = item['nama']!;
                    return ListTile(
                      leading: SizedBox(
                        width: 52,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: _gambar(item, 52),
                        ),
                      ),
                      title: Text(nama),
                      trailing: _kategori(context, item['kategori']!),
                      subtitle: Text(
                        keranjang
                            ? "${item['harga']} · ${koleksi._keranjang[nama]} buah"
                            : item['harga']!,
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget _kategori(BuildContext context, String kategori) {
  final theme = Theme.of(context);
  return Chip(
    shape: const StadiumBorder(),
    side: BorderSide.none,
    elevation: 3,
    shadowColor: Colors.black54,
    backgroundColor: theme.colorScheme.primaryContainer,
    labelStyle: theme.textTheme.labelMedium?.copyWith(
      color: theme.colorScheme.onPrimaryContainer,
    ),
    label: Text(kategori, semanticsLabel: 'Kategori: $kategori'),
  );
}

class DetailProduk extends StatelessWidget {
  const DetailProduk({super.key, required this.item, required this.koleksi});
  final KoleksiProduk koleksi;
  final Map<String, String> item;

  @override
  Widget build(BuildContext context) {
    final nama = item['nama']!;
    return Scaffold(
      appBar: AppBar(
        title: Text(nama),
        actions: _aksiKoleksi(context, koleksi),
      ),
      body: SafeArea(
        child: AppPage(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _gambar(item, 200),
                  const SizedBox(height: 16),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: _kategori(context, item['kategori']!),
                  ),
                  Text(
                    item['harga']!,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text('Rating ${item['rating']} / 5'),
                  const SizedBox(height: 16),
                  Text(item['deskripsi']!),
                  const SizedBox(height: 20),
                  FilledButton.icon(
                    icon: const Icon(Icons.add_shopping_cart),
                    label: const Text('Tambah ke Keranjang'),
                    onPressed: () {
                      koleksi.tambahKeKeranjang(nama);
                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            content: Text('$nama ditambahkan ke keranjang'),
                          ),
                        );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
