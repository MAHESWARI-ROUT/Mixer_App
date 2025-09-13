import 'package:flutter/material.dart';

class UserProfile {
  final String id;
  final String name;
  final String imageUrl;
  final Color? gradientColor;

  const UserProfile({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.gradientColor,
  });
}