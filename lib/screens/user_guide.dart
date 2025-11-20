import 'package:flutter/material.dart';

class UserGuideScreen extends StatelessWidget {
  const UserGuideScreen({super.key});

  static const Color darkBlue = Color(0xFF0D47A1); 
  static const Color lightBlueBg = Color(
    0xFFE3F2FD,
  );
  static const Color textGrey = Color(0xFF616161);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopHeader(),

              const Divider(thickness: 1, height: 1, color: Color(0xFFEEEEEE)),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.menu_book_outlined,
                          color: darkBlue,
                          size: 28,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Panduan Penggunaan',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: darkBlue,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Selamat datang di panduan penggunaan aplikasi Jurnalku. Panduan ini akan membantu Anda memahami cara menggunakan fitur-fitur yang tersedia dengan optimal.',
                      style: TextStyle(
                        fontSize: 15,
                        color: textGrey,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 24),

                    _buildSectionTitle('Umum'),
                    const SizedBox(height: 12),
                    ...[
                      {
                        'icon': Icons.assignment_ind_outlined,
                        'title': 'Unggah Profile',
                        'subtitle': 'Panduan untuk mengunggah profile pengguna',
                      },
                      {
                        'icon': Icons.password_outlined,
                        'title': 'Ganti Password',
                        'subtitle': 'Panduan untuk mengganti password pengguna',
                      },
                    ].map((g) => Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: _buildGuideCard(
                            icon: g['icon'] as IconData,
                            title: g['title'] as String,
                            subtitle: g['subtitle'] as String,
                          ),
                        )).toList(),

                    const SizedBox(height: 12),
                    _buildSectionTitle('Untuk Siswa'),
                    const SizedBox(height: 12),
                    ...[
                      {
                        'icon': Icons.edit_note_rounded,
                        'title': 'Mengisi Jurnal',
                        'subtitle': 'Panduan untuk mengisi kegiatan harian siswa',
                      },
                      {
                        'icon': Icons.edit_note_rounded,
                        'title': 'Kelengkapan Profile',
                        'subtitle': 'Panduan untuk melengkapi profile',
                      },
                      {
                        'icon': Icons.image_rounded,
                        'title': 'Mengelola Portofolio',
                        'subtitle': 'Panduan untuk menambah, edit, dan hapus portofolio',
                      },
                      {
                        'icon': Icons.checklist_rtl_rounded,
                        'title': 'Mengelola Sertifikat',
                        'subtitle': 'Panduan untuk menambah, edit, dan hapus sertifikat',
                      },
                      {
                        'icon': Icons.info,
                        'title': 'Catatan Sikap Saya',
                        'subtitle': 'Panduan untuk melihat catatan sikap',
                      },
                    ].map((g) => Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: _buildGuideCard(
                            icon: g['icon'] as IconData,
                            title: g['title'] as String,
                            subtitle: g['subtitle'] as String,
                          ),
                        )).toList(),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.home_outlined, color: Colors.grey[700], size: 26),

          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Farrel Muhammad Bintang',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'PPLG XII-5',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  'assets/images/avatar.png',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF37474F),
      ),
    );
  }

  Widget _buildGuideCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: lightBlueBg,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: darkBlue, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: textGrey,
                      fontSize: 14,
                      height: 1.3,
                    ),
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
