import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghioon_seller/Models/addCollections.dart';
import 'package:ghioon_seller/Models/addProductmodels.dart';
import 'package:image_picker/image_picker.dart';

final List<Range> initialData = [];

class RangeData with ChangeNotifier {
  List<ImageList> profileImages = [];
  var profileVideo;

  var video;
  String videoString = '';
  bool isLoading = false;
  List<int> rangeToList = [];
  List<int> rangeFromList = [];
  List<double> priceList = [];
  List<String> imageList = [];

  final productName = TextEditingController();
  final description = TextEditingController();
  final fixedPrice = TextEditingController(text: "1");
  final oldPrice = TextEditingController(text: "0");
  final cost = TextEditingController(text: "0");
  final inventory = TextEditingController(text: "1");
  bool fixed = true;

  bool imageFilled = true;
  bool productDescriptionFilled = true;
  bool fixedFilled = true;
  bool rangefilled = true;
  bool videoSquare = true;
  bool videoSubmited = false;
  bool videoLessThanSix = true;
  List<Range> Ranges = [];
  final ImagePicker _picker = ImagePicker();

  //variables for dropdown
  String selectedValue = 'New';
  var selectedCatagoryValue = null;
  String selectedCollectionValue = 'others';
  

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("New"), value: "New"),
      DropdownMenuItem(child: Text("Used-like new"), value: "Used-like new"),
      DropdownMenuItem(child: Text("Used-good"), value: "Used-good"),
      DropdownMenuItem(child: Text("Used-fair"), value: "Used-fair"),
    ];
    return menuItems;
  }

  String selected_collection = "";

  addInventory() {
    //Qty = Qty + 1;
    inventory.text = (int.parse(inventory.text) + 1).toString();
    notifyListeners();
  }
   RefreshState() {
    notifyListeners();
  }

  minusInventory() {
    //  Qty > 0 ? Qty = Qty - 1 : Qty = 0;
    int.parse(inventory.text) > 1
        ? inventory.text = (int.parse(inventory.text) - 1).toString()
        : inventory.text = '1';
    notifyListeners();
  }

  switchFixed(bool fixedInput) {
    fixed = !fixedInput;
    notifyListeners();
  }

  switchproductDescriptionFilled(bool productDescriptionFilledInput) {
    productDescriptionFilled = productDescriptionFilledInput;
    notifyListeners();
  }

  switchfixedFilled(bool fixedFilledInput) {
    fixedFilled = fixedFilledInput;
    notifyListeners();
  }

  switchrangefilled(bool rangefilledInput) {
    rangefilled = rangefilledInput;
    notifyListeners();
  }

  removeallcontrollers() {
    Ranges.clear();
    productName.clear();
    description.clear();
    fixedPrice.clear();
    oldPrice.clear();
    cost.clear();
    notifyListeners();
  }

  removeSelectedValue() {
    selectedValue = '';
  }

  removeSelectedCatagoryValue() {
    selectedCatagoryValue = null;
  }

  addSelectedCatagoryValue(String value) {
    selectedCatagoryValue = value;
  }

//function to add the first searching bars
  addinit() {
    Ranges.add(
      Range(
        fromcontroller: TextEditingController(),
        tocontroller: TextEditingController(),
        pricecontroller: TextEditingController(),
      ),
    );
    Ranges.add(
      Range(
        fromcontroller: TextEditingController(),
        tocontroller: TextEditingController(),
        pricecontroller: TextEditingController(),
      ),
    );
    notifyListeners();
  }

//fuction to add a search bar on a button click, the last destination
//point will stay on the last and can add ranges in the middle

  void addToList(Range range) {
    Ranges.add(range);
    notifyListeners();
  }

//function to remove one range search bar from the list

  void removeLast() {
    if (Ranges.isNotEmpty) {
      Ranges.removeLast();
    }
    notifyListeners();
  }

  //Controlling functions for add image

  final List<ImageList> _image = [];

  List<ImageList> get Images => _image;

//function to clear out all added images
  removeallimages() {
    _image.clear();
    imageList.clear();

    notifyListeners();
  }

//function to add the first add image
  addinitImages() {
    _image.add(ImageList());
    notifyListeners();
  }

//fuction to add a search bar on a button click, the last destination
//point will stay on the last and can add ranges in the middle

  void addToImageList(ImageList image) {
    print("add image");
    _image.add(ImageList());
    print(_image);
    notifyListeners();
  }

//function to remove one range search bar from the list

  void removeImage(ImageList image) {
    if (_image.isNotEmpty) {
      _image.remove(image);
    }
    notifyListeners();
  }
}
