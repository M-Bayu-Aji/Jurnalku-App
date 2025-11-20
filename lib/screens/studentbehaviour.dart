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
    );
  }
}
