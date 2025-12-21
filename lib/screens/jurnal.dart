import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jurnalku_app/widgets/navbar.dart';

class Jurnal extends StatelessWidget {
  const Jurnal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: false,

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(72),
        child: SafeArea(
          child: NavbarWidget(),
        ),
      ),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jurnal Pembiasaan",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                  Text("Desember - 2025", style: TextStyle(fontSize: 25)),
                  SizedBox(height: 20),

                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back, color: Colors.white),
                            const SizedBox(width: 10),
                            Text(
                              "Bulan\nSebelumnya",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Bulan\nSelanjutnya",
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(width: 10),
                            Icon(Icons.arrow_forward, color: Colors.white),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  Text(
                    "A. Pembiasaan harian",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.circle, color: Colors.green, size: 20),
                      SizedBox(width: 2),
                      Text("Sudah diisi"),
                      SizedBox(width: 10),
                      Icon(Icons.circle, color: Colors.grey.shade200, size: 20),
                      SizedBox(width: 2),
                      Text("Belum diisi"),
                      SizedBox(width: 10),
                      Icon(Icons.circle, color: Colors.red, size: 20),
                      SizedBox(width: 2),
                      Text("Tidak diisi"),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final day = index + 1;
                final isRed = day == 1 || day == 2 || day == 3;
                final isLight = day == 4;

                return Container(
                  decoration: BoxDecoration(
                    color: isRed
                        ? Colors.red.shade50
                        : isLight
                        ? Colors.grey.shade200
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          day.toString().padLeft(2, '0'),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14, // ukuran teks juga diperkecil sedikit
                            color: isRed ? Colors.red : Colors.black54,
                          ),
                        ),
                      ),

                      // Icon X hanya untuk merah (tanggal 1)
                      if (isRed)
                        const Positioned(
                          top: 4,
                          left: 4,
                          child: Icon(Icons.close, size: 14, color: Colors.red),
                        ),
                    ],
                  ),
                );
              }, childCount: 31),

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6, // ukuran lebih kecil
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
                childAspectRatio: 1.2, // diperkecil
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "B. Pekerjaan yang dilakukan",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "+ Tambah Pekerjaan",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ExpansionTile(
                    collapsedBackgroundColor: Colors.grey.shade300,
                    backgroundColor: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade500),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),

                    title: Row(
                      children: [
                        Text(
                          "Pekerjaan 1",
                          style: GoogleFonts.inter(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.circle, color: Colors.green, size: 20),
                      ],
                    ),
                    children: [
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Saksi = Nur Rizky"),
                      ),
                      ListTile(
                        leading: Icon(Icons.date_range),
                        title: Text("4/12/2025"),
                      ),
                      ListTile(
                        leading: Icon(Icons.work),
                        title: Text("Melanjutkan slicing Jurnalku"),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.circle, color: Colors.green, size: 20),
                      SizedBox(width: 2),
                      Text("Sudah di cek"),
                      SizedBox(width: 10),
                      Icon(Icons.circle, color: Colors.yellow, size: 20),
                      SizedBox(width: 2),
                      Text("Belum di cek"),
                      SizedBox(width: 10),
                      Icon(Icons.circle, color: Colors.red, size: 20),
                      SizedBox(width: 2),
                      Text("Menolak"),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Text(
                        "C. Materi yang dipelajari",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "+ Tambah Materi",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ExpansionTile(
                    collapsedBackgroundColor: Colors.grey.shade300,
                    backgroundColor: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade500),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),

                    title: Row(
                      children: [
                        Text(
                          "Materi 1",
                          style: GoogleFonts.inter(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.circle, color: Colors.yellow, size: 20),
                      ],
                    ),
                    children: [
                      ListTile(
                        leading: Icon(Icons.book),
                        title: Text("Cara menggunakan ExpansionTile flutter"),
                      ),
                      ListTile(
                        leading: Icon(Icons.date_range),
                        title: Text("4/12/2025"),
                      ),
                      ListTile(
                        leading: Icon(Icons.notes),
                        title: Text("Semoga di nilai"),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.circle, color: Colors.green, size: 20),
                      SizedBox(width: 2),
                      Text("Approved"),
                      SizedBox(width: 10),
                      Icon(Icons.circle, color: Colors.yellow, size: 20),
                      SizedBox(width: 2),
                      Text("Pending"),
                      SizedBox(width: 10),
                      Icon(Icons.circle, color: Colors.red, size: 20),
                      SizedBox(width: 2),
                      Text("Decline"),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    "D. Poin",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Kategori Poin",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  SizedBox(height: 5),
                  ExpansionTile(
                    collapsedBackgroundColor: Colors.grey.shade300,
                    backgroundColor: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade500),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),

                    title: Row(
                      children: [
                        Text(
                          "(5) Mengerjakan project/adanya update\nprogress belajar",
                          style: GoogleFonts.inter(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
                    children: [
                      ListTile(title: Text("M1 [0]")),
                      ListTile(title: Text("M2 [0]")),
                      ListTile(title: Text("M3 [0]")),
                      ListTile(title: Text("M4 [0]")),
                    ],
                  ),
                  SizedBox(height: 10),
                  ExpansionTile(
                    collapsedBackgroundColor: Colors.grey.shade300,
                    backgroundColor: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade500),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),

                    title: Row(
                      children: [
                        Text(
                          "(1-5) poin dari pertanyaan atau\nlaporan pengetahuan materi",
                          style: GoogleFonts.inter(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
                    children: [
                      ListTile(title: Text("M1 [0]")),
                      ListTile(title: Text("M2 [0]")),
                      ListTile(title: Text("M3 [0]")),
                      ListTile(title: Text("M4 [0]")),
                    ],
                  ),
                  SizedBox(height: 10),
                  ExpansionTile(
                    collapsedBackgroundColor: Colors.grey.shade300,
                    backgroundColor: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade500),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),

                    title: Row(
                      children: [
                        Text(
                          "Jumlah poin minggu ini",
                          style: GoogleFonts.inter(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
                    children: [
                      ListTile(title: Text("M1 [0]")),
                      ListTile(title: Text("M2 [0]")),
                      ListTile(title: Text("M3 [0]")),
                      ListTile(title: Text("M4 [0]")),
                    ],
                  ),
                  SizedBox(height: 10),
                  ExpansionTile(
                    collapsedBackgroundColor: Colors.grey.shade300,
                    backgroundColor: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade500),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),

                    title: Row(
                      children: [
                        Text(
                          "Jumlah poin ceklist pembiasaan (semua minggu)",                          
                          style: GoogleFonts.inter(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
                    children: [ListTile(title: Text("[0]"))],
                  ),
                  SizedBox(height: 10),
                  ExpansionTile(
                    collapsedBackgroundColor: Colors.grey.shade300,
                    backgroundColor: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade500),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),

                    title: Row(
                      children: [
                        Text(
                          "Jumlah keseluruhan poin (semua minggu)",
                          style: GoogleFonts.inter(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
                    children: [ListTile(title: Text("[0]"))],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
