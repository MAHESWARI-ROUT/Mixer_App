import 'package:dating_app/models/app_colors.dart';
import 'package:flutter/material.dart';
import '../data/user_data.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/filter_chip_widget.dart';
import 'mixer_subscription_page.dart';
import 'profile_screen.dart';
import 'blind_mixer_screen.dart';

class MixerMainPage extends StatefulWidget {
  @override
  _MixerMainPageState createState() => _MixerMainPageState();
}

class _MixerMainPageState extends State<MixerMainPage>
    with TickerProviderStateMixin {
  int selectedNavIndex = 0;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  void _navigateToSubscription() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MixerSubscriptionPage(),
      ),
    );
  }

  void _navigateToProfile() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProfileScreen(),
      ),
    );
  }

  void _navigateToBlindMixer() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlindMixerScreen(),
      ),
    );
  }

  Widget _getCurrentScreen() {
    switch (selectedNavIndex) {
      case 0:
        return _buildMainContent();
      case 1:
        return _buildMainContent();
      case 2:
        return _buildMainContent(); 
      case 3:
        return BlindMixerScreen(); 
      case 4:
        return ProfileScreen(); 
      default:
        return _buildMainContent();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: selectedNavIndex == 3 || selectedNavIndex == 4 
          ? _getCurrentScreen()  
          : Column(
              children: [
                _buildFilterRow(),
                Expanded(
                  child: _getCurrentScreen(),
                ),
              ],
            ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: selectedNavIndex,
        onTap: (index) {
          setState(() {
            selectedNavIndex = index;
          });
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    String title = 'Mixer';
    if (selectedNavIndex == 3) title = 'Blind Mixer';
    if (selectedNavIndex == 4) title = 'Profile';

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontFamily: 'Oneset',
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        IconButton(
          icon: Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.offline_bolt_outlined,
              color: AppColors.purpleApp,
              size: 20,
            ),
          ),
          onPressed: _navigateToSubscription,
        ),
        IconButton(
          icon: Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications_none_outlined,
              color: AppColors.purpleApp,
              size: 20,
            ),
          ),
          onPressed: () {},
        ),
        SizedBox(width: 8),
      ],
    );
  }
  Widget _buildFilterRow() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: FilterChipsRow(), 
    ),
  );
}


 

  Widget _buildMainContent() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(height: 40),
          _buildProfilesStack(),
          SizedBox(height: 60),
          _buildEmptyStateMessage(),
          SizedBox(height: 40),
          _buildAdjustLocationButton(),
          
        ],
      ),
    );
  }

  Widget _buildProfilesStack() {
    
    final List<String> assetImages = [
      'assets/images/Avatar.png',
      'assets/images/Avatar(1).png', 
      'assets/images/Avatar(2).png',
    ];

    return SizedBox(
      height: 160,
      child: Stack(
        alignment: Alignment.center,
        children: assetImages.asMap().entries.map((entry) {
          final index = entry.key;
          final imagePath = entry.value;
          final offset = (index - 1) * 40.0;
          
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            transform: Matrix4.translationValues(offset, 0, 0),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                      ),
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.grey[600],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildEmptyStateMessage() {
    return Column(
      children: [
        Text(
          "You've seen everyone nearby",
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'ManRope',
            fontWeight: FontWeight.w700,

            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          "No more profiles in your area. Check back later or expand your location to see more people.",
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'ManRope',
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
            height: 1.4,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildAdjustLocationButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          elevation: 0,
        ),
        child: Text(
          'Adjust Location',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontFamily: 'ManRope'
          ),
        ),
      ),
    );
  }
}