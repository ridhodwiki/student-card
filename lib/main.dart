import 'package:flutter/material.dart';

import 'secondpage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mini Project - Student Card'),
          centerTitle: true,
          backgroundColor: const Color(0xFF4C1D95),
          foregroundColor: Colors.white,
        ),
        backgroundColor: Color(0xFF4C1D95),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 320),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 32,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF5B21B6),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: Colors.white24, width: 1.5),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'STUDENT CARD',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Image.asset(
                          'assets/image/1.png',
                          width: 96,
                          height: 96,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          width: 40,
                          height: 2,
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(1),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Ridho Dwiki Zakaria',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '24670007 • Teknik Informatika',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(height: 1, color: Colors.white24),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.mail, color: Colors.white, size: 24),
                            const SizedBox(width: 20),
                            Icon(Icons.phone, color: Colors.white, size: 24),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SecondPage(),
                        ),
                      );
                    },
                    child: const Text('Click Me'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
