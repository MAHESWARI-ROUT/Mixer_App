import 'package:dating_app/models/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedPhotoIndex = 0;

  final List<String> photos = [
    'assets/images/Image(1).png',
    'assets/images/Image(2).png',
    'assets/images/Image(3).png',
    'assets/images/Image(4).png',
    'assets/images/Image(5).png',
    'assets/images/Image(1).png',
  ];

  final List<String> avatarPhotos = [
    'assets/images/Avatar.png',
    'assets/images/Avatar(1).png',
    'assets/images/Avatar(2).png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'ManRope',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Photo Grid Section
            Container(
              height: 280,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.8,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPhotoIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: selectedPhotoIndex == index
                            ? Border.all(color: Color(0xFF7B68EE), width: 3)
                            : null,
                        image: DecorationImage(
                          image: AssetImage(photos[index]),
                        ),
                      ),
                      child: Stack(
                        children: [
                          if (index == 0)
                            Positioned(
                              top: 8,
                              left: 8,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'Main',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 16),

           
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Details',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'ManRope',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 15,),
            // Profile Fields
            _buildProfileField('What are you looking for?', Icons.search),
            _buildProfileField('Gender', Icons.person_outline),
            _buildProfileField('Birthday (Age)', Icons.cake_outlined),
            _buildProfileField('Height', Icons.height),
            _buildProfileField('Interested in?', Icons.favorite_outline),
            _buildProfileField('Sexuality', Icons.favorite_outline),
            _buildProfileField('Relationship', Icons.people_outline),
            _buildProfileField('Ethnicity', Icons.public),
            _buildProfileField('Kids', Icons.child_care),
            _buildProfileField('Drinking', Icons.local_bar_outlined),
            _buildProfileField('Smoking', Icons.smoke_free),
            _buildProfileField('Marijuana', Icons.local_florist),
            _buildProfileField('Religion & beliefs', Icons.church),
            _buildProfileField('Political Views', Icons.how_to_vote),
            _buildProfileField('Interests and hobbies', Icons.sports_esports),
            _buildProfileField('Values & Lifestyle', Icons.favorite),

            SizedBox(height: 32),

            // Perfect Match Section
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Discover your Perfect Match',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'ManRope',
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: avatarPhotos
                        .map(
                          (photo) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(photo),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkPurple,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Take the quiz again',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'ManRope',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField(String title, IconData icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[600], size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontFamily: 'ManRope',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.grey[400], size: 20),
        ],
      ),
    );
  }
}
