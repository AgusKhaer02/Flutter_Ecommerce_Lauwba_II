
import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/Category.dart';
import '../repo/api.dart';

class SubcategoryProvider with ChangeNotifier{
  // List<Data> dataProduct = [];


  fetchData(){
    Api.getListSubcategory(idCategory: 1).then((data) {
      // dataProduct = data.data!;
      // notifyListeners();
      var dataJson = jsonDecode(data);
      print("Data : ${dataJson['data']['product']}");
    }).catchError((err){
      print("Error : $err");
    });
  }
}
