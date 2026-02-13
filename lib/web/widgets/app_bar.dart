import 'dart:ui';
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
    final bool isMobile = MediaQuery.of(context).size.width < 800;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: isTransparent
                ? Colors.transparent
                : BalanceColors.backgroundDark.withOpacity(0.7),
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withOpacity(0.08),
                width: 1,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 60,
              vertical: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo Section
                _buildLogo(context),

                // Navigation
                if (!isMobile)
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
                      const SizedBox(width: 40),
                      _buildContactBtn(context),
                    ],
                  )
                else
                  IconButton(
                    icon: const Icon(
                      Icons.menu_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onLogoPressed ?? () => Navigator.pushNamed(context, '/home'),
        child: Row(
          children: [
            Hero(
              tag: 'logo',
              child: Image.asset('assets/logo.png', height: 35, width: 35),
            ),
            const SizedBox(width: 12),
            Text(
              'BALANCE LABS',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
                letterSpacing: 3,
                foreground: Paint()
                  ..shader = BalanceColors.ledgerGradient.createShader(
                    const Rect.fromLTWH(0, 0, 200, 70),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactBtn(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: BalanceColors.focusPrimary.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () => onItemTapped(4),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
        child: Ink(
          decoration: BoxDecoration(
            gradient: BalanceColors.focusGradient,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            constraints: const BoxConstraints(minWidth: 100, minHeight: 45),
            alignment: Alignment.center,
            child: const Text(
              'Contact',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected
                    ? BalanceColors.ledgerSecondary
                    : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : BalanceColors.textSecondary,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
