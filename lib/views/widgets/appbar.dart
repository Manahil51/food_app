import 'package:final_hackathon/utils/color.dart';
import 'package:final_hackathon/views/categories/checkout.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      leading: IconButton(
        icon: Icon(Icons.menu, size: 30),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.bike_scooter_rounded, size: 30),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TrackOrderPage(),
              ),
            );
          },
        ),
        SizedBox(width: 20),
        IconButton(
          icon: Icon(Icons.directions_walk_sharp, size: 30),
          onPressed: () {
            // Define your onPressed action here
          },
        ),
      ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient:
              AppColors.primaryGradient, // Use gradient from your colors file
        ),
        child: const Align(
          alignment: Alignment.centerLeft, // Align text to the left
          child: Padding(
            padding:
                EdgeInsets.only(left: 60), // Add padding from the left edge
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text to start of column
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Delivery",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey, // Adjust color if needed
                  ),
                ),
                SizedBox(height: 5), // Space between texts
                Text(
                  "Track your orders",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white, // Adjust color if needed
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(100); // Match the height defined
}
