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
                _buildLogo(context),
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
                  // FIXED: Wrapped in Builder to provide the correct context for Scaffold.of
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(
                        Icons.menu_rounded,
                        color: Colors.white,
                        size: 32,
                      ),
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                    ),
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
            Image.asset('assets/ledger_logo.png', height: 35, width: 35),
            const SizedBox(width: 12),
            Text(
              'BALANCE',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                letterSpacing: 3,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onItemTapped(4),
      style: ElevatedButton.styleFrom(
        backgroundColor: BalanceColors.focusPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text(
        'Contact',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white54,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
