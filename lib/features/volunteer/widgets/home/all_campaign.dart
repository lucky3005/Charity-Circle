import 'package:charity_circle/core/images.dart';
import 'package:charity_circle/features/volunteer/widgets/home/card_campaign.dart';
import 'package:flutter/material.dart';

class AllCampaign extends StatelessWidget {
  const AllCampaign({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "All Campaign",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return DonationCampaignCard(
              imageUrl: AppImages.charityImage,
              title: "Donation for food",
              description: "Help ",
              raisedAmount: 500,
              goalAmount: 5000,
            );
          },
        ),
      ],
    );
  }
}
