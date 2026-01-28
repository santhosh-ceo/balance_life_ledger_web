// pages/privacy_page.dart
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/footer.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  int _currentIndex = 0;

  void _navigateTo(int index) {
    setState(() {
      _currentIndex = index;
    });
    final routes = ['/home', '/products', '/values', '/about', '/contact'];
    if (index < routes.length) {
      Navigator.pushNamed(context, routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BalanceAppBar(
        currentIndex: _currentIndex,
        onItemTapped: _navigateTo,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    BalanceColors.backgroundDark,
                    BalanceColors.surfaceDark,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Privacy Policy',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Your privacy is our priority. Last Updated: January 27, 2026',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: BalanceColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Container(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 32),
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _PrivacySection(
                    title: '1. Introduction',
                    content:
                    'Balance Digital Wellness ("we", "our", or "us") is committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile applications Balance: Life Ledger and Balance: Focus Restore.',
                  ),
                  const SizedBox(height: 40),
                  _PrivacySection(
                    title: '2. Information We Collect',
                    content:
                    'We collect several types of information to provide and improve our services:\n\n'
                        'Personal Information:\n'
                        '• Email address (for account creation)\n'
                        '• Name (optional)\n'
                        '• Profile information\n\n'
                        'Journal & Usage Data:\n'
                        '• Daily journal entries\n'
                        '• Mood ratings\n'
                        '• Goal progress\n'
                        '• Focus session data\n'
                        '• App usage patterns\n\n'
                        'Technical Information:\n'
                        '• Device type and OS version\n'
                        '• App crash reports\n'
                        '• Analytics data\n'
                        '• Advertising identifiers (for free tier)',
                  ),
                  const SizedBox(height: 40),
                  _PrivacySection(
                    title: '3. How We Use Your Information',
                    content:
                    'We use the collected information for:\n\n'
                        '• Providing and maintaining our services\n'
                        '• Personalizing your experience\n'
                        '• Processing premium subscriptions\n'
                        '• Sending push notifications (reminders, streak updates)\n'
                        '• Improving app functionality\n'
                        '• Analyzing usage patterns\n'
                        '• Showing relevant ads (free tier only)\n'
                        '• Complying with legal obligations',
                  ),
                  const SizedBox(height: 40),
                  _PrivacySection(
                    title: '4. Data Storage & Security',
                    content:
                    'Firebase Backend: We use Google Firebase services for:\n'
                        '• Authentication (Firebase Auth)\n'
                        '• Data storage (Cloud Firestore)\n'
                        '• Push notifications (Firebase Cloud Messaging)\n'
                        '• Analytics (Firebase Analytics)\n'
                        '• Crash reporting (Firebase Crashlytics)\n\n'
                        'Security Measures:\n'
                        '• Data encryption in transit and at rest\n'
                        '• Secure authentication protocols\n'
                        '• Regular security audits\n'
                        '• Access controls and monitoring',
                  ),
                  const SizedBox(height: 40),
                  _PrivacySection(
                    title: '5. Push Notifications',
                    content:
                    'We send push notifications for:\n'
                        '• Daily journal reminders\n'
                        '• Focus session alerts\n'
                        '• Streak milestones\n'
                        '• App updates\n\n'
                        'You can manage notification preferences in your device settings or within the app settings. We respect Do Not Disturb modes and quiet hours.',
                  ),
                  const SizedBox(height: 40),
                  _PrivacySection(
                    title: '6. Advertising',
                    content:
                    'Free Tier: Users of the free version may see ads. We use:\n'
                        '• Google AdMob for ad serving\n'
                        '• Contextual advertising (non-personalized)\n'
                        '• Limited ad frequency\n\n'
                        'Premium Tier: Premium subscribers enjoy an ad-free experience.\n\n'
                        'Ad Privacy: We do not share personal journal data with advertisers. Advertising IDs are used in compliance with platform policies.',
                  ),
                  const SizedBox(height: 40),
                  _PrivacySection(
                    title: '7. Analytics',
                    content:
                    'We use analytics to understand how our apps are used and to improve them:\n\n'
                        'Firebase Analytics: Collects anonymous usage data\n'
                        '• Feature usage patterns\n'
                        '• Session duration\n'
                        '• Retention metrics\n'
                        '• Error rates\n\n'
                        'All analytics data is aggregated and anonymized. We do not sell analytics data to third parties.',
                  ),
                  const SizedBox(height: 40),
                  _PrivacySection(
                    title: '8. Data Sharing & Third Parties',
                    content:
                    'We do not sell your personal data. We may share information with:\n\n'
                        'Service Providers:\n'
                        '• Google Firebase (required for app functionality)\n'
                        '• Google AdMob (ads in free version)\n'
                        '• Payment processors (for subscriptions)\n\n'
                        'Legal Requirements: We may disclose information if required by law or to protect our rights.',
                  ),
                  const SizedBox(height: 40),
                  _PrivacySection(
                    title: '9. Your Rights & Choices',
                    content:
                    'You have the right to:\n'
                        '• Access your personal data\n'
                        '• Correct inaccurate data\n'
                        '• Delete your account and data\n'
                        '• Export your journal data\n'
                        '• Opt-out of marketing communications\n'
                        '• Manage push notification preferences\n\n'
                        'To exercise these rights, contact us at privacy@balancedigitalwellness.com',
                  ),
                  const SizedBox(height: 40),
                  _PrivacySection(
                    title: '10. Data Retention',
                    content:
                    'We retain your data for as long as your account is active or as needed to provide services. Upon account deletion:\n'
                        '• Personal identifiers are removed\n'
                        '• Journal data is permanently deleted\n'
                        '• Analytics data is anonymized\n'
                        '• Backup data is removed within 30 days',
                  ),
                  const SizedBox(height: 40),
                  _PrivacySection(
                    title: '11. International Data Transfers',
                    content:
                    'Our services are hosted on Google Cloud Platform, which may involve data transfer across borders. We ensure appropriate safeguards are in place for international data transfers.',
                  ),
                  const SizedBox(height: 40),
                  _PrivacySection(
                    title: '12. Children\'s Privacy',
                    content:
                    'Our apps are not intended for children under 13. We do not knowingly collect information from children under 13. If we become aware of such collection, we will take steps to delete the information.',
                  ),
                  const SizedBox(height: 40),
                  _PrivacySection(
                    title: '13. Changes to Privacy Policy',
                    content:
                    'We may update this Privacy Policy periodically. We will notify users of significant changes through in-app notifications or email. Continued use of our apps after changes constitutes acceptance.',
                  ),
                  const SizedBox(height: 40),
                  _PrivacySection(
                    title: '14. Contact Us',
                    content:
                    'For privacy-related questions or concerns:\n\n'
                        'Email: privacy@balancedigitalwellness.com\n'
                        'Address: Balance Digital Wellness, Bengaluru, India\n\n'
                        'Data Protection Officer: Alex Chen\n'
                        'Response Time: We aim to respond within 7 business days.',
                  ),
                  const SizedBox(height: 60),
                  // Important Notes
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ImportantNote(
                        icon: Icons.security_rounded,
                        title: 'Security First',
                        content:
                        'We implement industry-standard security measures to protect your data. All journal entries are encrypted and stored securely in Firebase.',
                      ),
                      const SizedBox(height: 24),
                      _ImportantNote(
                        icon: Icons.gpp_good_rounded,
                        title: 'Your Control',
                        content:
                        'You have full control over your data. You can delete your account and all associated data at any time from the app settings.',
                      ),
                      const SizedBox(height: 24),
                      _ImportantNote(
                        icon: Icons.ads_click_rounded,
                        title: 'Transparent Ads',
                        content:
                        'Free users see minimal, non-intrusive ads. Premium users enjoy a completely ad-free experience.',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Footer(showLegalLinks: false),
          ],
        ),
      ),
    );
  }
}

class _PrivacySection extends StatelessWidget {
  final String title;
  final String content;

  const _PrivacySection({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          content,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.white.withOpacity(0.8),
            height: 1.6,
          ),
        ),
      ],
    );
  }
}

class _ImportantNote extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;

  const _ImportantNote({
    required this.icon,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            BalanceColors.ledgerPrimary.withOpacity(0.1),
            BalanceColors.focusPrimary.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: BalanceColors.ledgerPrimary.withOpacity(0.2),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: BalanceColors.ledgerPrimary,
            size: 24,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  content,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}