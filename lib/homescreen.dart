import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_screen/Pages/explore.dart';
import 'package:sample_screen/Pages/inbox.dart';
import 'package:sample_screen/Pages/profile.dart';
import 'package:sample_screen/Pages/saved.dart';
import 'package:sample_screen/Pages/trip.dart';
import 'package:sample_screen/model.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<NavigationModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            _buildCurrentPage(navigationModel.selectedIndex),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildBottomNavigationBar(navigationModel),
            ),
            Positioned(
              bottom: 20,
              left: MediaQuery.of(context).size.width / 2 - 30,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TripPage()),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF5A5F),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 30),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Trip',
                      style: TextStyle(
                        color: const Color(0xFF686868),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentPage(int selectedIndex) {
    final pages = [
      ExplorePage(),
      SavedPage(),
      InboxPage(),
      ProfilePage(),
    ];
    return pages[selectedIndex];
  }

  Widget _buildBottomNavigationBar(NavigationModel navigationModel) {
    return Container(
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.search, "Explore", 0, navigationModel),
          _buildNavItem(Icons.favorite_outline, "Saved", 1, navigationModel),
          SizedBox(width: 60),
          _buildNavItem(Icons.message_outlined, "Inbox", 2, navigationModel),
          _buildNavItem(Icons.person_outline, "Profile", 3, navigationModel),
        ],
      ),
    );
  }

  Widget _buildNavItem(
      IconData icon, String label, int index, NavigationModel navigationModel) {
    return GestureDetector(
      onTap: () {
        navigationModel.updateIndex(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: navigationModel.selectedIndex == index
                ? const Color(0xFFFF5A5F)
                : const Color(0xFF686868),
            size: 30,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: navigationModel.selectedIndex == index
                  ? const Color(0xFFFF5A5F)
                  : const Color(0xFF686868),
              fontWeight: navigationModel.selectedIndex == index
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
