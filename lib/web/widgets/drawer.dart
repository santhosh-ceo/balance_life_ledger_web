import 'package:flutter/material.dart';
import '../constants/colors.dart';

class BalanceDrawer extends StatelessWidget {
  final int currentIndex;
  final Function(int) onNavigate;

  const BalanceDrawer({
    super.key,
    required this.currentIndex,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: BalanceColors.backgroundDark,
      child: Container(
        // Subtle border to separate from the main body
        decoration: const BoxDecoration(
          border: Border(left: BorderSide(color: Colors.white10, width: 1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drawer Header
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 80, 40, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/logo.png', height: 40),
                  const SizedBox(height: 16),
                  const Text(
                    "BALANCE LABS",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),

            // Navigation Links
            _buildDrawerLink(context, "Home", 0),
            _buildDrawerLink(context, "Products", 1),
            _buildDrawerLink(context, "Values", 2),
            _buildDrawerLink(context, "About", 3),
            _buildDrawerLink(context, "Contact", 4),

            const Spacer(),

            // Social Footer inside Drawer
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                "© 2026 Balance Labs Inc.",
                style: TextStyle(
                  color: BalanceColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerLink(BuildContext context, String label, int index) {
    final bool isSelected = currentIndex == index;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      title: Text(
        label,
        style: TextStyle(
          color: isSelected ? BalanceColors.ledgerPrimary : Colors.white70,
          fontSize: 18,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w300,
          letterSpacing: 1.1,
        ),
      ),
      onTap: () {
        Navigator.pop(context); // Close drawer first
        onNavigate(index); // Trigger the navigation logic
      },
    );
  }
}
