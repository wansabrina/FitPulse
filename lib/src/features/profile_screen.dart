import 'package:fitpulse/src/common_widgets/bottom_bar.dart';
import 'package:fitpulse/src/constants/colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: 160,
            color: blue500,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  bottom: 30,
                  top: 0,
                  child: Image.asset(
                    'assets/images/whitelogo.png',
                    width: 140,
                    height: 200,
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 100.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(0, 0),
                        blurRadius: 2,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: const Row(
                    children: [
                      CircleAvatar(
                        radius: 23,
                        backgroundImage:
                        AssetImage('assets/images/profile.png'),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kendall Roy',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '@kendallroy',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
              
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(0, 0),
                        blurRadius: 2,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.emoji_events,
                              color: Colors.amber, size: 22),
                          const SizedBox(width: 5),
                          const Text(
                            'Badges',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: '2',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: blue500,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                TextSpan(
                                  text: '/30',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildBadgeItem(
                            'assets/images/bronze.png',
                            false,
                          ),
                          _buildBadgeItem(
                            'assets/images/silver.png',
                            false,
                          ),
                          _buildBadgeItem(
                            'assets/images/gold.png',
                            true,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: blue500,
                            size: 30,
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                    
                      Row(
                        children: [
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: '400',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: black,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                TextSpan(
                                  text: '/1000 hours exercising for gold',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          const Image(
                            image: AssetImage('assets/images/gold.png'),
                            width: 24,
                            height: 24,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: 0.4,
                          backgroundColor: Colors.grey[200],
                          valueColor:
                          const AlwaysStoppedAnimation<Color>(blue500),
                          minHeight: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              
                _buildMenuItem(
                  icon: Icons.person,
                  label: 'Profile',
                  onTap: () {
                  
                  },
                ),
                _buildMenuItem(
                  icon: Icons.notifications,
                  label: 'Notifications',
                  onTap: () {
                  
                  },
                ),
                _buildMenuItem(
                  icon: Icons.lock,
                  label: 'Privacy & Security',
                  onTap: () {
                  
                  },
                ),
                _buildMenuItem(
                  icon: Icons.settings,
                  label: 'Preferences',
                  onTap: () {
                  
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 3),
    );
  }

  Widget _buildBadgeItem(String assetPath, bool isLocked) {
    return Container(
      width: 85, 
      height: 85,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isLocked ? Colors.grey[300] : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 5,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.center, 
        child: Image.asset(
          assetPath,
          width: 65, 
          height: 65,
          color: isLocked ? Colors.grey : null,
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required Function onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: blue500,
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      onTap: () => onTap(),
    );
  }
}
