import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentCardData extends StatelessWidget {
  final String name;
  final String info;
  final int portofolioCount;
  final int certificateCount;

  const StudentCardData({
    super.key,
    required this.name,
    required this.info,
    required this.portofolioCount,
    required this.certificateCount,
  });

  static const Color primaryBlue = Color(0xFF1E88E5);
  static const Color darkBlue = Color(0xFF1565C0);
  static const Color lightBlue = Color(0xFF64B5F6);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: primaryBlue.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: lightBlue.withOpacity(0.2),
                  child: Text(
                    name[0].toUpperCase(),
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: primaryBlue,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: darkBlue,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        info,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.work_outline, size: 18, color: primaryBlue),
                  const SizedBox(width: 6),
                  Text(
                    '$portofolioCount Portfolio',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Icon(Icons.verified_outlined, size: 18, color: primaryBlue),
                  const SizedBox(width: 6),
                  Text(
                    '$certificateCount Sertifikat',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlue,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Lihat Detail',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward, size: 18),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}