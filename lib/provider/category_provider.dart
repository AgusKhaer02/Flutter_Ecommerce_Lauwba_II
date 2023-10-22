
import 'package:flutter/material.dart';

import '../models/Category.dart';
import '../repo/api.dart';

class CategoryProvider with ChangeNotifier{
  List<Data> dataProduct = [];


  fetchData(){
    Api.getListCategory().then((data) {
      dataProduct = data.data!;
      notifyListeners();
    }).catchError((err){
      print("Error : $err");
      //coba fetch data lagi
      // fetchData();
    });
  }
}
