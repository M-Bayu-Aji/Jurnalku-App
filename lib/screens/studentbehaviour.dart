import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Studentbehaviour extends StatelessWidget {
  const Studentbehaviour({super.key});

  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsetsGeometry.symmetric(horizontal: 15.0, vertical: 10),
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
                        Padding(padding: const EdgeInsets.symmetric(vertical: 15),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        fontSize: 14,
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
