import 'package:balance_web/web/constants/colors.dart';
import 'package:balance_web/web/widgets/app_button.dart';
import 'package:balance_web/web/widgets/feature_card.dart';
import 'package:balance_web/web/widgets/footer.dart';
import 'package:balance_web/web/widgets/screenshot_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Navigation Bar
            _buildNavBar(context),

            // Hero Section
            _buildHeroSection(),

            // Screenshots
            _buildScreenshotsSection(),

            // Features
            _buildFeaturesSection(),

            // Download CTA
            _buildDownloadSection(),

            // Footer
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildNavBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Row(
        children: [
          // Logo
          Row(
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.2),
                      blurRadius: 40,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    'assets/logo.png', // Add your mockup image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Balance: Life Ledger',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Navigation Links
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Home',
                  style: TextStyle(color: AppColors.textPrimary),
                ),
              ),
              const SizedBox(width: 24),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/features');
                },
                child: Text(
                  'Features',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ),
              const SizedBox(width: 24),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/privacy');
                },
                child: Text(
                  'Privacy',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ),
              const SizedBox(width: 24),
              AppButton(
                text: 'Download',
                onPressed: _handleDownload,
                type: ButtonType.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      constraints: const BoxConstraints(maxWidth: 1200),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Column - Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Find Your Daily Harmony',
                  style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Balance: Life Ledger helps you track work, family, and self-care through structured evening journaling. Build better habits, see your life balance, and maintain consistency with our 24-hour journaling system.',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.textSecondary,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    AppButton(
                      text: 'Download on App Store',
                      onPressed: () => _openAppStore(),
                      icon: Icons.apple,
                      type: ButtonType.primary,
                    ),
                    const SizedBox(width: 16),
                    AppButton(
                      text: 'Get it on Google Play',
                      onPressed: () => _openPlayStore(),
                      icon: Icons.android,
                      type: ButtonType.secondary,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'Coming soon to web',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          // Right Column - Mockup
          const SizedBox(width: 80),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.2),
                    blurRadius: 40,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  'assets/logo.png', // Add your mockup image
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScreenshotsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      color: AppColors.surface,
      child: Column(
        children: [
          Text(
            'Simple, Beautiful Interface',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Designed for focus and clarity',
            style: TextStyle(fontSize: 18, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 48),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                ScreenshotCard(
                  image: 'assets/screen1.png',
                  title: 'Daily Entry',
                  description: 'Track work, family, self-care priorities',
                ),
                const SizedBox(width: 24),
                ScreenshotCard(
                  image: 'assets/screen2.png',
                  title: 'Mood & Reflection',
                  description: 'Rate your day and add gratitude',
                ),
                const SizedBox(width: 24),
                ScreenshotCard(
                  image: 'assets/screen3.png',
                  title: 'Balance Dashboard',
                  description: 'Visualize your life equilibrium',
                ),
                const SizedBox(width: 24),
                ScreenshotCard(
                  image: 'assets/screen4.png',
                  title: 'Past Entries',
                  description: 'Review your journal history',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      constraints: const BoxConstraints(maxWidth: 1200),
      child: Column(
        children: [
          Text(
            'Why Choose Balance: Life Ledger?',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 48),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: 1.2,
            children: [
              FeatureCard(
                icon: Icons.lock_clock_outlined,
                title: '24-Hour Journaling',
                description: 'Entries lock after 24 hours to build consistency',
                color: AppColors.primary,
              ),
              FeatureCard(
                icon: Icons.pie_chart,
                title: 'Balance Dashboard',
                description: 'Visual charts show your work-life balance',
                color: AppColors.work,
              ),
              FeatureCard(
                icon: Icons.timeline_outlined,
                title: 'Progress Tracking',
                description: 'Track streaks, mood trends, and completion rates',
                color: AppColors.success,
              ),
              FeatureCard(
                icon: Icons.emoji_emotions_outlined,
                title: 'Mood & Reflection',
                description: 'Rate each life area and add gratitude',
                color: AppColors.selfCare,
              ),
              FeatureCard(
                icon: Icons.security_outlined,
                title: 'Privacy First',
                description: 'Your data is encrypted and never shared',
                color: AppColors.info,
              ),
              FeatureCard(
                icon: Icons.offline_bolt_outlined,
                title: 'Offline Support',
                description: 'Journal anywhere, syncs when online',
                color: AppColors.warning,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withOpacity(0.1),
            AppColors.secondary.withOpacity(0.1),
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Start Your Journey Today',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Join thousands finding better balance through daily reflection',
            style: TextStyle(fontSize: 18, color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton(
                text: 'Download on App Store',
                onPressed: () => _openAppStore(),
                icon: Icons.apple,
                type: ButtonType.primary,
                size: ButtonSize.large,
              ),
              const SizedBox(width: 24),
              AppButton(
                text: 'Get it on Google Play',
                onPressed: () => _openPlayStore(),
                icon: Icons.android,
                type: ButtonType.secondary,
                size: ButtonSize.large,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _handleDownload() {
    // Scroll to download section
  }

  void _openAppStore() {
    // Replace with your App Store URL
    // launchUrl(Uri.parse('https://apps.apple.com/app/idYOUR_APP_ID'));
  }

  void _openPlayStore() {
    // Replace with your Play Store URL
    // launchUrl(Uri.parse('https://play.google.com/store/apps/details?id=com.yourapp.balance'));
  }
}
