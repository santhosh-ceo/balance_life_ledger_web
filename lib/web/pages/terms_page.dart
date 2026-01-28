// pages/terms_page.dart
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/footer.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
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
                    'Terms & Conditions',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Last Updated: January 27, 2026',
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
                  _Section(
                    title: '1. Acceptance of Terms',
                    content:
                    'By downloading, installing, or using the Balance: Life Ledger and Balance: Focus Restore applications ("Apps"), you agree to be bound by these Terms & Conditions. If you do not agree to these terms, please do not use our Apps.',
                  ),
                  const SizedBox(height: 40),
                  _Section(
                    title: '2. Services Description',
                    content:
                    'Balance provides digital wellness applications that help users track their daily reflections, build focus habits, and improve overall well-being. Our services include:\n\n'
                        '• Daily journaling and habit tracking (Life Ledger)\n'
                        '• Focus improvement exercises and challenges (Focus Restore)\n'
                        '• Data visualization and insights\n'
                        '• Push notifications for reminders\n'
                        '• Cloud synchronization via Firebase',
                  ),
                  const SizedBox(height: 40),
                  _Section(
                    title: '3. Account Registration',
                    content:
                    'To use certain features of our Apps, you may need to register for an account. You must provide accurate and complete information. You are responsible for maintaining the confidentiality of your account credentials.',
                  ),
                  const SizedBox(height: 40),
                  _Section(
                    title: '4. Subscription & Payments',
                    content:
                    'Balance offers both free and premium subscription models:\n\n'
                        '• Free tier includes core features with optional ads\n'
                        '• Premium subscription removes ads and unlocks advanced features\n'
                        '• Subscription automatically renews unless canceled 24 hours before renewal\n'
                        '• Payments are processed through Google Play Store or Apple App Store\n'
                        '• All purchases are non-refundable except as required by law',
                  ),
                  const SizedBox(height: 40),
                  _Section(
                    title: '5. User Content & Data',
                    content:
                    'You retain ownership of all content you create within our Apps (journal entries, goals, etc.). By using our Apps, you grant us a license to store, process, and display this content to provide our services.\n\n'
                        'We implement appropriate technical measures to protect your data, but we cannot guarantee absolute security.',
                  ),
                  const SizedBox(height: 40),
                  _Section(
                    title: '6. Acceptable Use',
                    content:
                    'You agree not to:\n\n'
                        '• Use the Apps for any illegal purpose\n'
                        '• Attempt to reverse engineer or hack our systems\n'
                        '• Share accounts or use automated means to access services\n'
                        '• Upload malicious content or spam\n'
                        '• Violate any applicable laws or regulations',
                  ),
                  const SizedBox(height: 40),
                  _Section(
                    title: '7. Intellectual Property',
                    content:
                    'All intellectual property rights in the Apps, including but not limited to trademarks, logos, designs, and source code, are owned by Balance Digital Wellness. You are granted a limited, non-exclusive license to use the Apps for personal, non-commercial purposes.',
                  ),
                  const SizedBox(height: 40),
                  _Section(
                    title: '8. Termination',
                    content:
                    'We may terminate or suspend your access to our Apps immediately, without prior notice, for conduct that we believe violates these Terms or is harmful to other users.',
                  ),
                  const SizedBox(height: 40),
                  _Section(
                    title: '9. Limitation of Liability',
                    content:
                    'To the maximum extent permitted by law, Balance Digital Wellness shall not be liable for any indirect, incidental, special, consequential, or punitive damages resulting from your use of or inability to use the Apps.',
                  ),
                  const SizedBox(height: 40),
                  _Section(
                    title: '10. Changes to Terms',
                    content:
                    'We reserve the right to modify these Terms at any time. We will notify users of material changes through in-app notifications or email. Continued use of the Apps after changes constitutes acceptance.',
                  ),
                  const SizedBox(height: 40),
                  _Section(
                    title: '11. Governing Law',
                    content:
                    'These Terms shall be governed by and construed in accordance with the laws of India, without regard to its conflict of law provisions.',
                  ),
                  const SizedBox(height: 40),
                  _Section(
                    title: '12. Contact Information',
                    content:
                    'For questions about these Terms, please contact us at:\n\n'
                        'Email: legal@balancedigitalwellness.com\n'
                        'Address: Balance Digital Wellness, Bengaluru, India',
                  ),
                  const SizedBox(height: 60),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.info_outline_rounded,
                          color: BalanceColors.ledgerPrimary,
                          size: 24,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            'These Terms & Conditions apply to both Balance: Life Ledger and Balance: Focus Restore applications.',
                            style:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: BalanceColors.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
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

class _Section extends StatelessWidget {
  final String title;
  final String content;

  const _Section({
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