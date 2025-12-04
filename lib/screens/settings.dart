import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: false,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              const Icon(Icons.home, color: Colors.black),
              const SizedBox(width: 10),
            ]),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Farrel Muhammad Bintang",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      "PPLG XII-5",
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
              ],
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [     
              Text(
                "Pengaturan Akun",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38),
              ),
              Text(
                "Dashboard / Pengaturan Akun",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),       
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    // FOTO PROFIL
                    GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Text("Informasi Profil", style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          CircleAvatar(
                            radius: 55,
                            backgroundImage:
                                AssetImage("assets/images/profile.png"),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Klik untuk mengubah foto",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 25),

                    // ======================
                    // NAMA
                    // ======================
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Nama",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 5),
                    _buildThinTextField("Farrel Muhammad Bintang"),

                    SizedBox(height: 20),

                    // ======================
                    // NIS
                    // ======================
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "NIS",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 5),
                    _buildThinTextField("12309642"),

                    SizedBox(height: 20),

                    // ======================
                    // ROMBEL
                    // ======================
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Rombel",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 5),
                    _buildThinTextField("PPLG XII-5"),

                    SizedBox(height: 20),

                    // ======================
                    // RAYON
                    // ======================
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Rayon",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 5),
                    _buildThinTextField("Ciawi 6"),
                  ],
                ),
              ),

              SizedBox(height: 25),

              // ===========================
              //      CARD UBAH PASSWORD
              // ===========================
              _buildChangePasswordCard(),
            ],
          ),
        ),
      ),
    );
  }

  // ===========================================================
  // REUSABLE TEXTFIELD (border tipis)
  // ===========================================================
  Widget _buildThinTextField(String hint) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade100,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 0.3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue, width: 0.5),
        ),
      ),
    );
  }

  // ===========================================================
  // CARD UBAH PASSWORD (STATEFUL BUILDER)
  // ===========================================================
  Widget _buildChangePasswordCard() {
    return StatefulBuilder(
      builder: (context, setState) {
        bool oldPass = true;
        bool newPass = true;

        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ubah Kata Sandi",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 20),

              // ========= PASSWORD LAMA =========
              Text(
                "Kata Sandi Lama",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),

              TextField(
                obscureText: oldPass,
                decoration: InputDecoration(
                  hintText: "Masukkan password",
                  filled: true,
                  fillColor: Colors.grey.shade100,

                  suffixIcon: IconButton(
                    icon: Icon(
                      oldPass ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() => oldPass = !oldPass);
                    },
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey, width: 0.3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue, width: 0.5),
                  ),
                ),
              ),

              SizedBox(height: 5),
              Text(
                "Masukkan kata sandi lama anda",
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),

              SizedBox(height: 20),

              // ========= PASSWORD BARU =========
              Text(
                "Kata Sandi Baru",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),

              TextField(
                obscureText: newPass,
                decoration: InputDecoration(
                  hintText: "Masukkan password",
                  filled: true,
                  fillColor: Colors.grey.shade100,

                  suffixIcon: IconButton(
                    icon: Icon(
                      newPass ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() => newPass = !newPass);
                    },
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey, width: 0.3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue, width: 0.5),
                  ),
                ),
              ),

              SizedBox(height: 25),

              // ========= BUTTON SIMPAN =========
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0A3BAA),
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Simpan Perubahan",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
