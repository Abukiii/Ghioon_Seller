import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghioon_seller/Shared/constants.dart';
import 'package:ghioon_seller/Shared/customColors.dart';

class CollectionList extends StatelessWidget {
  CollectionList(
      {Key? key, required this.title, this.desc = '', required this.image})
      : super(key: key);
  final String title;
  String desc;
  var image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize().ScreenWidth(context) / 3.5,
      decoration: BoxDecoration(
        border: Border.all(
            width: 1, color: const Color.fromARGB(255, 224, 224, 224)),
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 24,
                color: CustomColors().blue,
                fontWeight: FontWeight.w700),
          ),
          leading: image[0] != ''
              ? ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: image[0],
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: Container(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.grey[300]!),
                            value: downloadProgress.progress),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                )
              : ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  child: Icon(
                    Icons.shop,
                    size: 50,
                  ),
                ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.penToSquare),
            iconSize: 40,
            color: CustomColors().blue,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Row(
              children: [
                Text(
                  desc.characters.length > 9
                      ? desc.replaceRange(10, desc.length, '...')
                      : desc,
                  style: TextStyle(
                      fontFamily: 'Inter',
                      color: CustomColors().black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const Text("."),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
