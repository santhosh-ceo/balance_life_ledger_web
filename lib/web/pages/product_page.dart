import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/footer.dart';
import '../widgets/product_card.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int _currentIndex = 1;

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
                    'Our Products',
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
                  Text(
                    'Tools designed to bring harmony to your digital life',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: BalanceColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            // Products Grid
            Container(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 32),
              child: Column(
                children: [
                  // Balance: Life Ledger
                  ProductCard(
                    title: 'Balance: Life Ledger',
                    tagline: 'Your daily ritual for mindful reflection',
                    description:
                        'A structured daily companion app that helps you build a non-negotiable ritual of reflection. Track priorities, gratitude, and emotional state through a time-bound system that transforms daily snapshots into a visual narrative of your life balance.',
                    icon: Icons.auto_graph_rounded,
                    gradient: BalanceColors.ledgerGradient,
                    features: const [
                      '24-Hour Journaling Windows',
                      'Visual Balance Dashboard',
                      'Streak & Habit Tracking',
                      'Mood & Pattern Insights',
                      'Goal Integration',
                    ],
                    onLearnMore: () {
                      // Show detailed modal or navigate to product detail
                    },
                    onGetApp: () {
                      // Show platform selection
                      _showDownloadDialog(
                        context,
                        'Balance: Life Ledger',
                        BalanceColors.ledgerPrimary,
                      );
                    },
                  ),

                  const SizedBox(height: 64),

                  // Balance: Focus Restore
                  ProductCard(
                    title: 'Balance: Focus Restore',
                    tagline: 'Rebuild your attention span',
                    description:
                        'A gamified companion app that helps repair and strengthen your attention span through timed challenges and mindfulness practices. Earn rewards, unlock achievements, and track your focus journey with non-AI driven exercises.',
                    icon: Icons.psychology_rounded,
                    gradient: BalanceColors.focusGradient,
                    features: const [
                      'Gamified Focus Challenges',
                      'Attention Span Tracking',
                      'Mindfulness Exercises',
                      'Rewards & Unlockables',
                      'Progress Analytics',
                    ],
                    onLearnMore: () {
                      // Show detailed modal or navigate to product detail
                    },
                    onGetApp: () {
                      _showDownloadDialog(
                        context,
                        'Balance: Focus Restore',
                        BalanceColors.focusPrimary,
                      );
                    },
                  ),
                ],
              ),
            ),

            // Coming Soon Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 120,
                horizontal: 32,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    BalanceColors.surfaceDark,
                    BalanceColors.backgroundDark,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: BalanceColors.ledgerPrimary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: BalanceColors.ledgerPrimary.withOpacity(0.3),
                      ),
                    ),
                    child: Text(
                      'COMING 2026',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: BalanceColors.ledgerPrimary,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'The Future of Balance',
                    style: Theme.of(
                      context,
                    ).textTheme.displaySmall?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: 600,
                    child: Text(
                      'We\'re working on revolutionary features that will transform how you interact with technology. Join our waitlist to be the first to experience what\'s next.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: BalanceColors.textSecondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter your email for early access',
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.3),
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                BalanceColors.ledgerPrimary,
                                BalanceColors.focusPrimary,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Join Waitlist',
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ],
                    ),
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

  void _showDownloadDialog(
    BuildContext context,
    String appName,
    Color primaryColor,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: BalanceColors.surfaceDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
            side: BorderSide(color: Colors.white.withOpacity(0.1), width: 1),
          ),
          child: Container(
            padding: const EdgeInsets.all(40),
            width: 500,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [primaryColor, primaryColor.withOpacity(0.7)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      appName == 'Balance: Life Ledger' ? '⭕' : '🌀',
                      style: const TextStyle(fontSize: 36),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Get $appName',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Coming soon to your favorite app stores',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: BalanceColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 40),
                // Platform Buttons
                Column(
                  children: [
                    _PlatformButton(
                      icon: Icons.android_rounded,
                      label: 'Google Play Store',
                      color: const Color(0xFF3DDC84),
                      onTap: () async {
                        // Launch Play Store
                        Navigator.pop(context);
                        final url = Uri.parse(
                          'https://play.google.com/store/apps/details?id=com.anakramy.balance',
                        );

                        if (await canLaunchUrl(url)) {
                          await launchUrl(
                            url,
                            mode: LaunchMode.externalApplication,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Could not launch Play Store'),
                              backgroundColor: primaryColor,
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    _PlatformButton(
                      icon: Icons.apple_rounded,
                      label: 'Apple App Store',
                      color: Colors.white,
                      textColor: Colors.black,
                      onTap: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '$appName launching soon on App Store',
                            ),
                            backgroundColor: primaryColor,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    _PlatformButton(
                      icon: Icons.web_rounded,
                      label: 'Web App',
                      color: const Color(0xFF4285F4),
                      onTap: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Web version available after mobile launch',
                            ),
                            backgroundColor: BalanceColors.ledgerPrimary,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Not now',
                    style: TextStyle(color: BalanceColors.textSecondary),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _PlatformButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color? textColor;
  final VoidCallback onTap;

  const _PlatformButton({
    required this.icon,
    required this.label,
    required this.color,
    this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(width: 16),
              Text(
                label,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: textColor ?? color,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_rounded,
                color: BalanceColors.textSecondary,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
