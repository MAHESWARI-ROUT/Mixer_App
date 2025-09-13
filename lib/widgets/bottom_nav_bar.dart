import 'package:dating_app/models/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(PhosphorIcons.circleNotch(), 0),
          _buildNavItem(PhosphorIcons.heart(), 1),
          _buildNavItem(PhosphorIcons.calendar (), 2),
          _buildNavItem(PhosphorIcons.eye(), 3),
          _buildNavItem(Icons.person_2_outlined, 4),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Icon(
          icon,
          size: 28,
          color: isSelected ? AppColors.purpleApp : Colors.grey[400],
        ),
      ),
    );
  }
}
