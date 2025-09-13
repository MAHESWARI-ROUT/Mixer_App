import 'package:flutter/material.dart';

class SubscriptionPlan {
  final String id;
  final String title;
  final double price;
  final String description;
  final ImageProvider? assetimage;
  final List<String> features;

  const SubscriptionPlan({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    this.assetimage,
    required this.features,
  });

  String get formattedPrice => '\$${price.toStringAsFixed(2)}';
}
