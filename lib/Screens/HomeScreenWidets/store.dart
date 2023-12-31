// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghioon_seller/Providers/language_provider.dart';
import 'package:ghioon_seller/Screens/HomeScreenWidets/StoreScreens/SettingPages/LogOut.dart';
import 'package:ghioon_seller/Screens/HomeScreenWidets/StoreScreens/StoreProfile/store_profile.dart';
import 'package:ghioon_seller/Screens/HomeScreenWidets/StoreScreens/account.dart';
import 'package:ghioon_seller/Screens/HomeScreenWidets/StoreScreens/AccountsWidgets/accountEdit.dart';
import 'package:ghioon_seller/Screens/HomeScreenWidets/StoreScreens/customers.dart';
import 'package:ghioon_seller/Screens/HomeScreenWidets/StoreScreens/marketing.dart';
import 'package:ghioon_seller/Screens/HomeScreenWidets/StoreScreens/setting.dart';
import 'package:ghioon_seller/Screens/components/SnackBar.dart';
import 'package:ghioon_seller/Shared/language.dart';
import 'package:provider/provider.dart';

import '../../Models/models.dart';
import '../../Shared/customColors.dart';
import '../../Shared/loading.dart';
import '../components/storeList.dart';
import 'StoreScreens/analytics.dart';
import 'StoreScreens/support.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  support(BuildContext context) {
    Support alert = Support();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
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
    final userInfo = Provider.of<List<UserInformation>>(context);
    var languageprov = Provider.of<LanguageProvider>(context);
    double width = MediaQuery.of(context).size.width;
    return userInfo.isEmpty
        ? Loading()
        : Scaffold(
            // drawer: Drawer(),
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(70.0),
              child: AppBar(
                  centerTitle: true,
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(Language().store[languageprov.LanguageIndex],
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 30.0,
                              color: CustomColors().white,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                  // excludeHeaderSemantics: true,
                  backgroundColor: CustomColors().blue,
                  // automaticallyImplyLeading: false,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                  ),
                  iconTheme: IconThemeData(color: CustomColors().white)),
            ),
            body: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StoreProfile()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      // height: ,

                      decoration: BoxDecoration(
                        // border: Border.all(width: 1, color: Colors.black),
                        color: CustomColors().blue,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(Language().mystore[languageprov.LanguageIndex],
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 30.0,
                                    color: CustomColors().white,
                                    fontWeight: FontWeight.w600)),
                            Text(userInfo[0].userName,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18.0,
                                    color: CustomColors().white,
                                    fontWeight: FontWeight.w400)),
                            Text('Id: ' + userInfo[0].GhioonId,
                                style: TextStyle(
                                    fontSize: 17.0,
                                    color: CustomColors().white,
                                    fontWeight: FontWeight.w200)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Account()),
                      );
                    },
                    child: StoreList(
                        FontAwesomeIcons.solidUser,
                        Language().my_account[languageprov.LanguageIndex],
                        width)),
                GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const Customers()),
                      // );
                      snackBar(
                          context,
                          Language().no_customers[languageprov.LanguageIndex],
                          CustomColors().blue,
                          CustomColors().white);
                    },
                    child: StoreList(
                        FontAwesomeIcons.solidUser,
                        Language().customers[languageprov.LanguageIndex],
                        width)),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Analytics()),
                      );
                    },
                    child: StoreList(
                        FontAwesomeIcons.chartPie,
                        Language().analytics[languageprov.LanguageIndex],
                        width)),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Marketing()),
                      );
                    },
                    child: StoreList(
                        FontAwesomeIcons.bullhorn,
                        Language().promotion[languageprov.LanguageIndex],
                        width)),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StoreSetting()),
                      );
                    },
                    child: StoreList(FontAwesomeIcons.gear,
                        Language().setting[languageprov.LanguageIndex], width)),
                GestureDetector(
                    onTap: () {
                      support(context);
                    },
                    child: StoreList(FontAwesomeIcons.solidCircleQuestion,
                        Language().support[languageprov.LanguageIndex], width)),
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
}
