import 'package:flutter/material.dart';
import 'package:jurnalku_app/widgets/guide_card.dart';
import 'package:jurnalku_app/widgets/navbar.dart';

class UserGuideScreen extends StatelessWidget {
  const UserGuideScreen({super.key});

  static const Color darkBlue = Color(0xFF0D47A1);
  static const Color lightBlueBg = Color(0xFFE3F2FD);
  static const Color textGrey = Color(0xFF616161);

  static final List<Map<String, dynamic>> generalGuidesPublic = [
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
  ];

  static final List<Map<String, dynamic>> studentGuidesStudent = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NavbarWidget(
                nama: 'Muhammad Bayu Aji Sutisna Putra',
                kelas: 'PPLG XII-5',
                avatarPath: 'assets/images/avatar.png',
              ),
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
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: generalGuidesPublic.length,
                      itemBuilder: (context, index) {
                        final guide = generalGuidesPublic[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: GuideCard(
                            icon: guide['icon'] as IconData,
                            title: guide['title'] as String,
                            subtitle: guide['subtitle'] as String,
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 12),
                    _buildSectionTitle('Untuk Siswa'),
                    const SizedBox(height: 12),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: studentGuidesStudent.length,
                      itemBuilder: (context, index) {
                        final guide = studentGuidesStudent[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: GuideCard(
                            icon: guide['icon'] as IconData,
                            title: guide['title'] as String,
                            subtitle: guide['subtitle'] as String,
                          ),
                        );
                      },
                    ),

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
}
