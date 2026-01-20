import 'package:balance_web/web/constants/colors.dart';
import 'package:flutter/material.dart';
import '../widgets/footer.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

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
        title: const Text('Terms of Service'),
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
                    'Terms of Service',
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  _buildSection(
                    title: '1. Acceptance of Terms',
                    content: '''
By downloading, installing, or using Balance: Life Ledger ("the App"), you agree to be bound by these Terms of Service. If you do not agree to these terms, please do not use the App.
''',
                  ),
                  _buildSection(
                    title: '2. Description of Service',
                    content: '''
Balance: Life Ledger is a digital journaling application that allows users to:

- Track daily priorities across work, family, and self-care
- Record mood and emotional states
- Maintain gratitude and reflection journals
- View progress through charts and statistics
- Set and track personal goals

The App is provided "as is" and we reserve the right to modify or discontinue features at any time.
''',
                  ),
                  _buildSection(
                    title: '3. User Accounts',
                    content: '''
Account Creation: You must create an account to use the App. You are responsible for:
- Providing accurate information
- Maintaining account security
- All activities under your account

Account Termination: We reserve the right to suspend or terminate accounts that:
- Violate these terms
- Engage in fraudulent activity
- Attempt to compromise system security
''',
                  ),
                  _buildSection(
                    title: '4. User Content',
                    content: '''
Ownership: You retain all rights to your journal entries and data.

License: By using the App, you grant us a limited license to:
- Store and process your data to provide the service
- Create anonymous, aggregated statistics
- Backup and restore your data

Prohibited Content: You agree not to upload content that:
- Violates laws or regulations
- Infringes intellectual property rights
- Contains malware or harmful code
- Is abusive, harassing, or discriminatory
''',
                  ),
                  _buildSection(
                    title: '5. Subscription & Payments',
                    content: '''
Free Tier: Basic features are available at no cost.

Premium Features: Additional features may require payment.

Automatic Renewal: Subscriptions renew automatically unless canceled.

Refunds: Refund requests are handled according to platform policies (Apple App Store, Google Play Store).
''',
                  ),
                  _buildSection(
                    title: '6. Intellectual Property',
                    content: '''
All rights, title, and interest in the App, including:
- Software code
- Design elements
- User interface
- Documentation
- Branding and trademarks

are owned by us or our licensors. You may not copy, modify, or distribute the App without permission.
''',
                  ),
                  _buildSection(
                    title: '7. Disclaimer of Warranties',
                    content: '''
The App is provided "as is" without warranties of any kind. We do not guarantee that:

- The App will meet your specific requirements
- Service will be uninterrupted or error-free
- Results from using the App will be accurate or reliable
- Any errors will be corrected
''',
                  ),
                  _buildSection(
                    title: '8. Limitation of Liability',
                    content: '''
To the maximum extent permitted by law, we shall not be liable for:

- Indirect, incidental, or consequential damages
- Loss of data or content
- Interruption of service
- Unauthorized access to your data
- Any damages arising from use of the App

Total liability shall not exceed the amount you paid for the App in the last 12 months.
''',
                  ),
                  _buildSection(
                    title: '9. Termination',
                    content: '''
We may terminate or suspend your access immediately if you:

- Breach these terms
- Use the App unlawfully
- Create risk or legal exposure for us
- Have been inactive for an extended period

Upon termination, your right to use the App ceases immediately.
''',
                  ),
                  _buildSection(
                    title: '10. Changes to Terms',
                    content: '''
We may modify these terms at any time. We will notify you of significant changes through:

- In-app notifications
- Email communication
- App store updates

Your continued use after changes constitutes acceptance of new terms.
''',
                  ),
                  _buildSection(
                    title: '11. Governing Law',
                    content: '''
These terms shall be governed by the laws of [Your Country/State]. Any disputes shall be resolved in the courts of [Your Jurisdiction].

For European Union users, you may also have the right to lodge complaints with your local data protection authority.
''',
                  ),
                  _buildSection(
                    title: '12. Contact Information',
                    content:
                        '''
For questions about these terms:

Email: info@anakramy.com
Address: Anakramy, Bangalore
Effective Date: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}
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
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          Text(content, style: const TextStyle(fontSize: 16, height: 1.6)),
        ],
      ),
    );
  }
}
