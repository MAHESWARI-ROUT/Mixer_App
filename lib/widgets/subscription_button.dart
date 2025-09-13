import 'package:dating_app/models/app_colors.dart';
import 'package:flutter/material.dart';

class SubscriptionButton extends StatelessWidget {
  final double price;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isPinkTheme;

  const SubscriptionButton({
    Key? key,
    required this.price,
    required this.onPressed,
    this.isLoading = false,
    this.isPinkTheme = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gradientColors = isPinkTheme
        ? [AppColors.darkPurple, AppColors.redApp]
        : [AppColors.goldApp, AppColors.yellowApp];

    return Container(
      width: double.infinity,
      height: 45,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, 
          shadowColor: Colors.transparent,     
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.credit_card, color: Colors.white, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Continue - \$${price.toStringAsFixed(2)} total',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
