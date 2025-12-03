import 'package:flutter/material.dart';
import 'package:jurnalku_app/widgets/navbar.dart';

class PermintaanSaksi extends StatelessWidget {
  const PermintaanSaksi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          NavbarWidget(
            nama: "Farrel Muhammad Bintang",
            kelas: "PPLG XII-5",
            avatarPath: "assets/images/profile.png",
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Permintaan saksi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38)),
              Text("Kelola permintaan menjadi saksi dari siswa lain", style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(67, 94, 193, 243),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "kamis, 20 November 2025",
                  style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(height: 20),

              // ============================
              // TABEL + EMPTY STATE
              // ============================
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // HEADER TABLE
                      Row(
                        children: [
                          _headerCell("PENGIRIM"),
                          _headerCell("TANGGAL"),
                          _headerCell("KONFIRMASI"),
                        ],
                      ),

                      const Divider(),
                      const SizedBox(height: 40),

                      // EMPTY STATE
                      Column(
                        children: const [
                          Icon(Icons.groups_rounded, size: 60, color: Colors.grey),
                          SizedBox(height: 12),
                          Text(
                            "Belum ada permintaan",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Belum ada yang mengirim permintaan saksi kepada Anda",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi header cell
  Widget _headerCell(String title) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Colors.black,
              width: 1,
            ),
            right: BorderSide(
              color: Colors.black,
              width: 1,
            )
          )
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
