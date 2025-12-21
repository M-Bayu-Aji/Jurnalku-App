import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../services/profile.dart';
import '../services/login.dart';
import '../model/profile.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({super.key});

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  final ProfileService _profileService = ProfileService();
  final LoginService _loginService = LoginService();
  
  Profile? _profile;
  bool _isLoading = true;
  String _nama = '';
  String _kelas = '';
  String _avatarUrl = '';

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  String _getInitials(String name) {
    if (name.isEmpty) return '?';
    List<String> names = name.split(' ');
    if (names.length == 1) return names[0].substring(0, 1).toUpperCase();
    return '${names[0].substring(0, 1)}${names[names.length - 1].substring(0, 1)}'.toUpperCase();
  }

  Color _getAvatarColor(String name) {
    int hash = name.hashCode;
    List<Color> colors = [
      Colors.blue.shade700,
      Colors.green.shade700,
      Colors.orange.shade700,
      Colors.purple.shade700,
      Colors.red.shade700,
      Colors.teal.shade700,
      Colors.indigo.shade700,
      Colors.pink.shade700,
    ];
    return colors[hash.abs() % colors.length];
  }

  Future<void> _loadProfile() async {
    final result = await _profileService.getProfile();
    
    if (mounted) {
      setState(() {
        _isLoading = false;
        if (result['success']) {
          _profile = result['data'] as Profile;
          _nama = _profile!.data.name;
          _kelas = _profile!.data.rombel;
          _avatarUrl = _profile!.data.image;
          
          // Debug log
          print('Profile loaded: $_nama');
          print('Avatar URL: $_avatarUrl');
        } else {
          print('Failed to load profile: ${result['message']}');
        }
      });
    }
  }
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
          _isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          _nama,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          _kelas,
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
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _getAvatarColor(_nama),
                        ),
                        child: ClipOval(
                          child: _avatarUrl.isNotEmpty &&
                                  !_avatarUrl.contains('placehold.co')
                              ? CachedNetworkImage(
                                  imageUrl: _avatarUrl,
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Center(
                                    child: Text(
                                      _getInitials(_nama),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) {
                                    return Center(
                                      child: Text(
                                        _getInitials(_nama),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : Center(
                                  child: Text(
                                    _getInitials(_nama),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                        ),
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
              onPressed: () async {
                // Logout dan hapus data
                await _loginService.logout();
                if (!context.mounted) return;
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
