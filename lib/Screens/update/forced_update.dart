import 'dart:io';
import 'dart:ui';
import 'package:launch_review/launch_review.dart';  
import 'package:flutter/material.dart';

import '../../Shared/customColors.dart';

class ForcedUpdate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
       filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(
            color:Colors.transparent,
            width: MediaQuery.of(context).size.width,
height: MediaQuery.of(context).size.height,
            child:
          Center(
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10),
          child: Container(
            height: 200.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade600,
                  blurRadius: 1.0, //effect of softening the shadow
                  spreadRadius: 0.5, //effecet of extending the shadow
                  offset: Offset(
                      0.0, //horizontal
                      1.0 //vertical
                      ),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0)),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 50,
                    child: Center(
                      child: Text('Ghioon Needs an Update',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey[700],
                          )),
                    ),
                  ),
                  Text('Please update the app to continue',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey[500],
                      )),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            exit(0);
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                              ),
                            ),
                            child: Center(
                              child: Text('Close',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.w300)),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () {
                            LaunchReview.launch(androidAppId: "com.ghioon.ghioon_seller");
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            decoration: BoxDecoration(
                              color: CustomColors().blue,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0)),
                            ),
                            child: Center(
                              child: Text('Update',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),),
    );
  }
}
