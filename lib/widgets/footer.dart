import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: const BoxDecoration(
        color: Color(0xFF003D8F),
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.phone, color: Colors.white, size: 28),
              SizedBox(width: 20),
              Icon(Icons.camera_alt, color: Colors.white, size: 28),
              SizedBox(width: 20),
              Icon(Icons.link, color: Colors.white, size: 28),
              SizedBox(width: 20),
              Icon(Icons.play_circle_fill, color: Colors.white, size: 28),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            "© GEN-28 PPLG SMK Wikrama Bogor. All Rights Reserved.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
