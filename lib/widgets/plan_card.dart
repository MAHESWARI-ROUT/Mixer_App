import 'package:dating_app/models/app_colors.dart';
import 'package:flutter/material.dart';
import '../models/subscription_plan.dart';

class PlanCard extends StatelessWidget {
  final SubscriptionPlan plan;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isPinkTheme;
  const PlanCard({
    Key? key,
    required this.plan,
    required this.isSelected,
    required this.onTap,
    this.isPinkTheme = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected
                ? (isPinkTheme ? Colors.pink.shade300 : AppColors.goldApp)
                : Colors.grey.shade300,
            width: isSelected ? 1 : 0,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isSelected ? 0.1 : 0.05),
              blurRadius: isSelected ? 15 : 10,
              offset: Offset(0, isSelected ? 4 : 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitleWithBadge(),
            SizedBox(height: 8),
            _buildPrice(),
            SizedBox(height: 4),
            _buildDescription(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleWithBadge() {
    return Row(
      children: [
        Text(
          plan.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        if (plan.assetimage != null) ...[
          SizedBox(width: 8),
          Container(
            width: 24,
            height: 14,
            decoration: BoxDecoration(
              image: DecorationImage(image: plan.assetimage!,fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPrice() {
    return Text(
      plan.formattedPrice,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: isPinkTheme? AppColors.purpleApp:AppColors.darkyellow,
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      plan.description,
      style: TextStyle(fontSize: 12, color: Colors.grey[600], height: 1.3),
    );
  }
}
