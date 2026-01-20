import 'package:balance_web/web/constants/colors.dart';
import 'package:flutter/material.dart';
import '../widgets/footer.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Privacy Policy',
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  _buildSection(
                    title: '1. Information We Collect',
                    content: '''
We collect the following information when you use Balance: Life Ledger:

Journal Data: Your daily entries, including:
- Priority tasks (work, family, self-care)
- Mood selections and ratings
- Gratitude and highlights
- Improvement notes and thoughts
- Doodle drawings (if created)

Account Information:
- Email address
- Display name
- Account creation date

Usage Data:
- App interactions
- Feature usage patterns
- Device information (type, OS version)
- Crash reports and error logs

No Sensitive Data: We never collect:
- Location data
- Contacts or address book
- Photos or camera access
- Payment information
''',
                  ),
                  _buildSection(
                    title: '2. How We Use Your Information',
                    content: '''
We use your data to:

Provide Core Services:
- Store and sync your journal entries
- Calculate streaks and progress
- Generate balance insights
- Enable account access across devices

Improve The App:
- Fix bugs and crashes
- Analyze usage patterns
- Develop new features
- Optimize performance

Communicate With You:
- Send important updates
- Respond to support requests
- Send daily reminders (if enabled)
''',
                  ),
                  _buildSection(
                    title: '3. Data Storage & Security',
                    content: '''
Encryption: All data is encrypted in transit (SSL/TLS) and at rest.

Firebase: We use Google Firebase for data storage, which provides enterprise-grade security.

Local Storage: Data is cached locally on your device for offline access.

Backups: Regular encrypted backups are maintained for disaster recovery.

Access Control: Only you can access your journal data. We never read your personal entries.
''',
                  ),
                  _buildSection(
                    title: '4. Third-Party Services',
                    content: '''
We use these trusted services:

Google Firebase: For authentication, database, and notifications
Google Analytics: For anonymous usage statistics (opt-out available)
Crashlytics: For error reporting and bug fixes

All third-party services comply with GDPR and data protection regulations.
''',
                  ),
                  _buildSection(
                    title: '5. Your Rights',
                    content: '''
You have the right to:

Access: View all data we store about you
Export: Download your journal data in readable format
Delete: Permanently delete your account and all data
Correct: Update or correct inaccurate information
Opt-Out: Disable analytics or notifications

To exercise these rights, contact us at support@balanceledger.com
''',
                  ),
                  _buildSection(
                    title: '6. Children\'s Privacy',
                    content: '''
Balance: Life Ledger is not intended for children under 13. We do not knowingly collect data from children under 13. If we learn we have collected personal information from a child under 13, we will delete that information promptly.
''',
                  ),
                  _buildSection(
                    title: '7. Changes to This Policy',
                    content: '''
We may update this privacy policy periodically. We will notify you of significant changes by:
- In-app notifications
- Email (if provided)
- Updated version in the app stores

Continued use of the app after changes constitutes acceptance of the new policy.
''',
                  ),
                  _buildSection(
                    title: '8. Contact Us',
                    content:
                        '''
For privacy-related questions or concerns:

Email: info@anakramy.com
Address: Anakramy, Bangalore
Response Time: We aim to respond within 48 hours

Last Updated: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}
''',
                  ),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          Text(content, style: const TextStyle(fontSize: 16, height: 1.6)),
        ],
      ),
    );
  }
}
