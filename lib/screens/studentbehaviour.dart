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
        'color-icon': Color(0xFF235380),
        'bg-icon':  Color(0xFFCFE0FA),
      },
      {
        'title': 'Dalam Perbaikan',
        'bg-card': 'FFF',
        'border-card': 'D9D9D9',
        'icon': Icons.flash_on_outlined,
        'color-icon': Color.fromARGB(255, 146, 129, 30),
        'bg-icon':  Color.fromARGB(255, 229, 223, 138),
      },
      {
        'title': 'Sudah Berubah',
        'bg-card': 'FFF',
        'border-card': 'D9D9D9',
        'icon': Icons.check_circle_outline,
        'color-icon': Color.fromARGB(255, 39, 168, 77),
        'bg-icon':  Color.fromARGB(255, 182, 241, 185),
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

            const SizedBox(width: 12),

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                SizedBox(width: 12),
                CircleAvatar(radius: 20, backgroundColor: Colors.grey[200]),
              ],
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsetsGeometry.symmetric(
                  horizontal: 15.0,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFF8E5), // kuning muda
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Color(0xFFFFCC75), // kuning border
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Color(0xFFFFA800),
                                  size: 26,
                                ),

                                SizedBox(width: 12),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
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
                                        "Jika Anda merasa ada catatan yang tidak sesuai atau keliru, "
                                        "silakan hubungi guru jurusan untuk mengajukan klarifikasi.",
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
                        ),
                      ],
                    ),

                    ListView.builder(
                      itemCount: notes.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final note = notes[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Color(
                                    int.parse("0xFF${notes[index]['bg-card']}"),
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Color(
                                      int.parse(
                                        "0xFF${notes[index]['border-card']}",
                                      ),
                                    ),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${notes[index]['title']}',
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
                                      backgroundColor: notes[index]['bg-icon'],
                                      child: Icon(
                                        notes[index]['icon'],
                                        color: notes[index]['color-icon'],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
