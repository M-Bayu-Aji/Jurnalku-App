import 'package:flutter/material.dart';
import 'package:jurnalku_app/widgets/item_profile_card.dart';

class PortfolioTab extends StatelessWidget {
  const PortfolioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: ItemProfileCard(title: "Portfolio", icon: "💼", onPressed: () {}),
        ),
      ],
    );
  }
}