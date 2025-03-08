import 'package:charity_circle/core/constants.dart';
import 'package:charity_circle/features/volunteer/services/home_services/all_campaign_get_services.dart';
import 'package:charity_circle/features/volunteer/widgets/home/card_campaign.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllCampaign extends StatefulWidget {
  const AllCampaign({super.key});

  @override
  State<AllCampaign> createState() => _AllCampaignState();
}

class _AllCampaignState extends State<AllCampaign> {
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllCampaign() {
    AllCampaignGetServices allCampaignGetServices = AllCampaignGetServices();
    return allCampaignGetServices.fetchAllCampaign(context: context);
  }

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
        StreamBuilder(
          stream: getAllCampaign(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }

            if (!snapshot.hasData) {
              return Center(
                child: Text("No Campaign Added"),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            }
            final campaigns = snapshot.data!.docs;
            Provider.of<Constants>(
              context,
              listen: false,
            ).setAllCampaignLength(campaigns.length);

            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return DonationCampaignCard(
                  imageUrl: campaigns[index]["imageUrl"],
                  title: campaigns[index]["title"],
                  description: campaigns[index]["description"],
                  raisedAmount: campaigns[index]["raised"],
                  goalAmount: campaigns[index]["goal"],
                );
              },
            );
          },
        )
      ],
    );
  }
}
