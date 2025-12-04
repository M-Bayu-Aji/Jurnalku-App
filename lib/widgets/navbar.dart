import 'package:flutter/material.dart';

class NavbarWidget extends StatefulWidget {
  final String nama;
  final String kelas;
  final String avatarPath;

  const NavbarWidget({
    super.key,
    required this.nama,
    required this.kelas,
    required this.avatarPath,
  });

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.home_outlined, color: Colors.grey[700], size: 26),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/explore');
            },
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.nama,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.kelas,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              PopupMenuButton<String>(
                offset: const Offset(0, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(widget.avatarPath),
                ),
                onSelected: (value) {
                  switch (value) {
                    case 'dashboard':
                      Navigator.pushNamed(context, '/dashboard');
                      break;
                    case 'profil':
                      Navigator.pushNamed(context, '/profile');
                      break;
                    case 'jelajahi':
                      Navigator.pushNamed(context, '/explore');
                      break;
                    case 'jurnal':
                      Navigator.pushNamed(context, '/jurnal-pembiasaan');
                      break;
                    case 'permintaan':
                      Navigator.pushNamed(context, '/permintaan-saksi');
                      break;
                    case 'progress':
                      Navigator.pushNamed(context, '/progress-siswa');
                      break;
                    case 'catatan':
                      Navigator.pushNamed(context, '/catatan-sikap');
                      break;
                    case 'panduan':
                      Navigator.pushNamed(context, '/user-guide');
                      break;
                    case 'pengaturan':
                      Navigator.pushNamed(context, '/settings');
                      break;
                    case 'logout':
                      _showLogoutDialog(context);
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => [
                  _buildMenuItem(Icons.dashboard_outlined, 'Dashboard', 'dashboard'),
                  _buildMenuItem(Icons.person_outline, 'Profil', 'profil'),
                  _buildMenuItem(Icons.explore_outlined, 'Jelajahi', 'jelajahi'),
                  _buildMenuItem(Icons.book_outlined, 'Jurnal Pembiasaan', 'jurnal'),
                  _buildMenuItem(Icons.people_outline, 'Permintaan Saksi', 'permintaan'),
                  _buildMenuItem(Icons.bar_chart_outlined, 'Progress', 'progress'),
                  _buildMenuItem(Icons.warning_outlined, 'Catatan Sikap', 'catatan'),
                  _buildMenuItem(Icons.help_outline, 'Panduan Penggunaan', 'panduan'),
                  _buildMenuItem(Icons.settings_outlined, 'Pengaturan Akun', 'pengaturan'),
                  const PopupMenuDivider(),
                  _buildMenuItem(Icons.logout, 'Log Out', 'logout', color: Colors.red),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  PopupMenuItem<String> _buildMenuItem(IconData icon, String text, String value, {Color? color}) {
    return PopupMenuItem<String>(
      value: value,
      height: 45,
      child: Row(
        children: [
          Icon(icon, size: 20, color: color ?? Colors.grey[700]),
          const SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: color ?? Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text('Konfirmasi Logout'),
          content: const Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Batal',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Logout', style: TextStyle(
                color: Colors.white,
              ),),
            ),
          ],
        );
      },
    );
  }
}
