import 'package:flutter/material.dart';
import 'about_page.dart';

class ProfilePage extends StatefulWidget {
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeChanged;

  const ProfilePage({
    required this.themeMode,
    required this.onThemeChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'Tekno';
  String title = 'Scrolling Engineer';
  String description = 'Scrol Fesnuk, Yapping';
  String email = 'tekno@test.com';
  String phone = '+62 812 3456 7890';
  final String imageUrl = 'https://flutter.dev/images/flutter-logo-sharing.png';

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: name);
    emailController = TextEditingController(text: email);
    phoneController = TextEditingController(text: phone);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Card App'),
        actions: [
          PopupMenuButton<String>(
            tooltip: 'Pilih Tema',
            icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
            onSelected: (value) {
              if (value == 'light') {
                widget.onThemeChanged(ThemeMode.light);
              } else if (value == 'dark') {
                widget.onThemeChanged(ThemeMode.dark);
              } else if (value == 'system') {
                widget.onThemeChanged(ThemeMode.system);
              }
            },
            itemBuilder: (context) => [
              CheckedPopupMenuItem(
                checked: widget.themeMode == ThemeMode.light,
                value: 'light',
                child: const Text('Terang'),
              ),
              CheckedPopupMenuItem(
                checked: widget.themeMode == ThemeMode.dark,
                value: 'dark',
                child: const Text('Gelap'),
              ),
              CheckedPopupMenuItem(
                checked: widget.themeMode == ThemeMode.system,
                value: 'system',
                child: const Text('Otomatis (Sistem)'),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Tentang',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ===== KARTU PROFIL =====
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                    const SizedBox(height: 16),
                    Text(name, style: Theme.of(context).textTheme.titleLarge),
                    Text(title, style: const TextStyle(color: Colors.grey)),
                    const SizedBox(height: 8),
                    Text(description, textAlign: TextAlign.center),
                    const Divider(height: 30),
                    ListTile(
                      leading: const Icon(Icons.email),
                      title: Text(email),
                    ),
                    ListTile(
                      leading: const Icon(Icons.phone),
                      title: Text(phone),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ===== FORM EDIT PROFIL =====
            Text('Edit Profil', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => name = value),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => email = value),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Telepon',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => phone = value),
            ),

            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                FocusScope.of(context).unfocus();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profil berhasil diperbarui!')),
                );
              },
              icon: const Icon(Icons.save),
              label: const Text('Simpan Perubahan'),
            ),
          ],
        ),
      ),
    );
  }
}
