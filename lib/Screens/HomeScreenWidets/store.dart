// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghioon_seller/Screens/HomeScreenWidets/StoreScreens/StoreProfile/store_profile.dart';
import 'package:ghioon_seller/Screens/HomeScreenWidets/StoreScreens/account.dart';
import 'package:ghioon_seller/Screens/HomeScreenWidets/StoreScreens/AccountsWidgets/accountEdit.dart';
import 'package:ghioon_seller/Screens/HomeScreenWidets/StoreScreens/customers.dart';
import 'package:ghioon_seller/Screens/HomeScreenWidets/StoreScreens/marketing.dart';
import 'package:ghioon_seller/Screens/HomeScreenWidets/StoreScreens/setting.dart';
import 'package:ghioon_seller/Screens/components/SnackBar.dart';
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

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<List<UserInformation>>(context);
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
                      Text('Store',
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
                            Text('My Store',
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
                        FontAwesomeIcons.solidUser, 'My Account', width)),
                GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const Customers()),
                      // );
                      snackBar(context, 'No Customers yet.', CustomColors().blue, CustomColors().white);
                    },
                    child: StoreList(
                        FontAwesomeIcons.solidUser, 'Customers', width)),
                GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const Analytics()),
                      // );
                      snackBar(context, 'No Analytics yet.', CustomColors().blue, CustomColors().white);
                    },
                    child: StoreList(
                        FontAwesomeIcons.chartPie, 'Analytics', width)),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Marketing()),
                      );
                    },
                    child: StoreList(
                        FontAwesomeIcons.bullhorn, 'Maketing', width)),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StoreSetting()),
                      );
                    },
                    child: StoreList(FontAwesomeIcons.gear, 'Setting', width)),
                GestureDetector(
                    onTap: () {
                      support(context);
                    },
                    child: StoreList(FontAwesomeIcons.solidCircleQuestion,
                        'Support', width)),
              ],
            ),
          );
  }
}
