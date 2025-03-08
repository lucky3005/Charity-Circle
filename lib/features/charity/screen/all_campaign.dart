
import 'package:charity_circle/components/elevated_button_custom.dart';
import 'package:charity_circle/components/text_form_field_custom.dart';

import 'package:charity_circle/features/charity/services/all_campaign_add_services.dart';
import 'package:charity_circle/utils/utils.dart';
import 'package:flutter/material.dart';

class AllCampaign extends StatefulWidget {
  static const String routeName = "all-campaign";
  const AllCampaign({super.key});

  @override
  State<AllCampaign> createState() => AllCampaignState();
}

class AllCampaignState extends State<AllCampaign> {
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _goalController = TextEditingController();
  final TextEditingController _raisedController = TextEditingController();
  final _campaignFormKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _imageUrlController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _goalController.dispose();
    _raisedController.dispose();
    super.dispose();
  }

  bool isLoading = false;

  Future<void> addData() async {
    setState(() {
      isLoading = true;
    });
    AllCampaignAddServices allCampaignAddServices =
        AllCampaignAddServices();
    await allCampaignAddServices.addData(
      context: context,
      imageUrl: _imageUrlController.text,
      title: _titleController.text,
      description: _descriptionController.text,
      goal: double.parse(_goalController.text),
      raised: double.parse(_raisedController.text),
    );
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emergency Help"),
      ),
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 600,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: _campaignFormKey,
              child: SingleChildScrollView(
                child: Column(
                  spacing: 15,
                  children: [
                    TextFormFieldCustom(
                      controller: _imageUrlController,
                      icon: Icon(Icons.image_outlined),
                      hintText: "Image URL",
                    ),
                    TextFormFieldCustom(
                      controller: _titleController,
                      icon: Icon(Icons.title),
                      hintText: "Title",
                    ),
                    TextFormFieldCustom(
                      controller: _descriptionController,
                      icon: Icon(Icons.description_outlined),
                      hintText: "Description",
                    ),
                    TextFormFieldCustom(
                      controller: _goalController,
                      icon: Icon(Icons.track_changes_outlined),
                      hintText: "Goal",
                    ),
                    TextFormFieldCustom(
                      controller: _raisedController,
                      icon: Icon(Icons.bar_chart_outlined),
                      hintText: "Raised",
                    ),
                    isLoading
                        ? CircularProgressIndicator.adaptive()
                        : ElevatedButtonCustom(
                            onPressed: () {
                              if (_campaignFormKey.currentState!.validate()) {
                                Utils.alertDialogue(
                                  context: context,
                                  title: "Alert!",
                                  content:
                                      "Chack the data carefully you can't edit it again.",
                                  onPressed: () {
                                    Navigator.pop(context);
                                    addData();
                                  },
                                );
                              }
                            },
                            text: "Upload",
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
