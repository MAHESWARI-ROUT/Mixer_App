import 'package:dating_app/models/app_colors.dart';
import 'package:flutter/material.dart';

class FeatureItem extends StatelessWidget {
  final String text;
  final bool isAnimated;
  final bool isPinkTheme;
  const FeatureItem({
    Key? key,
    required this.text,
    this.isAnimated = false, this.isPinkTheme = false ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            child: Icon(
              Icons.check,
              color: isPinkTheme? AppColors.darkPurple:AppColors.checkyellow,
              size: 20,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


