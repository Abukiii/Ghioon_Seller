import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghioon_seller/Models/models.dart';
import 'package:ghioon_seller/Providers/EditRangeProvider.dart';
import 'package:ghioon_seller/Screens/HomeScreenWidets/ProductScreens/Product/AddProductsWidgets/addProductDetailLogic/addProductDetailLogic.dart';
import 'package:ghioon_seller/Screens/HomeScreenWidets/ProductScreens/Product/ProductDetail/EditProduct.dart';
import 'package:ghioon_seller/Screens/components/alertDialog.dart';
import 'package:ghioon_seller/Service/Product/AddProductDatabase.dart';
import 'package:ghioon_seller/Shared/constants.dart';
import 'package:ghioon_seller/Shared/customColors.dart';
import 'package:ghioon_seller/Shared/dimensions.dart';
import 'package:provider/provider.dart';

import 'ProductView/CustomBarChart/BarChart.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
    required this.title,
    required this.stock,
    required this.image,
    required this.edit,
    required this.item,
    required this.index,
    // required this.view
  }) : super(key: key);

  final String title;
  final String stock;
  final List image;
  final bool edit;
  final int index;
  final item;
  // final List view;
 

  @override
  Widget build(BuildContext context) {
     Deletedialog(var docuid, var userId) {
    
    PopupDialog alert =
        PopupDialog("Are You Sure you want to Delete the product?", () {
     // print(appState.isLoading);
      AddProductDatabase()
          .deleteProduct(docuid, userId)
          .then((value) => print("Deleted"));//appState.isLoading = false);
    }, () {
      Navigator.pop(context);
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
        // height: ScreenSize().ScreenWidth(context) / 3.5,
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
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 10,
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
                child: Container(
                  //image
                  width: ScreenSize().ScreenWidth(context) / 3.5,
                  height: ScreenSize().ScreenWidth(context) / 3.5,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  child: image[0] != ''
                      ? ClipRRect(
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
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
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        )
                      : Center(
                          child: Icon(
                            Icons.newspaper_rounded,
                            size: 10,
                            color: Colors.grey[400],
                          ),
                        ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            color: CustomColors().blue,
                            fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Row(
                          children: [
                            Text(
                              stock.toString(),
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: CustomColors().black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            const Text(" In Stock"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              edit
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          IconButton(
                          onPressed: () {
                            Provider.of<EditRangeData>(context, listen: false)
                                .removeallcontrollers();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BarChartProductView(
                                      views: item.viewsTime)),
                            );
                          },
                          icon: const Icon(Icons.remove_red_eye),
                          iconSize: Dimensions.width30,
                          color: CustomColors().grey,
                        ),
                        IconButton(
                          onPressed: () {
                            Provider.of<EditRangeData>(context, listen: false)
                                .removeallcontrollers();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProduct(
                                        product: item,
                                        index: index,
                                      )),
                            );
                          },
                          icon: const Icon( Icons.edit),
                          iconSize: Dimensions.width30,
                          color: CustomColors().blue,
                        ),
                      
                         IconButton(
                          onPressed: () {
                          
                                 //AddProductDatabase().deleteProduct(item.docUid);
                            Deletedialog(item.productId, item.userUid);
                          },
                          icon: const Icon( Icons.delete),
                          iconSize: Dimensions.width30,
                          color: CustomColors().red,
                        ),
                      ],
                    )
                  : IconButton(
                      onPressed: () {},
                      icon: const Icon(FontAwesomeIcons.xmark),
                      iconSize: 40,
                      color: CustomColors().blue,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
