class UserAuth {
  final String uid;
  UserAuth({required this.uid});
}

class UserInformation {
  String userName;
  String phoneNumber;
  String userUid;
  bool approved;
  String documentId;
  String businessCategory;
  String businessName;
  String email;
  String businessNo;

  UserInformation({
    required this.userName,
    required this.phoneNumber,
    required this.userUid,
    required this.approved,
    required this.documentId,
    required this.businessNo,
    required this.businessCategory,
    required this.businessName,
    required this.email,
  });
}

class Categories {
  String type;
  String documentId;
  Categories({
    required this.type,
    required this.documentId,
  });
}

class LastId {
  int lastId;

  LastId({
    required this.lastId,
  });
}

class Product {
  String productId;
  String name;
  String description;
  bool fixed;
  List<dynamic> price;
  List<dynamic> rangeFrom;
  List<dynamic> rangeTo;
  double rating;
  String category;
  List image;
  bool inStock;
  int quantity;
  String documentId;
  String video;

  Product({
    required this.productId,
    required this.name,
    required this.description,
    required this.fixed,
    required this.price,
    required this.rangeFrom,
    required this.rangeTo,
    required this.rating,
    required this.category,
    required this.image,
    required this.inStock,
    required this.quantity,
    required this.documentId,
    required this.video,
  });
}

class Review {
  String productId;
  List<String> reviews;
  Review({
    required this.productId,
    required this.reviews,
  });
}
