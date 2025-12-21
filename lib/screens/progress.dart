import 'package:flutter/material.dart';
import 'package:jurnalku_app/widgets/navbar.dart';
import 'package:jurnalku_app/widgets/status_card.dart';
import 'package:jurnalku_app/widgets/project_card.dart';

class Progress extends StatelessWidget {
  const Progress({super.key});

  // Data untuk gambar 1 (Status Cards)
  static final List<Map<String, dynamic>> dataGambar1 = [
    {
      'title': 'Total Pengajuan',
      'count': 0,
      'subtitle': 'Semua status',
      'subtitleColor': Colors.blue,
      'iconColor': Colors.blue,
      'icon': Icons.check_circle_outline,
    },
    {
      'title': 'Halaman Ini',
      'count': 0,
      'subtitle': 'Data ditampilkan',
      'subtitleColor': Colors.green,
      'iconColor': Colors.green,
      'icon': Icons.description_outlined,
    },
    {
      'title': 'Status Pending',
      'count': 0,
      'subtitle': 'Perlu validasi',
      'subtitleColor': Colors.orange,
      'iconColor': Colors.orange,
      'icon': Icons.access_time,
    },
  ];

  // Data untuk gambar 2 (Project Cards)
  static final List<Map<String, dynamic>> dataGambar2 = [
    {
      'title': 'Project Work',
      'subtitle': 'Kompetensi dan materi pembelajaran',
      'kompetensi': 'Membuat aplikasi berbasis web',
      'guru': 'Pak Budi Santoso',
      'tanggal': '15 November 2025',
      'status': 'Selesai',
      'catatanGuru': 'Sudah sesuai dengan kriteria penilaian',
      'catatanSiswa': 'Project sudah dikerjakan sesuai deadline',
    },
    {
      'title': 'Mobile Apps',
      'subtitle': 'Kompetensi dan materi pembelajaran',
      'kompetensi': 'Mengembangkan aplikasi mobile dengan Flutter',
      'guru': 'Bu Siti Rahmawati',
      'tanggal': '20 November 2025',
      'status': 'Dalam Progress',
      'catatanGuru': 'Perlu perbaikan pada fitur login',
      'catatanSiswa': 'Sedang mengerjakan fitur authentication',
    },
    {
      'title': 'UKK (Uji Kompetensi Keahlian)',
      'subtitle': 'Kompetensi dan materi pembelajaran',
      'kompetensi': 'Membuat sistem informasi sekolah',
      'guru': 'Pak Ahmad Fauzi',
      'tanggal': '5 Desember 2025',
      'status': 'Belum Dimulai',
      'catatanGuru': 'Belum ada penilaian',
      'catatanSiswa': 'Persiapan dokumentasi project',
    },
    {
      'title': 'GIM',
      'subtitle': 'Kompetensi dan materi pembelajaran',
      'kompetensi': 'Game development dengan Unity',
      'guru': 'Pak Rudi Hermawan',
      'tanggal': '10 Desember 2025',
      'status': 'Revisi',
      'catatanGuru': 'Gameplay masih perlu diperbaiki',
      'catatanSiswa': 'Sedang melakukan bug fixing',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            const NavbarWidget(),
            const Divider(thickness: 1, height: 1, color: Color(0xFFEEEEEE)),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Section
                      const Text(
                        'Progress Belajar',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Pantau perkembangan kompetensi dan\nmateri pembelajaran Anda',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Date
                      Text(
                        _getFormattedDate(),
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Status Cards (Gambar 1)
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: dataGambar1.length,
                        itemBuilder: (context, index) {
                          final data = dataGambar1[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: StatusCard(
                              title: data['title'],
                              count: data['count'],
                              subtitle: data['subtitle'],
                              subtitleColor: data['subtitleColor'],
                              iconColor: data['iconColor'],
                              icon: data['icon'],
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 20),

                      // Project Cards (Gambar 2)
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: dataGambar2.length,
                        itemBuilder: (context, index) {
                          final data = dataGambar2[index];
                          return ProjectCard(
                            title: data['title'],
                            subtitle: data['subtitle'],
                            kompetensi: data['kompetensi'],
                            guru: data['guru'],
                            tanggal: data['tanggal'],
                            status: data['status'],
                            catatanGuru: data['catatanGuru'],
                            catatanSiswa: data['catatanSiswa'],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getFormattedDate() {
    final now = DateTime.now();
    final days = ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];
    final months = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    ];
    
    return '${days[now.weekday % 7]}, ${now.day} ${months[now.month - 1]} ${now.year}';
  }
}
