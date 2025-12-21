import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/login.dart';

class LoginService {
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  Future<Map<String, dynamic>> login({
    required String nis,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'nis': nis,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        
        final loginResponse = StudentLoginResponse.fromJson(responseData);
        
        await saveToken(loginResponse.token);
        
        await saveUserData(loginResponse.data);

        return {
          'success': true,
          'message': 'Login berhasil',
          'data': loginResponse,
        };
      } else {
        final Map<String, dynamic> errorData = jsonDecode(response.body);
        return {
          'success': false,
          'message': errorData['message'] ?? 'Login gagal',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Terjadi kesalahan: ${e.toString()}',
      };
    }
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<void> saveUserData(Data userData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('nis', userData.nis);
    await prefs.setString('name', userData.name);
    await prefs.setString('rayon', userData.rayon);
    await prefs.setString('rombel', userData.rombel);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final nis = prefs.getInt('nis');
    final name = prefs.getString('name');
    final rayon = prefs.getString('rayon');
    final rombel = prefs.getString('rombel');

    if (nis != null && name != null && rayon != null && rombel != null) {
      return {
        'nis': nis,
        'name': name,
        'rayon': rayon,
        'rombel': rombel,
      };
    }
    return null;
  }

  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('nis');
    await prefs.remove('name');
    await prefs.remove('rayon');
    await prefs.remove('rombel');
  }
}
