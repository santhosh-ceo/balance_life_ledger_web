import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';

class Footer extends StatelessWidget {
  final bool showLegalLinks;
  const Footer({super.key, this.showLegalLinks = true});

  // Developer Console URL
  static const String _devConsoleUrl =
      "https://play.google.com/store/apps/dev?id=8119606961308804734";

  void _pushRoute(BuildContext context, String route) {
    if (ModalRoute.of(context)?.settings.name != route) {
      Navigator.pushNamed(context, route);
    }
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: isMobile ? 24 : 80,
      ),
      decoration: const BoxDecoration(color: Color(0xFF05070A)),
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 40,
            spacing: isMobile ? 20 : 100,
            children: [
              // --- BRAND BLOCK ---
              SizedBox(
                width: isMobile ? double.infinity : 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFooterLogo(context),
                    const SizedBox(height: 24),
                    Text(
                      'Architecting tools for the intentional life. Explore our ecosystem of high-precision wellness apps.',
                      style: TextStyle(
                        color: BalanceColors.textSecondary,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Only Google Play Badge
                    _StoreBadge(
                      Icons.play_arrow,
                      "GET IT ON GOOGLE PLAY",
                      () => _launchURL(_devConsoleUrl),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        _SocialIcon(
                          Icons.smart_display_outlined,
                          () => _launchURL(
                            'https://www.youtube.com/@balance_labs',
                          ),
                          label: "YouTube",
                          color: Colors.red,
                        ),
                        const SizedBox(width: 24),
                        _SocialIcon(
                          Icons.business_center,
                          color: Colors.blue,
                          () => _launchURL(
                            'https://www.linkedin.com/company/balance-life-ledger',
                          ),
                          label: "LinkedIn",
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // --- NAVIGATION ---
              _FooterNavGroup(
                title: 'Products',
                links: [
                  _LinkItem(
                    'Wealth Tracker',
                    () => _pushRoute(context, '/products'),
                  ),
                  _LinkItem(
                    'Life Ledger',
                    () => _pushRoute(context, '/products'),
                  ),
                  _LinkItem(
                    'Focus Restore',
                    () => _pushRoute(context, '/products'),
                  ),
                ],
              ),

              _FooterNavGroup(
                title: 'Company',
                links: [
                  _LinkItem('About Us', () => _pushRoute(context, '/about')),
                  _LinkItem('Our Values', () => _pushRoute(context, '/values')),
                  _LinkItem('Contact', () => _pushRoute(context, '/contact')),
                ],
              ),

              _FooterNavGroup(
                title: 'Legal',
                links: [
                  _LinkItem(
                    'Privacy Policy',
                    () => _pushRoute(context, '/privacy'),
                  ),
                  _LinkItem(
                    'Terms of Service',
                    () => _pushRoute(context, '/terms'),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 80),
          const Divider(color: Color(0xFF1E293B)),
          const SizedBox(height: 40),

          // --- BOTTOM BAR ---
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '© 2026 Balance Labs Inc. All rights reserved.',
                style: TextStyle(
                  color: BalanceColors.textSecondary,
                  fontSize: 14,
                ),
              ),
              if (isMobile) const SizedBox(height: 20),
              GestureDetector(
                onTap: () => _pushRoute(context, '/contact'),
                child: Text(
                  'Contact support: info@anakramy.com',
                  style: TextStyle(
                    color: BalanceColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLogo(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _pushRoute(context, '/home'),
        child: Row(
          children: [
            Image.asset('assets/logo.png', height: 30),
            const SizedBox(width: 12),
            const Text(
              'BALANCE LABS',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FooterNavGroup extends StatelessWidget {
  final String title;
  final List<_LinkItem> links;
  const _FooterNavGroup({required this.title, required this.links});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 24),
        ...links.map(
          (link) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: link.onTap,
                child: Text(
                  link.label,
                  style: TextStyle(
                    color: BalanceColors.textSecondary,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LinkItem {
  final String label;
  final VoidCallback onTap;
  _LinkItem(this.label, this.onTap);
}

class _StoreBadge extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _StoreBadge(this.icon, this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            border: Border.all(color: Colors.white10),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white, size: 24),
              const SizedBox(width: 12),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final String label;
  const _SocialIcon(this.icon, this.onTap, {required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Tooltip(
          message: label,
          child: Icon(icon, color: color, size: 32),
        ),
      ),
    );
  }
}
