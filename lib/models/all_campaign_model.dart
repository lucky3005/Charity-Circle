class AllCampaignModel {
  final String imageUrl;
  final String title;
  final String description;
  final double goal;
  final double raised;

  AllCampaignModel({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.goal,
    required this.raised,
  });

  factory AllCampaignModel.fromDoc(Map<String, dynamic> doc) {
    return AllCampaignModel(
      imageUrl: doc["imageUrl"],
      title: doc["title"],
      description: doc["description"],
      goal: doc["goal"],
      raised: doc["raised"],
    );
  }

  Map<String, dynamic> toDoc() {
    return {
      "imageUrl": imageUrl,
      "title": title,
      "description": description,
      "goal": goal,
      "raised": raised,
    };
  }
}
