import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mzady/screens/settings/settings_sections/about_section.dart';
import 'package:mzady/screens/settings/settings_sections/delivery_policy_section.dart';
import 'package:mzady/screens/settings/settings_sections/header_info_section.dart';
import 'package:mzady/screens/settings/settings_sections/history_uploaded.dart';
import 'package:mzady/screens/settings/settings_sections/history_winning/history_winning.dart';
import 'package:mzady/screens/settings/settings_sections/language_section.dart';
import 'package:mzady/screens/settings/settings_sections/logout_section.dart';
import 'package:mzady/screens/settings/settings_sections/messages/messages_screen.dart';
import 'package:mzady/screens/settings/settings_sections/style_section.dart';
import 'package:mzady/screens/settings/settings_sections/update_account_info/update_account_info.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xFFF1EFEF),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 50),
                child: HeaderInfoSection(),
              ),
              const UpdateAccountInfo(),
              const SizedBox(height: 8),
              InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .pushNamed(MessagesScreen.routeName);
                },
                child: Container(
                  color: Colors.white,
                  child: ListTile(
                    leading: const Icon(Icons.email),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Messages',
                          style: TextStyle(fontSize: 18),
                        ),
                        Icon(Icons.arrow_forward_ios_outlined),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              HistoryUploaded(),
              const SizedBox(height: 8),
              const HistoryWinning(),
              const SizedBox(height: 8),
              const StyleSection(),
              const SizedBox(height: 8),
              const LanguageSection(),
              const SizedBox(height: 8),
              const AboutSection(),
              const SizedBox(height: 8),
              const DeliveryPolicySection(),
              const SizedBox(height: 8),
              LogoutSection(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
