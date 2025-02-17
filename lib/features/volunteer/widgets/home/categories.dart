import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "All Categories",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.food_bank, size: 50, color: Colors.orange),
              onPressed: () {
                // Handle food donation action
                print("Food Donation Clicked");
              },
            ),
            IconButton(
              icon: Icon(
                Icons.bloodtype,
                size: 50,
                color: Colors.red,
              ),
              onPressed: () {
                // Handle blood donation action
                print("Blood Donation Clicked");
              },
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.tree,
                size: 45,
                color: Colors.teal[700]!,
              ),
              onPressed: () {
                // Handle tree plantation action
                print("Tree Plantation Clicked");
              },
            ),
            IconButton(
              icon: Icon(
                Icons.currency_rupee,
                size: 50,
                color: Colors.blue,
              ),
              onPressed: () {
                // Handle financial aid action
                print("Financial Aid Clicked");
              },
            ),
          ],
        ),
      ],
    );
  }
}
