import 'package:flutter/material.dart';

import '../constants/colors.dart';

class Footer extends StatelessWidget {
  final bool showLegalLinks;

  const Footer({super.key, this.showLegalLinks = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(
          top: BorderSide(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo & Description
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset(
                          'assets/logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'BALANCE',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                          foreground: Paint()
                            ..shader = BalanceColors.ledgerGradient.createShader(
                              const Rect.fromLTWH(0, 0, 200, 70),
                            ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: 300,
                    child: Text(
                      'Creating tools for mindful technology use and digital well-being.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: BalanceColors.textSecondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // App Store Badges (Coming Soon)
                  Row(
                    children: [
                      _AppStoreBadge(
                        icon: Icons.android_rounded,
                        label: 'Play Store',
                        color: const Color(0xFF3DDC84),
                        onTap: () {},
                      ),
                      const SizedBox(width: 12),
                      _AppStoreBadge(
                        icon: Icons.apple_rounded,
                        label: 'App Store',
                        color: Colors.white,
                        textColor: Colors.black,
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),

              // Links
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Products',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _FooterLink(
                        label: 'Life Ledger',
                        onTap: () => Navigator.pushNamed(context, '/products'),
                      ),
                      const SizedBox(height: 8),
                      _FooterLink(
                        label: 'Focus Restore',
                        onTap: () => Navigator.pushNamed(context, '/products'),
                      ),
                      const SizedBox(height: 8),
                      _FooterLink(
                        label: 'Future Projects',
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(width: 64),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Company',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _FooterLink(
                        label: 'About',
                        onTap: () => Navigator.pushNamed(context, '/about'),
                      ),
                      const SizedBox(height: 8),
                      _FooterLink(
                        label: 'Values',
                        onTap: () => Navigator.pushNamed(context, '/values'),
                      ),
                      const SizedBox(height: 8),
                      _FooterLink(
                        label: 'Careers',
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(width: 64),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Legal',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _FooterLink(
                        label: 'Privacy Policy',
                        onTap: () => Navigator.pushNamed(context, '/privacy'),
                      ),
                      const SizedBox(height: 8),
                      _FooterLink(
                        label: 'Terms & Conditions',
                        onTap: () => Navigator.pushNamed(context, '/terms'),
                      ),
                      const SizedBox(height: 8),
                      _FooterLink(
                        label: 'Contact',
                        onTap: () => Navigator.pushNamed(context, '/contact'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 64),
          Divider(
            color: Colors.white.withOpacity(0.1),
            height: 1,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '© 2026 Balance Digital Wellness. All rights reserved.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: BalanceColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (showLegalLinks)
                    Row(
                      children: [
                        _SmallFooterLink(
                          label: 'Privacy Policy',
                          onTap: () => Navigator.pushNamed(context, '/privacy'),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          '•',
                          style: TextStyle(
                            color: BalanceColors.textSecondary,
                          ),
                        ),
                        const SizedBox(width: 16),
                        _SmallFooterLink(
                          label: 'Terms & Conditions',
                          onTap: () => Navigator.pushNamed(context, '/terms'),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          '•',
                          style: TextStyle(
                            color: BalanceColors.textSecondary,
                          ),
                        ),
                        const SizedBox(width: 16),
                        _SmallFooterLink(
                          label: 'Cookie Policy',
                          onTap: () {},
                        ),
                      ],
                    ),
                ],
              ),
              Row(
                children: [
                  _SocialIcon(icon: Icons.campaign_rounded, onTap: () {}),
                  const SizedBox(width: 16),
                  _SocialIcon(icon: Icons.people_alt_rounded, onTap: () {}),
                  const SizedBox(width: 16),
                  _SocialIcon(icon: Icons.linked_camera_rounded, onTap: () {}),
                  const SizedBox(width: 16),
                  _SocialIcon(icon: Icons.code_rounded, onTap: () {}),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AppStoreBadge extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color? textColor;
  final VoidCallback onTap;

  const _AppStoreBadge({
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
            ),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: color,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: textColor ?? color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _FooterLink({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: BalanceColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

class _SmallFooterLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _SmallFooterLink({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: BalanceColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialIcon({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
            ),
          ),
          child: Center(
            child: Icon(
              icon,
              size: 20,
              color: BalanceColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}