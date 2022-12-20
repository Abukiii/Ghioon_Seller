import 'package:cloud_firestore/cloud_firestore.dart';

class AddProductDatabase {
  var userUid;
  AddProductDatabase({this.userUid});
  final CollectionReference sellersProduct =
      FirebaseFirestore.instance.collection('Sellers');
  final CollectionReference product =
      FirebaseFirestore.instance.collection('Products');

  Future addProduct(
    String name,
    String description,
    bool fixed,
    List<double> price,
    List<int> rangeTo,
    List<int> rangeFrom,
    String selectedValue,
    String selectedCatagoryValue,
    double rating,
    String category,
    List<String> image,
    String videoString,
    bool inStock,
    int quantity,
    var userUid,
  ) async {
    DocumentReference ref = await product.doc();
    return await product
        .doc(ref.id)
        .set({
          'created': Timestamp.now(),
          'productId': ref.id,
          'name': name,
          'description': description,
          'fixed': fixed,
          'price': price,
          'rangeTo': rangeTo,
          'rangeFrom': rangeFrom,
          'Product_Type': selectedValue,
          'Product_collection': selectedCatagoryValue,
          'rating': rating,
          'category': category,
          'image': image,
          'video': videoString,
          'isStock': inStock,
          'quantity': quantity,
          'userUid': userUid,
        })
        .then((value) => print("Product Info Added"))
        .catchError((error) => print("Failed to Add Product: $error"));
  }
}
