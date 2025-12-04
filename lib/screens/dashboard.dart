import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> fiturList = [
      {
        "icon": Icons.apartment,
        "title": "Dirancang Khusus",
        "desc":
            "Memenuhi kebutuhan spesifik sekolah kami dengan fokus pada kemajuan siswa.",
      },
      {
        "icon": Icons.school,
        "title": "Efektif",
        "desc":
            "Memudahkan siswa dan guru melihat perkembangan secara real-time.",
      },
      {
        "icon": Icons.trending_up,
        "title": "Terintegrasi",
        "desc":
            "Pengajuan kompetensi siswa, validasi dan laporan perkembangan yang transparan",
      },
    ];

    List<Map<String, dynamic>> menuAplikasi = [
      {
        "icon": Icons.person_outline,
        "title": "Profil",
        "desc": "Lihat dan kelola profilmu di sini.",
        "route": "/profil", // opsional buat navigasi
      },
      {
        "icon": Icons.work_outline,
        "title": "Portofolio",
        "desc": "Lihat dan kelola portofolio kompetensimu di sini.",
        "route": "/portofolio",
      },
      {
        "icon": Icons.star_outline,
        "title": "Sertifikat",
        "desc": "Lihat dan unduh sertifikat kompetensimu di sini.",
        "route": "/sertifikat",
      },
    ];

    List<Map<String, dynamic>> menuAplikasi2 = [
      {
        "icon": Icons.menu_book_outlined,
        "title": "Jurnal Pembiasaan",
        "desc": "Catat dan pantau kegiatan pembiasaan harianmu.",
        "route": "/jurnal-pembiasaan",
      },
      {
        "icon": Icons.person_outline,
        "title": "Permintaan Saksi",
        "desc": "Lihat teman yang mengajukan permintaan saksi.",
        "route": "/permintaan-saksi",
      },
      {
        "icon": Icons.bar_chart_outlined,
        "title": "Progress",
        "desc": "Lihat kemajuan kompetensi dan pencapaian belajarmu.",
        "route": "/progress",
      },
      {
        "icon": Icons.warning_amber_outlined,
        "title": "Catatan Sikap",
        "desc": "Lihat catatan sikap dan perilaku dari guru.",
        "route": "/catatan-sikap",
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

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 HERO AREA (BACKGROUND + TEXT)
            Stack(
              children: [
                // Background SVG
                Container(
                  height: 250,
                  width: double.infinity,
                  child: SvgPicture.asset(
                    'assets/svg/bgsecondary.svg',
                    fit: BoxFit.fill,
                  ),
                ),

                // Text di tengah
                Positioned.fill(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Selamat Datang di Jurnalku",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Solusi cerdas untuk memantau perkembangan\nkompetensi siswa secara efektif",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 38),
              margin: const EdgeInsets.all(16),
              width: 400,
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade700, Colors.blue.shade900],
                ),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Apa itu JurnalKu?',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'Jurnalku adalah aplikasi cerdas yang membantu guru dan siswa dalam memantau dan mengelola kompetensi keahlian siswa secara efektif, terstruktur, dan real-time. Dengan fitur lengkap, proses pemantauan menjadi lebih mudah dan transparan. ',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            ListView.builder(
              itemCount: fiturList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final i = fiturList[index];
                return Padding(
                  padding: const EdgeInsetsGeometry.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    width: 400,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade100,
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Icon(
                            i['icon'],
                            size: 50,
                            color: Colors.blue.shade900,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            i['title'],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            i['desc'],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Colors.grey[500],
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            Padding(
              padding: EdgeInsets.only(
                right: 16,
                left: 16,
                top: 40,
                bottom: 20,
              ),

              child: Text(
                'MENU APLIKASI',
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                  color: Colors.grey[800],
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            ListView.builder(
              itemCount: menuAplikasi.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final i = menuAplikasi[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                  child: Container(
                    width: 400,
                    padding: const EdgeInsets.symmetric(
                      vertical: 34,
                      horizontal: 26,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(index == 0 ? 16 : 0),
                        topRight: Radius.circular(index == 0 ? 16 : 0),
                        bottomLeft: Radius.circular(
                          index == menuAplikasi.length - 1 ? 16 : 0,
                        ),
                        bottomRight: Radius.circular(
                          index == menuAplikasi.length - 1 ? 16 : 0,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade100,
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.blue.shade100,
                                child: Icon(
                                  i['icon'],
                                  size: 20,
                                  color: Colors.blue.shade700,
                                ),
                              ),
                            ),
                          ],
                        ),

                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                i['title'],
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                i['desc'],
                                style: GoogleFonts.poppins(
                                  color: Colors.grey[500],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Colors.blue.shade900,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            Padding(padding: const EdgeInsets.only(top: 20)),

             ListView.builder(
              itemCount: menuAplikasi2.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final i = menuAplikasi2[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                  child: Container(
                    width: 400,
                    padding: const EdgeInsets.symmetric(
                      vertical: 34,
                      horizontal: 26,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(index == 0 ? 16 : 0),
                        topRight: Radius.circular(index == 0 ? 16 : 0),
                        bottomLeft: Radius.circular(
                          index == menuAplikasi.length - 0 ? 16 : 0,
                        ),
                        bottomRight: Radius.circular(
                          index == menuAplikasi.length - 0 ? 16 : 0,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade100,
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.blue.shade100,
                                child: Icon(
                                  i['icon'],
                                  size: 20,
                                  color: Colors.blue.shade700,
                                ),
                              ),
                            ),
                          ],
                        ),

                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                i['title'],
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                i['desc'],
                                style: GoogleFonts.poppins(
                                  color: Colors.grey[500],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Colors.blue.shade900,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
