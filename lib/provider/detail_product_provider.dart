import 'package:ecommerce_lauwba_new/models/ProductDetail.dart';
import 'package:flutter/material.dart';

import '../repo/api.dart';



class DetailProductProvider with ChangeNotifier{
  Data productDetail = Data();
  bool isLoading = false;
  String error = "";


  remove(){
    productDetail = Data();
    notifyListeners();
  }
  getDetails({required String id})async{
    await Future.delayed(Duration(seconds: 1));
    isLoading = true;
    error = "";
    notifyListeners();

    Api.getProductDetail(idProduct: id).then((value) {
      isLoading = false;
      productDetail = value.data!;
      notifyListeners();
    }).catchError((err){
      print("ERR : $err");
      isLoading = false;
      error = "Masalah pada jaringan, silahkan coba lagi!";
      notifyListeners();
    });
  }
}