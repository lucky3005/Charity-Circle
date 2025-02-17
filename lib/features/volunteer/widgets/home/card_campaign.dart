import 'package:charity_circle/components/elevated_button_custom.dart';
import 'package:charity_circle/core/colors.dart';
import 'package:flutter/material.dart';

class DonationCampaignCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double raisedAmount;
  final double goalAmount;

  const DonationCampaignCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.raisedAmount,
    required this.goalAmount,
  });

  @override
  Widget build(BuildContext context) {
    double progress = (raisedAmount / goalAmount).clamp(0.0, 1.0);

    return Card(
      
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Campaign Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              imageUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Campaign Title
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 5),

                // Campaign Description
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 10),

                // Progress Bar
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[300],
                  color: AppColors.chocolate,
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(5),
                ),

                SizedBox(height: 8),

                // Donation Progress
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Raised: \$${raisedAmount.toStringAsFixed(2)}",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Goal: \$${goalAmount.toStringAsFixed(2)}",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                // Donate Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButtonCustom(
                    onPressed: () {},
                    text: "Donate",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),


      
    );
  }
}
