import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String tagline;
  final String description;
  final IconData icon;
  final Gradient gradient;
  final List<String> features;
  final VoidCallback onLearnMore;
  final VoidCallback onGetApp;

  const ProductCard({
    super.key,
    required this.title,
    required this.tagline,
    required this.description,
    required this.icon,
    required this.gradient,
    required this.features,
    required this.onLearnMore,
    required this.onGetApp,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 700;

    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: EdgeInsets.all(isMobile ? 24 : 48),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.03),
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: Colors.white.withOpacity(0.08)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context, isMobile),
              const SizedBox(height: 32),
              Text(
                description,
                style: TextStyle(
                  color: BalanceColors.textSecondary,
                  fontSize: 18,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 40),
              _buildFeaturesGrid(isMobile),
              const SizedBox(height: 48),
              _buildActions(isMobile),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isMobile) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: gradient.colors.first.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: gradient.colors.first.withOpacity(0.2),
                blurRadius: 20,
              ),
            ],
          ),
          child: Icon(icon, color: gradient.colors.first, size: 40),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 28 : 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                tagline,
                style: TextStyle(
                  color: gradient.colors.first,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturesGrid(bool isMobile) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: features.map((f) => _FeatureChip(f, gradient)).toList(),
    );
  }

  Widget _buildActions(bool isMobile) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        _ActionButton(
          label: 'Get App',
          onTap: onGetApp,
          gradient: gradient,
          icon: Icons.download_rounded,
        ),
        _ActionButton(
          label: 'Learn More',
          onTap: onLearnMore,
          isOutlined: true,
          icon: Icons.arrow_forward_rounded,
        ),
      ],
    );
  }
}

class _FeatureChip extends StatelessWidget {
  final String label;
  final Gradient gradient;
  const _FeatureChip(this.label, this.gradient);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              gradient: gradient,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Gradient? gradient;
  final bool isOutlined;
  final IconData icon;

  const _ActionButton({
    required this.label,
    required this.onTap,
    this.gradient,
    this.isOutlined = false,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        decoration: BoxDecoration(
          gradient: isOutlined ? null : gradient,
          borderRadius: BorderRadius.circular(16),
          border: isOutlined ? Border.all(color: Colors.white24) : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            Icon(icon, color: Colors.white, size: 18),
          ],
        ),
      ),
    );
  }
}
