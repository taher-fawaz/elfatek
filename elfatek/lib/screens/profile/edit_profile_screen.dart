import 'package:elfatek/controller/provider/auth_provider.dart';
import 'package:elfatek/screens/profile/widget/profile_widget.dart';
import 'package:elfatek/screens/profile/widget/textfield_widget.dart';
import 'package:elfatek/utils/components/app_bar.dart';
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
    final user = Provider.of<AuthProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Your Details  '),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        physics: BouncingScrollPhysics(),
        children: [
          // ProfileWidget(
          //   imagePath: user.imagePath,
          //   isEdit: true,
          //   onClicked: () async {},
          // ),
          // const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Full Name',
            text: user.name!,
            onChanged: (name) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Email',
            text: user.email!,
            onChanged: (email) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'ID',
            text: user.id!.toString(),
            maxLines: 5,
            onChanged: (about) {},
          ),
        ],
      ),
    );
  }
}
