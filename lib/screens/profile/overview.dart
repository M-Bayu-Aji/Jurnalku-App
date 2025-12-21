import 'package:flutter/material.dart';
import 'package:jurnalku_app/widgets/item_profile_card.dart';
import 'package:jurnalku_app/widgets/document_profile.card.dart';
import '../../model/profile.dart';

class OverviewTab extends StatelessWidget {
  final Profile profile;
  final VoidCallback? onPortfolioTap;
  final VoidCallback? onCertificateTap;

  const OverviewTab({
    super.key, 
    required this.profile,
    this.onPortfolioTap,
    this.onCertificateTap,
  });

  @override

  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: ItemProfileCard(
            title: "Portfolio", 
            icon: "💼", 
            onPressed: onPortfolioTap ?? () {},
            count: profile.data.portfolio,
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: ItemProfileCard(
            title: "Sertifikat",  
            icon: "🏆", 
            onPressed: onCertificateTap ?? () {},
            count: profile.data.certificate,
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              DocumentProfileCard(
                title: "Curriculum Vitae",
                subtitle: "Dokumen CV Siswa",
                iconButton: Icons.folder,
                labelButton: "Lihat CV",
                buttonColor: Colors.blue[800]!,
                onPressed: () {},
              ),
              const Divider(),
              DocumentProfileCard(
                title: "Kartu Pelajar",
                subtitle: "Kartu Identitas Siswa",
                iconButton: Icons.folder,
                labelButton: "Lihat Kartu Pelajar",
                buttonColor: Colors.green[600]!,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}