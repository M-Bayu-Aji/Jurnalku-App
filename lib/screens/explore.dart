// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jurnalku_app/widgets/footer.dart';
import 'package:jurnalku_app/widgets/student_card_data.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  static const Color primaryBlue = Color(0xFF1E88E5);
  static const Color darkBlue = Color(0xFF1565C0);
  // lightBlue not currently used

  static final List<Map<String, dynamic>> students = [
    {
      'name': 'M. Azriel Danu Rahman',
      'info': '12309717 | PPLG XII-5 | Cic 9',
      'portfolioCount': 1,
      'certificateCount': 13,
    },
    {
      'name': 'Muhammad Bayu Aji Sutisna Putra',
      'info': '12309839 | PPLG XII-2 | Cic 8',
      'portfolioCount': 5,
      'certificateCount': 8,
    },
    {
      'name': 'Farrel Muhammad Bintang',
      'info': '12309642 | PPLG XII-5 | Cia 6',
      'portfolioCount': 3,
      'certificateCount': 10,
    },
  ];

  bool _showAdvancedFilter = false;
  String? _selectedRombel;
  String? _selectedRayon;
  String? _selectedJurusan;

  final List<String> _rombelOptions = [
    'Semua Rombel',
    'PPLG XII-4',
    'PPLG XII-5',
  ];
  final List<String> _rayonOptions = [
    'Semua Rayon',
    'Cia 6',
    'Cic 8',
    'Cic 9',
  ];
  final List<String> _jurusanOptions = [
    'Semua Jurusan',
    'PPLG',
    'TJKT',
    "DKV",
    "HTL",
    "KLN",
    "PMN",
    "MPLB"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: primaryBlue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.book,
                color: primaryBlue,
                size: 20,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'Jurnalku',
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: darkBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard');
              },
              label: Text(
                'Dashboard',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 77, 140),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
            const FooterWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/explore_header.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Direktori Siswa',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Temukan profil siswa SMK Wikrama',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildSearchCard(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchCard(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search field
            TextField(
              decoration: InputDecoration(
                hintText: 'Cari siswa...',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 13,
                  color: Colors.grey[400],
                ),
                prefixIcon: const Icon(Icons.search, size: 20),
                filled: true,
                fillColor: Colors.grey[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Buttons row
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _showAdvancedFilter = !_showAdvancedFilter;
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      side: BorderSide(color: primaryBlue.withOpacity(0.25)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.filter_list, size: 16, color: primaryBlue),
                        const SizedBox(width: 8),
                        Text(
                          'Filter Lanjutan',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: primaryBlue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          _showAdvancedFilter ? Icons.expand_less : Icons.expand_more,
                          color: primaryBlue,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(
                      'Cari',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Advanced filter panel
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        DropdownButtonFormField<String>(
                          value: _selectedRombel ?? _rombelOptions[0],
                          isDense: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[100],
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                          ),
                          items: _rombelOptions.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                          onChanged: (v) => setState(() => _selectedRombel = v),
                        ),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          value: _selectedRayon ?? _rayonOptions[0],
                          isDense: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[100],
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                          ),
                          items: _rayonOptions.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                          onChanged: (v) => setState(() => _selectedRayon = v),
                        ),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          initialValue: _selectedJurusan ?? _jurusanOptions[0],
                          isDense: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[100],
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                          ),
                          items: _jurusanOptions.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                          onChanged: (v) => setState(() => _selectedJurusan = v),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  // apply filter: implement actual filtering later
                                  setState(() {
                                    _showAdvancedFilter = false;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryBlue,
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                                child: Text('Terapkan Filter', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: Colors.white)),
                              ),
                            ),
                            const SizedBox(width: 8),
                            SizedBox(
                              width: 120,
                              child: OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedRombel = _rombelOptions[0];
                                    _selectedRayon = _rayonOptions[0];
                                    _selectedJurusan = _jurusanOptions[0];
                                  });
                                },
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                                child: Text('Reset', style: GoogleFonts.poppins()),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              crossFadeState: _showAdvancedFilter ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 200),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: primaryBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '${students.length} siswa',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: primaryBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: StudentCardData(
                  name: student['name'] as String,
                  info: student['info'] as String,
                  portofolioCount: student['portfolioCount'] as int,
                  certificateCount: student['certificateCount'] as int,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}