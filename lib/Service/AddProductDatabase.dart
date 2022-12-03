import 'package:cloud_firestore/cloud_firestore.dart';

class AddProductDatabase {
  var userUid;
  AddProductDatabase({this.userUid});
  final CollectionReference sellersProduct =
      FirebaseFirestore.instance.collection('Sellers');

  Future addProduct(
    String name,
    String description,
    bool fixed,
    List<double> price,
    List<int> rangeTo,
    List<int> rangeFrom,
    double rating,
    String category,
    List<String> image,
    bool inStock,
    int quantity,
    var userUid,
  ) async {
    sellersProduct
        .where('userUid', isEqualTo: userUid)
        .get()
        .then((docs) async {
      if (!docs.docs.isEmpty) {
        DocumentReference ref =
            await sellersProduct.doc(userUid).collection('Products').doc();
        return await sellersProduct
            .doc(userUid)
            .collection('Products')
            .doc(ref.id)
            .set({
              'created': Timestamp.now(),
              'productId': ref.id,
              'name': name,
              'description': description,
              'fixed': fixed,
              'price': price,
              'rating': rating,
              'category': category,
              'image': image,
              'isStock': inStock,
              'quantity': quantity,
              'userUid': userUid,
            })
            .then((value) => print("Product Info Added"))
            .catchError((error) => print("Failed to Add Product: $error"));
      }
    });
  }
}
