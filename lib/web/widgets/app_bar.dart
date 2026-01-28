import 'package:flutter/material.dart';

import '../constants/colors.dart';

class BalanceAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isTransparent;
  final VoidCallback? onLogoPressed;
  final int currentIndex;
  final Function(int) onItemTapped;

  const BalanceAppBar({
    super.key,
    this.isTransparent = false,
    this.onLogoPressed,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isTransparent
            ? Colors.transparent
            : BalanceColors.backgroundDark.withOpacity(0.95),
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: onLogoPressed ?? () => Navigator.pushNamed(context, '/home'),
                child: Row(
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
              ),
            ),

            // Desktop Navigation
            Row(
              children: [
                _NavItem(
                  label: 'Home',
                  index: 0,
                  currentIndex: currentIndex,
                  onTap: () => onItemTapped(0),
                ),
                const SizedBox(width: 32),
                _NavItem(
                  label: 'Products',
                  index: 1,
                  currentIndex: currentIndex,
                  onTap: () => onItemTapped(1),
                ),
                const SizedBox(width: 32),
                _NavItem(
                  label: 'Values',
                  index: 2,
                  currentIndex: currentIndex,
                  onTap: () => onItemTapped(2),
                ),
                const SizedBox(width: 32),
                _NavItem(
                  label: 'About',
                  index: 3,
                  currentIndex: currentIndex,
                  onTap: () => onItemTapped(3),
                ),
                const SizedBox(width: 32),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    gradient: BalanceColors.focusGradient,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => onItemTapped(4),
                      child: Text(
                        'Contact',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
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
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  final int index;
  final int currentIndex;
  final VoidCallback onTap;

  const _NavItem({
    required this.label,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = currentIndex == index;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: isSelected
                    ? BalanceColors.ledgerPrimary
                    : BalanceColors.textSecondary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
            const SizedBox(height: 4),
            if (isSelected)
              Container(
                width: 24,
                height: 3,
                decoration: BoxDecoration(
                  gradient: BalanceColors.ledgerGradient,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
          ],
        ),
      ),
    );
  }
}