import 'package:flutter/material.dart';
import '../models/user_profile.dart';

class UserData {
  static final List<UserProfile> nearbyUsers = [
    UserProfile(
      id: '1',
      name: 'Alex',
      imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
      gradientColor: Colors.pink[200],
    ),
    UserProfile(
      id: '2',
      name: 'Sarah',
      imageUrl: 'https://images.unsplash.com/photo-1494790108755-2616b612035e?w=150',
      gradientColor: Colors.blue[200],
    ),
    UserProfile(
      id: '3',
      name: 'Emma',
      imageUrl: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150',
      gradientColor: Colors.orange[200],
    ),
  ];
}
