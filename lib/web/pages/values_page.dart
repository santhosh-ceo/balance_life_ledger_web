// pages/values_page.dart (Add legal values section)
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/footer.dart';

class ValuesPage extends StatefulWidget {
  const ValuesPage({super.key});

  @override
  State<ValuesPage> createState() => _ValuesPageState();
}

class _ValuesPageState extends State<ValuesPage> {
  int _currentIndex = 2;

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
              padding: const EdgeInsets.symmetric(
                vertical: 120,
                horizontal: 32,
              ),
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
                    'Our Values',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: [
                            BalanceColors.ledgerPrimary,
                            BalanceColors.focusPrimary,
                          ],
                        ).createShader(const Rect.fromLTWH(0, 0, 300, 70)),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: 800,
                    child: Text(
                      'The principles that guide everything we build',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: BalanceColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Core Values
            Container(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 32),
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                children: [
                  // Add this new section for legal values
                  Container(
                    margin: const EdgeInsets.only(bottom: 80),
                    child: Column(
                      children: [
                        Text(
                          'Privacy & Security Commitment',
                          style: Theme.of(context).textTheme.displaySmall
                              ?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 40),
                        Wrap(
                          spacing: 32,
                          runSpacing: 32,
                          children: [
                            _ValueCard(
                              icon: Icons.lock_rounded,
                              title: 'Data Protection',
                              description:
                                  'We encrypt all user data and implement industry-standard security measures.',
                              color: BalanceColors.ledgerPrimary,
                            ),
                            _ValueCard(
                              icon: Icons.gpp_good_rounded,
                              title: 'Transparent Policies',
                              description:
                                  'Clear privacy policy and terms that prioritize user rights and control.',
                              color: BalanceColors.focusPrimary,
                            ),
                            _ValueCard(
                              icon: Icons.visibility_off_rounded,
                              title: 'Minimal Data Collection',
                              description:
                                  'We only collect what\'s necessary to provide our services effectively.',
                              color: BalanceColors.ledgerSecondary,
                            ),
                            _ValueCard(
                              icon: Icons.delete_sweep_rounded,
                              title: 'Right to Delete',
                              description:
                                  'Users can delete their account and all associated data at any time.',
                              color: BalanceColors.focusSecondary,
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Container(
                          padding: const EdgeInsets.all(32),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                BalanceColors.ledgerPrimary.withOpacity(0.1),
                                BalanceColors.focusPrimary.withOpacity(0.05),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: BalanceColors.ledgerPrimary.withOpacity(
                                0.2,
                              ),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.balance_rounded,
                                color: BalanceColors.ledgerPrimary,
                                size: 32,
                              ),
                              const SizedBox(width: 24),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Legal Compliance',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(color: Colors.white),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'Our apps comply with:\n\n'
                                      '• Google Play Store Developer Policies\n'
                                      '• Apple App Store Guidelines\n'
                                      '• GDPR Data Protection Principles\n'
                                      '• Local Privacy Regulations\n'
                                      '• Advertising Platform Requirements',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: Colors.white.withOpacity(
                                              0.8,
                                            ),
                                            height: 1.6,
                                          ),
                                    ),
                                    const SizedBox(height: 24),
                                    Row(
                                      children: [
                                        MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            onTap: () => Navigator.pushNamed(
                                              context,
                                              '/privacy',
                                            ),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 24,
                                                    vertical: 12,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: BalanceColors
                                                    .ledgerPrimary
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                  color: BalanceColors
                                                      .ledgerPrimary,
                                                ),
                                              ),
                                              child: Text(
                                                'Privacy Policy',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            onTap: () => Navigator.pushNamed(
                                              context,
                                              '/terms',
                                            ),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 24,
                                                    vertical: 12,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                  color: Colors.white
                                                      .withOpacity(0.3),
                                                ),
                                              ),
                                              child: Text(
                                                'Terms & Conditions',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Existing core values...
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class _ValueCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const _ValueCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: BalanceColors.surfaceDark,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: color.withOpacity(0.3)),
            ),
            child: Center(child: Icon(icon, color: color, size: 28)),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white.withOpacity(0.7),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
