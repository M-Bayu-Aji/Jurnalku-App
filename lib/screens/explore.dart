import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  static const Color primaryBlue = Color(0xFF1E88E5);
  static const Color darkBlue = Color(0xFF1565C0);
  static const Color lightBlue = Color(0xFF64B5F6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.book,
                color: primaryBlue,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Jurnalku',
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: darkBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Dashboard',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            _buildContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/explore_header.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken,
          ),
        ),
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(30.0),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(30.0),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    'Direktori Siswa',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    'Temukan dan jelajahi profil siswa SMK Wikrama Bogor',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                
                _buildSearchCard(context),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchCard(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Cari nama siswa, NIS, atau rombel...',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey[400],
                ),
                prefixIcon: Icon(Icons.search, color: primaryBlue),
                filled: true,
                fillColor: Colors.grey[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.filter_list, size: 18, color: Colors.grey[700]),
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Filter Lanjutan',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(Icons.arrow_drop_down, color: Colors.grey[700]),
                      ],
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      side: BorderSide(color: Colors.grey[300]!),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Cari',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Menampilkan 1 - 12 dari 538 siswa',
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 20),
          
          _buildStudentCard(
            context: context,
            name: 'M. Azriel Danu Rahman',
            info: '12309717 | PPLG XII-5 | Cic 9',
            portfolioCount: 1,
            certificateCount: 13,
          ),
          const SizedBox(height: 16),
          _buildStudentCard(
            context: context,
            name: 'Muhammad Bayu Aji Sutisna Putra',
            info: '12309839 | PPLG XII-2 | Cic 8',
            portfolioCount: 5,
            certificateCount: 8,
          ),
          const SizedBox(height: 16),
          _buildStudentCard(
            context: context,
            name: 'Farrel Muhammad Bintang',
            info: '12309642 | PPLG XII-5 | Cia 6',
            portfolioCount: 3,
            certificateCount: 10,
          ),
        ],
      ),
    );
  }

  Widget _buildStudentCard({
    required BuildContext context,
    required String name,
    required String info,
    required int portfolioCount,
    required int certificateCount,
  }) {
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
                    '$portfolioCount Portfolio',
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