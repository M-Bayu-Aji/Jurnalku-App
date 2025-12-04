import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jurnalku_app/widgets/navbar.dart';

class Studentbehaviour extends StatefulWidget {
  const Studentbehaviour({super.key});

  @override
  State<Studentbehaviour> createState() => _StudentbehaviourState();
}

class _StudentbehaviourState extends State<Studentbehaviour> {
  // summary cards
  final List<Map<String, dynamic>> notes = [
    {
      'title': 'Total Catatan',
      'bg-card': 'FFF',
      'border-card': 'D9D9D9',
      'icon': Icons.folder_copy_outlined,
      'color-icon': const Color(0xFF235380),
      'bg-icon': const Color(0xFFCFE0FA),
    },
    {
      'title': 'Dalam Perbaikan',
      'bg-card': 'FFF',
      'border-card': 'D9D9D9',
      'icon': Icons.flash_on_outlined,
      'color-icon': const Color.fromARGB(255, 146, 129, 30),
      'bg-icon': const Color.fromARGB(255, 229, 223, 138),
    },
    {
      'title': 'Sudah Berubah',
      'bg-card': 'FFF',
      'border-card': 'D9D9D9',
      'icon': Icons.check_circle_outline,
      'color-icon': const Color.fromARGB(255, 39, 168, 77),
      'bg-icon': const Color.fromARGB(255, 182, 241, 185),
    },
  ];
  final List<Map<String, dynamic>> _entries = [
    {
      "kategori": "Kerjasama",
      "catatan":
          "Kurang berkontribusi dalam diskusi kelompok praktikum, cenderung pasif.",
      "status": "Diproses",
      "tanggal_1": "02 Mar 2025",
      "tanggal_2": "04 Mar 2025",
      "dilaporkan": "Guru Mata Pelajaran",
      "aksi": "Lihat",
    },
    {
      "kategori": "Inisiatif",
      "catatan":
          "Mengajukan ide perbaikan tugas kelompok dan membantu mengorganisir pembagian tugas.",
      "status": "Telah Ditindaklanjuti",
      "tanggal_1": "15 Mar 2025",
      "tanggal_2": "16 Mar 2025",
      "dilaporkan": "Pembimbing Praktikum",
      "aksi": "Lihat",
    },
    {
      "kategori": "Sikap",
      "catatan":
          "Menggunakan bahasa yang kurang sopan kepada teman saat diskusi kelas; perlu pembinaan.",
      "status": "Selesai",
      "tanggal_1": "20 Mar 2025",
      "tanggal_2": "21 Mar 2025",
      "dilaporkan": "Wali Kelas",
      "aksi": "Lihat",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final entriesList = _entries;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(72),
        child: SafeArea(
          child: NavbarWidget(
            nama: 'M.Azriel Danu Rahman',
            kelas: 'PPLG XII - 5',
            avatarPath: 'assets/images/avatar.png',
          ),
        ),
      ),

      // main content
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title
            Text(
              'Catatan Sikap saya',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.grey[900],
              ),
            ),
            Text(
              'Lihat catatan sikap dan perilaku yang telah dilaporkan',
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
            ),

            const SizedBox(height: 15),

            // alert
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8E5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFFFCC75), width: 1.5),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.warning_amber_rounded,
                    color: Color(0xFFFFA800),
                    size: 26,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Perhatian",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFB87B00),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Jika Anda merasa ada catatan yang tidak sesuai atau keliru, silakan hubungi guru jurusan untuk mengajukan klarifikasi.",
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.4,
                            color: Color(0xFF6B4F00),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // summary cards
            ListView.builder(
              itemCount: notes.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final note = notes[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(int.parse("0xFF${note['bg-card']}")),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Color(int.parse("0xFF${note['border-card']}")),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              note['title'],
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              '0',
                              style: GoogleFonts.poppins(
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[900],
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: note['bg-icon'],
                          child: Icon(note['icon'], color: note['color-icon']),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            // MOBILE-FRIENDLY: dropdown filter + expandable list
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daftar Catatan',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // list of entries (expandable) OR empty state
                    if (entriesList.isEmpty) ...[
                      const SizedBox(height: 20),
                      Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              color: Colors.grey[600],
                              size: 46,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Tidak ada catatan',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Belum ada catatan sikap yang dilaporkan',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ] else ...[
                      const SizedBox(height: 8),
                      ListView.builder(
                        itemCount: entriesList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, idx) {
                          final entry = entriesList[idx];
                          final catatan = (entry['catatan'] ?? '') as String;
                          final ringkasan = catatan.length > 80
                              ? '${catatan.substring(0, 80)}...'
                              : catatan;

                          return ExpansionTile(
                            tilePadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            title: Text(
                              entry['kategori'] ?? 'Catatan',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              ringkasan,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Colors.grey[600],
                              ),
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                  vertical: 8,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Catatan : ',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      catatan,
                                      style: GoogleFonts.poppins(
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    const SizedBox(height: 10),

                                    // Status
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Status : ',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '${entry['status'] ?? '-'}',
                                            style: GoogleFonts.poppins(
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),

                                    // Dilaporkan
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Dilaporkan : ',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '${entry['dilaporkan'] ?? '-'}',
                                            style: GoogleFonts.poppins(
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),

                                    // Tanggal
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Tanggal : ',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '${entry['tanggal_1'] ?? '-'} — ${entry['tanggal_2'] ?? '-'}',
                                            style: GoogleFonts.poppins(
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            // TODO: navigate to detail page or show dialog
                                          },
                                          icon: const Icon(
                                            Icons.remove_red_eye,
                                            size: 16,
                                          ),
                                          label: const Text('Lihat'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
