import 'package:flutter/material.dart';
import '../models/subscription_plan.dart';

class SubscriptionData {
  static const List<String> mixerFeatures = [
    'Unlimited Likes',
    'See who liked you',
    'Find people with wide range',
    'Access to events',
  ];

  static const List<String> vipFeatures = [
    'Unlimited Likes',
    'See who liked you',
    'Find people with wide range',
    'Access to events',
    'VIP seating, food & beverages',
  ];

  static final List<SubscriptionPlan> plans = [
    SubscriptionPlan(
      id: 'mixer',
      title: 'Mixer',
      price: 24.99,
      description: 'All of the below',
      assetimage: AssetImage('assets/images/Frame1171278649.png'),
      features: mixerFeatures,
    ),
    SubscriptionPlan(
      id: 'mixer_vip',
      title: 'Mixer VIP',
      price: 99.99,
      description: 'Mixer + VIP seating,\nfood & beverages',
      assetimage: AssetImage('assets/images/yell_heart.png'),
      features: vipFeatures,
    ),
  ];
}
