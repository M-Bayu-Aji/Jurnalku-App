import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Studentbehaviour extends StatelessWidget {
  const Studentbehaviour({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> notes = [
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        toolbarHeight: 60,
        shadowColor: Colors.black.withOpacity(0.6),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.home, color: Colors.grey[600], size: 24),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'M.Azriel Danu Rahman',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    Text(
                      'PPLG XII - 5',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                CircleAvatar(radius: 20, backgroundColor: Colors.grey[200]),
              ],
            ),
          ],
        ),
      ),

      // ⬇️ Semua scroll diletakkan di sini
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 TITLE
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

            // 🔹 ALERT BOX
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

            // 🔹 NOTE CARDS
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

            // 🔹 TABLE HEADER (SCROLL HORIZONTAL)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Row(
                      children: [
                        tableHeader('NO'),
                        tableHeader('KATEGORI'),
                        tableHeader('CATATAN'),
                        tableHeader('STATUS'),
                        tableHeader('DILAPORKAN'),
                        tableHeader('UPDATE TERAKHIR'),
                        tableHeader('AKSI'),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.grey[600],
                            size: 46,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Column(
                              children: [
                                Text(
                                  'Tidak ada catatan',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Text(
                                    'Belum ada catatan sikap yang dilaporkan',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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

  // 🔹 Helper biar header tabel rapi
  Widget tableHeader(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: Colors.grey[600],
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
