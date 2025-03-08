import 'package:charity_circle/components/list_tile.dart';
import 'package:charity_circle/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class UserData extends StatefulWidget {
  const UserData({
    super.key,
  });

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            CustomListTile(
              icon: CupertinoIcons.person,
              title:
                  provider.getUser.name == "" ? "Name" : provider.getUser.name,
            ),
            CustomListTile(
              icon: CupertinoIcons.envelope,
              title: provider.getUser.email == ""
                  ? "Email"
                  : provider.getUser.email,
            ),
            CustomListTile(
              icon: CupertinoIcons.phone,
              title: "123456789",
              //TODO
            ),
            Consumer<UserProvider>(
              builder: (context, provider, child) {
                return CustomListTile(
                  icon: provider.getUser.type == "volunteer"
                      ? FontAwesomeIcons.handHoldingHeart
                      : provider.getUser.type == "charity"
                          ? FontAwesomeIcons.peopleGroup
                          // ignore: deprecated_member_use
                          : FontAwesomeIcons.search,
                  title: provider.getUser.type == ""
                      ? "You are a"
                      : provider.getUser.type,
                );
              },
            )
          ],
        );
      },
    );
  }
}
