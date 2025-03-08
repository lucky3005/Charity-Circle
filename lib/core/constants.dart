import 'package:flutter/material.dart';

class Constants with ChangeNotifier {

  int _allCampaignLength = 0;

  int get allCampaignLength => _allCampaignLength;

  void setAllCampaignLength(int len) {
    _allCampaignLength = len;
    notifyListeners();
  }
}
