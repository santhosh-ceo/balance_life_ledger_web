import 'package:balance_web/web/constants/colors.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      color: AppColors.surface,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.balance_outlined, color: AppColors.primary, size: 32),
              const SizedBox(width: 12),
              Text(
                'Balance: Life Ledger',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Your daily companion for mindful living',
            style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/privacy');
                },
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ),
              const SizedBox(width: 24),
              Text('•', style: TextStyle(color: AppColors.textSecondary)),
              const SizedBox(width: 24),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/terms');
                },
                child: Text(
                  'Terms of Service',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ),
              const SizedBox(width: 24),
              Text('•', style: TextStyle(color: AppColors.textSecondary)),
              const SizedBox(width: 24),
              TextButton(
                onPressed: () => _launchEmail(),
                child: Text(
                  'Contact Us',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            '© ${DateTime.now().year} Balance: Life Ledger. All rights reserved.',
            style: TextStyle(fontSize: 14, color: AppColors.textDisabled),
          ),
        ],
      ),
    );
  }

  void _launchEmail() {
    // launchUrl(Uri.parse('mailto:support@balanceledger.com'));
  }
}
