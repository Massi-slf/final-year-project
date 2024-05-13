import 'package:flutter/material.dart';
import 'package:online_shop/models/sneaker_model.dart';
import 'package:online_shop/services/helper.dart';

class ProductNotifier extends ChangeNotifier {
  int _activepage = 0;
  List<dynamic> _shoeSizes = [];
  List<String> _sizes = [];


  int get activepage => _activepage;

  set activePage(int newIndex) {
    _activepage = newIndex;
    notifyListeners();
  }

  List<dynamic> get shoeSizes => _shoeSizes;

  set shoesSizes(List<dynamic> newSizes) {
    _shoeSizes = newSizes;
    notifyListeners();
  }

//  function is called with an index, it will toggle the selection
// of that item and leave the selection of all other items as they were.
// This will allow for multiple items to be selected at once.

  void toggleCheck(int index) {
    for (int i = 0; i < _shoeSizes.length; i++) {
      if (i == index) {
        _shoeSizes[i]['isSelected'] = !_shoeSizes[i]['isSelected'];
      }
    }
    notifyListeners();
  }

    List<String> get sizes => _sizes;

  set sizes(List<String> newSizes) {
    _sizes = newSizes;
    notifyListeners();
  }

   late Future<List<Sneakers>> male;
  late Future<List<Sneakers>> female;
  late Future<List<Sneakers>> kids;
  late Future<Sneakers> sneaker;

  void getMale() {
    male = Helper().getMaleSneakers();
  }

  void getFemale() {
    female = Helper().getFemaleSneakers();
  }

  void getkids() {
    kids = Helper().getKidsSneakers();
  }



  void getShoes(String category, String id) {
    if (category == "Men's Running") {
      sneaker = Helper().getMaleSneakersById(id);
    } else if (category == "Women's Running") {
      sneaker = Helper().getFemaleSneakersById(id);
    } else {
      sneaker = Helper().getKidsSneakersById(id);
    }
  }


}
