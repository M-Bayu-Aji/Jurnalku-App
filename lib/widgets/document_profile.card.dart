import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DocumentProfileCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData iconButton;
  final String labelButton;
  final Color buttonColor;
  final VoidCallback onPressed;

  const DocumentProfileCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconButton,
    required this.labelButton,
    required this.buttonColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.grey[100],
            child: Icon(iconButton, color: Colors.grey[700]),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(subtitle, style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey)),
              ],
            ),
          ),
          ElevatedButton.icon(
            onPressed: onPressed,
            icon: const Icon(Icons.remove_red_eye, size: 16, color: Colors.white),
            label: Text(labelButton, style: GoogleFonts.poppins(fontSize: 13, color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }
}
