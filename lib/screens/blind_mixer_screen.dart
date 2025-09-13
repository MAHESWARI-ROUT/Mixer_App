import 'package:dating_app/models/app_colors.dart';
import 'package:flutter/material.dart';

class BlindMixerScreen extends StatefulWidget {
  @override
  _BlindMixerScreenState createState() => _BlindMixerScreenState();
}

class _BlindMixerScreenState extends State<BlindMixerScreen> {
  bool hasApplied = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // Illustration
            Expanded(
              flex: 3,
              child: Container(
                child: _buildIllustration(),
              ),
            ),
            
            SizedBox(height: 32),
            
            Text(
              'Upcoming Blind Date',
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'ManRope',
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            
            SizedBox(height: 8),
            
            Text(
              'Let Mixer surprise you with a match',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'ManRope',
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            
            SizedBox(height: 24),
            
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
               
                borderRadius: BorderRadius.circular(8),
           
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.calendar_today, color: AppColors.darkPurple, size: 16),
                  SizedBox(width: 8),
                  Text(
                    'September 28 • 10 PM',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontFamily: 'ManRope',
                      fontWeight: FontWeight.w500,

                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 32),
            
            if (!hasApplied) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStepItem('Sign Up', true),
                  Container(
                    width: 20,
                    height: 1,
                    color: AppColors.darkPurple,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                  ),
                  _buildStepItem('Smart Match', true),
                  Container(
                    width: 20,
                    height: 1,
                    color: Colors.grey[300],
                    margin: EdgeInsets.symmetric(horizontal: 8),
                  ),
                  _buildStepItem('Blind Date', false),
                ],
              ),
              
              SizedBox(height: 32),
              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      hasApplied = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkPurple,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit, color: Colors.white, size: 18),
                      SizedBox(width: 8),
                      Text(
                        'Fill out the form',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'ManRope',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ] else ...[
              Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check, color: AppColors.darkPurple, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Applied for Blind Mixer',
                      style: TextStyle(
                        color: AppColors.darkPurple,
                        fontSize: 16,
                        fontFamily: 'ManRope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildIllustration() {
    return SizedBox(

      child: Image.asset('assets/images/image71.png')
    );
  }

  Widget _buildStepItem(String title, bool isCompleted) {
    return Column(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: isCompleted ? AppColors.darkPurple : Colors.grey[300],
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 10,
            color: isCompleted ? AppColors.darkPurple : Colors.grey[500],
            fontWeight: FontWeight.w500,
            fontFamily: 'ManRope'
          ),
        ),
      ],
    );
  }
}

class ArchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(20, size.height);
    path.quadraticBezierTo(size.width / 2, 20, size.width - 20, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
