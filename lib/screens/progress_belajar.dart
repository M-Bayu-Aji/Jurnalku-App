import 'package:flutter/material.dart';
// Pastikan import ini tetap ada karena ini memanggil AppBar buatan Anda
import 'package:jurnalku_app/widgets/app_bar.dart'; 

class ProgressBelajar extends StatelessWidget {
  const ProgressBelajar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background putih bersih
      // --- BAGIAN APP BAR (Milik Anda) ---
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: const AppBarWidget(),
      ),
      
      // --- BAGIAN BODY (Kode dari Saya) ---
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          // 1. Judul Halaman
          const Text(
            'Progress Belajar',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Pantau perkembangan kompetensi dan materi pembelajaran Anda',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),

          // 2. Tanggal (Date Chip)
          UnconstrainedBox(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFEBF5FF), // Background biru muda
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Thursday, 20 November 2025',
                style: TextStyle(
                  color: Color(0xFF1C64F2), // Teks biru
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // 3. Kartu Ringkasan (Statistik)
          _buildSummaryCard(
            title: 'Total Pengajuan',
            value: '0',
            statusText: 'Semua status',
            statusColor: Colors.blue,
            icon: Icons.check_circle_outline,
            iconColor: Colors.blue,
            iconBgColor: Colors.blue.shade50,
          ),
          const SizedBox(height: 16),

          _buildSummaryCard(
            title: 'Halaman Ini',
            value: '0',
            statusText: 'Data ditampilkan',
            statusColor: Colors.green,
            icon: Icons.calendar_today_outlined,
            iconColor: Colors.green,
            iconBgColor: Colors.green.shade50,
          ),
          const SizedBox(height: 16),

          _buildSummaryCard(
            title: 'Status Pending',
            value: '0',
            statusText: 'Perlu validasi',
            statusColor: Colors.orange,
            icon: Icons.access_time_rounded,
            iconColor: Colors.orange,
            iconBgColor: Colors.orange.shade50,
          ),

          const SizedBox(height: 32),

          // 4. Daftar Mata Pelajaran (List Bawah)
          _buildSubjectCard(
            title: 'Project Work',
            subtitle: 'Kompetensi dan materi pembelajaran',
          ),
          const SizedBox(height: 16),

          _buildSubjectCard(
            title: 'Mobile Apps',
            subtitle: 'Kompetensi dan materi pembelajaran',
          ),
          const SizedBox(height: 16),

          _buildSubjectCard(
            title: 'UKK (Uji Kompetensi Keahlian)',
            subtitle: 'Kompetensi dan materi pembelajaran',
          ),
          const SizedBox(height: 16),

          _buildSubjectCard(
            title: 'GIM',
            subtitle: 'Kompetensi dan materi pembelajaran',
          ),
          
          // Padding bawah tambahan agar scroll tidak mentok
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  // --- HELPER WIDGETS (Supaya kodingan utama rapi) ---

  // Widget untuk membuat Kartu Statistik (yang ada icon bulatnya)
  Widget _buildSummaryCard({
    required String title,
    required String value,
    required String statusText,
    required Color statusColor,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.circle, size: 10, color: statusColor),
                    const SizedBox(width: 8),
                    Text(
                      statusText,
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk membuat Kartu Mata Pelajaran (yang background abu-abu)
  Widget _buildSubjectCard({
    required String title,
    required String subtitle,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB), // Warna abu-abu sangat muda (sesuai gambar)
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey.shade300),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('KOMPETENSI', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                Text('GURU', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                Text('TANGGAL', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}