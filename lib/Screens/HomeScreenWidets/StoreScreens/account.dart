import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghioon_seller/Providers/EditProfileProvider.dart';
import 'package:ghioon_seller/Providers/language_provider.dart';
import 'package:ghioon_seller/Screens/HomeScreenWidets/StoreScreens/AccountsWidgets/accountEdit.dart';
import 'package:ghioon_seller/Shared/language.dart';
import 'package:ghioon_seller/Shared/loading.dart';
import 'package:provider/provider.dart';

import '../../../Models/models.dart';
import '../../../Shared/customColors.dart';
import 'AccountsWidgets/ViewImageAndVideo.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<List<UserInformation>>(context);
    final appState = Provider.of<EditProfileData>(context);
    var languageprov = Provider.of<LanguageProvider>(context);
    return userInfo.isEmpty
        ? Loading()
        : Scaffold(
            appBar: AppBar(
                actions: [
                  GestureDetector(
                    onTap: () {
                      appState.image = '';
                      // appState.region = null;
                      // appState.zone = null;
                      appState.regionIndex =0;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountEdit(
                                  appState: appState,
                                  user: userInfo[0],
                                )),
                      );
                    },
                    child: Center(
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          // border: Border.all(
                          //     width: 1, color: Color.fromARGB(255, 255, 255, 255)),
                          color: CustomColors().white,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.penToSquare,
                            size: 25.0,
                            color: CustomColors().blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
                toolbarHeight: 100,
                centerTitle: true,
                title: Text(userInfo[0].businessName, //'Endale Abegazee',
                    style: TextStyle(
                        fontSize: 25.0,
                        color: CustomColors().white,
                        fontWeight: FontWeight.w500)),
                // excludeHeaderSemantics: true,
                backgroundColor: CustomColors().blue,
                // automaticallyImplyLeading: false,
                elevation: 5,
                iconTheme: IconThemeData(color: CustomColors().white)),
            body: ListView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                ViewImageAndVideo(
                  user: userInfo[0],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      containerWidget(userInfo[0].businessName,
                          Language().business_name[languageprov.LanguageIndex]),
                      containerWidget(userInfo[0].userName,
                          Language().sellername[languageprov.LanguageIndex]),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: containerWidget('',
                      //           Language().gender[languageprov.LanguageIndex]),
                      //     ),
                      //     const SizedBox(
                      //       width: 15,
                      //     ),
                      //     Expanded(
                      //       child: containerWidget(
                      //           'Jan 1 2022',
                      //           Language()
                      //               .birthdate[languageprov.LanguageIndex]),
                      //     ),
                      //   ],
                      // ),
                      containerWidget(userInfo[0].businessCategory.join(', '),
                          Language().businesstype[languageprov.LanguageIndex]),
                      containerWidget(userInfo[0].email,
                          Language().email[languageprov.LanguageIndex]),
                      containerWidget(userInfo[0].phoneNumber,
                          Language().phonenumber[languageprov.LanguageIndex]),
                      containerWidget(userInfo[0].businessNo,
                          Language().businessnum[languageprov.LanguageIndex]),
                      containerWidget(userInfo[0].region+ ', ' + userInfo[0].zone+ ', ' +userInfo[0].address,
                          Language().address[languageprov.LanguageIndex]),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  Widget textWidet(String text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.w500));
  }

  Widget containerWidget(String textContainer, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text,
              style: const TextStyle(
                  fontSize: 21.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w500)),
          Container(
            width: MediaQuery.of(context).size.width,
            // height: ,

            decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: const Color.fromARGB(255, 207, 207, 207)),
              color: CustomColors().white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(textContainer,
                  style: const TextStyle(
                      fontSize: 21.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }
}
