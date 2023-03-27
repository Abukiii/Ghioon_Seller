import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghioon_seller/Models/models.dart';
import 'package:ghioon_seller/Providers/language_provider.dart';
import 'package:ghioon_seller/Screens/HomeScreenWidets/StoreScreens/SettingPages/Feedback.dart';
import 'package:ghioon_seller/Screens/HomeScreenWidets/StoreScreens/SettingPages/Select_language.dart';
import 'package:ghioon_seller/Screens/HomeScreenWidets/StoreScreens/SettingPages/aboutUs.dart';
import 'package:ghioon_seller/Screens/HomeScreenWidets/StoreScreens/SettingPages/privacy_terms.dart';
import 'package:ghioon_seller/Shared/customColors.dart';
import 'package:ghioon_seller/Shared/language.dart';
import 'package:ghioon_seller/Shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:launch_review/launch_review.dart';
import '../../../Service/auth.dart';
import '../../../Service/registerDatabase.dart';
import '../../components/storeList.dart';
import 'package:ghioon_seller/Service//auth.dart';

import 'SettingPages/LogOut.dart';

class StoreSetting extends StatefulWidget {
  const StoreSetting({super.key});

  @override
  State<StoreSetting> createState() => _StoreSettingState();
}

class _StoreSettingState extends State<StoreSetting> {
  bool show = false;
  _showLogoutDialog(BuildContext context) {
    VoidCallback okCallBack = () => {
          // Navigator.of(context).pop(),
        };
    LogOutMessage alert = LogOutMessage();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final userInfo = Provider.of<List<UserInformation>>(context);
    var languageprov = Provider.of<LanguageProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: AppBar(
              centerTitle: true,
              title: Row(
                mainAxisSize: MainAxisSize.min,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(Language().setting[languageprov.LanguageIndex],
                      style: TextStyle(
                          fontSize: 30.0,
                          color: CustomColors().white,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              // excludeHeaderSemantics: true,
              backgroundColor: CustomColors().blue,
              // automaticallyImplyLeading: false,
              elevation: 5,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              iconTheme: IconThemeData(color: CustomColors().white)),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                      child: userInfo.isEmpty
                          ? SpinKitCircle(
                              color: CustomColors().blue,
                              size: 50.0,
                            )
                          : Switch(userInfo[0])),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      show = !show;
                    });
                  },
                  child: StoreList(
                      FontAwesomeIcons.solidUser,
                      Language().notification[languageprov.LanguageIndex],
                      width)),
            ],
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Terms()),
                );
              },
              child: StoreList(
                  FontAwesomeIcons.lock,
                  Language().Term_condition[languageprov.LanguageIndex],
                  width)),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LanguageSelectionPage()),
                );
              },
              child: StoreList(FontAwesomeIcons.lock,
                  Language().language[languageprov.LanguageIndex], width)),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FeedbackPage()),
                );
              },
              child: StoreList(FontAwesomeIcons.solidFile,
                  Language().feedback[languageprov.LanguageIndex], width)),
          GestureDetector(
              onTap: () {
                LaunchReview.launch(androidAppId: "com.ghioon.ghioon_seller");
              },
              child: StoreList(FontAwesomeIcons.arrowsSpin,
                  Language().upgrade[languageprov.LanguageIndex], width)),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutUs()),
                );
              },
              child: StoreList(FontAwesomeIcons.info,
                  Language().about[languageprov.LanguageIndex], width)),
          GestureDetector(
              onTap: () async {
                _showLogoutDialog(context);
              },
              child: StoreList(FontAwesomeIcons.rightFromBracket,
                  Language().logout[languageprov.LanguageIndex], width)),
        ],
      ),
    );
  }

  changeBool(bool notification, userUid) async {
    await RegisterDatabaseService(userUid: userUid)
        .updateNotification(notification);
  }

  Widget Switch(UserInformation userInfo) {
    var languageprov = Provider.of<LanguageProvider>(context);
    return AnimatedContainer(
      height: show ? 140 : 62,
      width: 200,
      duration: const Duration(milliseconds: 700),
      curve: Curves.bounceInOut,
      decoration: BoxDecoration(
        color: CustomColors().white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          show
              ? BoxShadow(
                  color: Colors.lightBlue.withOpacity(0.5),
                  spreadRadius: 0.05,
                  blurRadius: 3,
                  offset: const Offset(0, 4), // changes position of shadow
                )
              : BoxShadow(
                  color: Colors.lightBlue.withOpacity(0.0),
                  spreadRadius: 0.05,
                  blurRadius: 3,
                  offset: const Offset(0, 4), // changes position of shadow
                ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    changeBool(true, userInfo.documentId);
                  });
                },
                child: AnimatedContainer(
                  height: 50,
                  width: 75,
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.ease,
                  decoration: BoxDecoration(
                    color: userInfo.notification
                        ? CustomColors().blue
                        : Colors.grey.shade200,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(Language().on[languageprov.LanguageIndex],
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    changeBool(false, userInfo.documentId);
                  });
                },
                child: AnimatedContainer(
                  height: 50,
                  width: 75,
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.ease,
                  decoration: BoxDecoration(
                    color: !userInfo.notification
                        ? CustomColors().blue
                        : Colors.grey.shade200,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                  ),
                  child: Center(
                    child: Text(Language().off[languageprov.LanguageIndex],
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
            ],
          ),
          AnimatedContainer(
            height: show ? 15 : 0,
            width: 5,
            duration: const Duration(seconds: 1),
            curve: Curves.bounceInOut,
          ),
        ],
      ),
    );
  }
}
