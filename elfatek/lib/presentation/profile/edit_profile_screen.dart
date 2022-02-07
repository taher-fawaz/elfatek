import 'package:elfatek/features/auth/providers/user_provider.dart';

import '../../features/auth/providers/auth_provider.dart';
import 'widget/profile_widget.dart';
import 'widget/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  static String routeName = "/editProfile";

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: true).user;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Your Details  '),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath:
                'https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
            isEdit: true,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Full Name',
            text: userProvider.name!,
            onChanged: (name) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Email',
            text: userProvider.email!,
            onChanged: (email) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'ID',
            text: userProvider.id!.toString(),
            maxLines: 5,
            onChanged: (about) {},
          ),
        ],
      ),
    );
  }
}
