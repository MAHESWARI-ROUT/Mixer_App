import 'package:dating_app/models/app_colors.dart';
import 'package:flutter/material.dart';
import '../models/subscription_plan.dart';
import '../data/subscription_data.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/plan_card.dart';
import '../widgets/feature_item.dart';
import '../widgets/subscription_button.dart';

class MixerSubscriptionPage extends StatefulWidget {
  @override
  _MixerSubscriptionPageState createState() => _MixerSubscriptionPageState();
}

class _MixerSubscriptionPageState extends State<MixerSubscriptionPage>
    with TickerProviderStateMixin {
  late SubscriptionPlan selectedPlan;
  bool isLoading = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    selectedPlan = SubscriptionData.plans[0];

    _animationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectPlan(SubscriptionPlan plan) {
    setState(() {
      selectedPlan = plan;
    });
  }

  Future<void> _handleSubscription() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    _showSubscriptionSuccess();
  }

  void _showSubscriptionSuccess() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Subscription Successful!'),
        content: Text('Welcome to ${selectedPlan.title}!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: Text('Continue'),
          ),
        ],
      ),
    );
  }

  bool get isPinkTheme => selectedPlan.id == 'mixer';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        gradient: LinearGradient(
          colors: isPinkTheme
              ? [AppColors.mixer, Colors.white]
              : [AppColors.mixerVip, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),

        title: 'Mixer',
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 32),
              _buildPlanCards(),
              SizedBox(height: 24),
              _buildFeaturesSection(),
              Spacer(),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Level Up Your Mixer Experience',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isPinkTheme ? AppColors.purpleApp : AppColors.darkyellow,
            height: 1.2,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Select a plan',
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildPlanCards() {
    return Row(
      children: SubscriptionData.plans.map((plan) {
        final isSelected = selectedPlan.id == plan.id;
        final isPinkTheme = plan.id == 'mixer' && isSelected;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: plan == SubscriptionData.plans.last ? 0 : 16,
            ),
            child: PlanCard(
              plan: plan,
              isSelected: isSelected,
              isPinkTheme: isPinkTheme,
              onTap: () => _selectPlan(plan),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFeaturesSection() {
    final isPinkTheme = selectedPlan.id == 'mixer';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border(
                bottom: BorderSide(
                  color: isPinkTheme
                      ? AppColors.pinkBorder
                      : AppColors.yelloboarder,
                      width: 1.0
                ),
                top: BorderSide(
                  color: isPinkTheme
                      ? AppColors.pinkBorder
                      : AppColors.yelloboarder,
                      width: 1.0
                ),
                left: BorderSide(
                  color: isPinkTheme
                      ? AppColors.pinkBorder
                      : AppColors.yelloboarder,
                      width: 1.0
                ),
                right: BorderSide(
                  color: isPinkTheme
                      ? AppColors.pinkBorder
                      : AppColors.yelloboarder,
                      width: 1.0
                ),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Included with ${selectedPlan.title}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        ...selectedPlan.features
            .map(
              (feature) => FeatureItem(text: feature, isPinkTheme: isPinkTheme),
            )
            .toList(),
      ],
    );
  }

  Widget _buildFooter() {
    final isPinkTheme = selectedPlan.id == 'mixer';
    return Column(
      children: [
        SubscriptionButton(
          price: selectedPlan.price,
          onPressed: _handleSubscription,
          isLoading: isLoading,
          isPinkTheme: isPinkTheme,
        ),
        Text(
          'By continuing, you agree to be charged, with auto-renewal until cancelled in App Store settings, under Mixer\'s Terms.',
          style: TextStyle(fontSize: 12, color: Colors.grey[500], height: 1.3),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
