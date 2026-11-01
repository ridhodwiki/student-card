import 'package:flutter/material.dart';

import 'theme.dart';
import 'widgets/app_card.dart';
import 'widgets/app_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Aplikasi')),
      body: AppPage(
        children: [
          AppCard(
            maxWidth: 360,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'MINI PROJECT',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      color: AppColors.mutedText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Student Card',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Versi 0.1.0',
                    style: TextStyle(fontSize: 13, color: AppColors.mutedText),
                  ),
                  const SizedBox(height: 20),
                  Container(height: 1, color: AppColors.border),
                  const SizedBox(height: 20),
                  const Text(
                    'Aplikasi mini project Flutter untuk menampilkan kartu '
                    'mahasiswa beserta profil, galeri, dan kontak dalam satu '
                    'alur navigasi.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: AppColors.mutedText,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          AppCard(
            maxWidth: 360,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Halaman',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const _PageRow(
                    name: 'Beranda',
                    description: 'Ringkasan mahasiswa dan pintasan.',
                  ),
                  const SizedBox(height: 12),
                  const _PageRow(
                    name: 'Kartu',
                    description: 'Kartu mahasiswa.',
                  ),
                  const SizedBox(height: 12),
                  const _PageRow(
                    name: 'Profil',
                    description: 'Data diri mahasiswa.',
                  ),
                  const SizedBox(height: 12),
                  const _PageRow(
                    name: 'Galeri',
                    description: 'Foto mahasiswa.',
                  ),
                  const SizedBox(height: 12),
                  const _PageRow(
                    name: 'Kontak',
                    description: 'Email dan telepon.',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Dibuat oleh Ridho Dwiki Zakaria • 24670007',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: AppColors.mutedText),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: AppColors.border),
              minimumSize: const Size(160, 44),
            ),
            child: const Text('Kembali'),
          ),
        ],
      ),
    );
  }
}

class _PageRow extends StatelessWidget {
  const _PageRow({required this.name, required this.description});

  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 84,
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Text(
            description,
            style: const TextStyle(
              fontSize: 13,
              height: 1.4,
              color: AppColors.mutedText,
            ),
          ),
        ),
      ],
    );
  }
}
