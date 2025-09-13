import 'package:flutter/material.dart';
import '../models/user_profile.dart';

class ProfileAvatar extends StatelessWidget {
  final UserProfile user;
  final double size;

  const ProfileAvatar({
    Key? key,
    required this.user,
    this.size = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            user.gradientColor ?? Colors.grey[300]!,
            Colors.white,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(3),
        child: ClipOval(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person,
              size: size * 0.6,
              color: Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}
