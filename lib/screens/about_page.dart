import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile Card App',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            const Text(
              'Aplikasi ini dibuat menggunakan Flutter. '
              'Fitur-fiturnya mencakup tampilan profil sederhana, '
              'form edit data (nama, email, telepon), '
              'serta mode terang dan gelap yang dapat diubah secara dinamis.',
            ),
            const SizedBox(height: 20),
            const Text(
              'Dikembangkan oleh: Tekno Labs',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context); // kembali ke halaman sebelumnya
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
