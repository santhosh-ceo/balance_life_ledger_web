import 'package:balance_web/web/constants/colors.dart';
import 'package:flutter/material.dart';
import '../widgets/footer.dart';
import '../widgets/feature_card.dart';

class FeaturesPage extends StatelessWidget {
  const FeaturesPage({super.key});

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
        title: const Text('Features'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                children: [
                  Text(
                    'Everything You Need for Mindful Living',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Balance: Life Ledger combines structured journaling with powerful insights',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Core Features
            Container(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
              color: AppColors.surface,
              child: Column(
                children: [
                  Text(
                    'Core Features',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 40),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 1.1,
                    children: [
                      FeatureCard(
                        icon: Icons.edit_calendar_outlined,
                        title: 'Daily Journaling',
                        description:
                            'Structured entries for work, family, and self-care with guided prompts',
                        color: AppColors.primary,
                      ),
                      FeatureCard(
                        icon: Icons.timeline_outlined,
                        title: 'Balance Dashboard',
                        description:
                            'Visual charts showing your work-life balance trends over time',
                        color: AppColors.work,
                      ),
                      FeatureCard(
                        icon: Icons.emoji_emotions_outlined,
                        title: 'Mood Tracking',
                        description:
                            'Track emotional patterns and rate satisfaction across life areas',
                        color: AppColors.selfCare,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Habit Building
            Container(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                children: [
                  Text(
                    'Habit Building',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 40),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 1.3,
                    children: [
                      FeatureCard(
                        icon: Icons.local_fire_department_outlined,
                        title: 'Streak System',
                        description:
                            'Build consistency with daily streaks and milestone celebrations',
                        color: AppColors.warning,
                      ),
                      FeatureCard(
                        icon: Icons.lock_clock_outlined,
                        title: '24-Hour Lock',
                        description:
                            'Entries lock after 24 hours to encourage daily reflection',
                        color: AppColors.info,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Data & Privacy
            Container(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
              color: AppColors.surface,
              child: Column(
                children: [
                  Text(
                    'Data & Privacy',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 40),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 1.3,
                    children: [
                      FeatureCard(
                        icon: Icons.security_outlined,
                        title: 'Privacy First',
                        description:
                            'End-to-end encryption and no data sharing with third parties',
                        color: AppColors.success,
                      ),
                      FeatureCard(
                        icon: Icons.cloud_off_outlined,
                        title: 'Offline Support',
                        description:
                            'Use the app anywhere - syncs automatically when online',
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Free vs Premium
            Container(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                children: [
                  Text(
                    'Free vs Premium',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 40),
                  DataTable(
                    columns: const [
                      DataColumn(label: Text('Feature')),
                      DataColumn(label: Text('Free'), numeric: true),
                      DataColumn(label: Text('Premium'), numeric: true),
                    ],
                    rows: [
                      _buildTableRow('Daily Journaling', '✓', '✓'),
                      _buildTableRow('Basic Dashboard', '✓', '✓'),
                      _buildTableRow('Streak Tracking', '✓', '✓'),
                      _buildTableRow('Mood Tracking', '✓', '✓'),
                      _buildTableRow('No Ads', '✗', '✓'),
                      _buildTableRow('Advanced Analytics', '✗', '✓'),
                      _buildTableRow('Custom Themes', '✗', '✓'),
                      _buildTableRow(
                        'Unlimited History',
                        '90 days',
                        'Unlimited',
                      ),
                      _buildTableRow('Data Export', '✗', '✓'),
                      _buildTableRow('Priority Support', '✗', '✓'),
                    ],
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Get Premium - \$5/month',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
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

  DataRow _buildTableRow(String feature, String free, String premium) {
    return DataRow(
      cells: [
        DataCell(Text(feature, style: TextStyle(color: AppColors.textPrimary))),
        DataCell(
          Center(
            child: Text(
              free,
              style: TextStyle(
                color: free == '✓'
                    ? AppColors.success
                    : AppColors.textSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        DataCell(
          Center(
            child: Text(
              premium,
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
