import 'dart:convert';

import 'package:ecommerce_lauwba_new/models/cart/ShowCart.dart';
import 'package:ecommerce_lauwba_new/provider/auth_provider.dart';
import 'package:flutter/material.dart';

import '../repo/api.dart';


const USER_ID = "user_id";
const PRODUCT_ID = "product_id";
const QTY = "quantity";

class CartProvider with ChangeNotifier {
  List<Data> listCart = [];
  int cartID = 0;
  int qty = 1;
  int price = 0;
  int totalPrice = 0;
  int stock = 0;
  bool updateExistingCart = false;
  bool isLoading = false;

  reasonToUpdate(){
    updateExistingCart = true;
    notifyListeners();
  }

  // memberikan nilai awal dari stok dan price
  setStocknPrice({required int nstock, required int nprice})async{
    await Future.delayed(Duration(seconds: 1));
    stock = nstock;
    price = nprice;
    notifyListeners();
  }

  //menambahkan quantity
  addQty() {
    if (qty < stock) {
      qty++;
      totalPrice = price * qty;
      notifyListeners();
    }
  }

  //mengurangi quantity
  removeQty() {
    if (qty >= 0) {
      qty--;
      totalPrice = price * qty;
      notifyListeners();
    }
  }

  //reset semuanya
  //ini cuma berlaku pada saat kembali ke halaman sebelumnya dari halaman product detail
  resetAll(){
    qty = 0;
    totalPrice = 0;
    stock = 0;
    cartID = 0;
    price = 0;
    updateExistingCart = false;
    notifyListeners();
  }

  // menambahkan data ke cart
  Future<Map<String, dynamic>> addToCart({
    required int userId,
    required int productId,
    required int qty,

  }) async {
    //tampilkan loading
    isLoading = true;
    notifyListeners();

    //kelompokan data menjadi 1 koleksi array
    Map<String, dynamic> dataCart = {
      USER_ID: userId.toString(),
      PRODUCT_ID: productId.toString(),
      QTY: qty.toString(),
    };

    Map<String, dynamic>? result;

    //lakukan percobaan login
    try {
      final res = await Api.addNewCart(dataCart: dataCart);
      //jika sukses maka muncul pesan sukses
      result = {
        "success": res.success,
        "message": res.message,
      };
    } catch (err) {
      //jika error maka muncul pesan error
      result = {
        "success": false,
        "message": "Err : $err",
      };
    }

    isLoading = false;
    notifyListeners();

    return result;
  }

  // menampilkan list cart berdasarkan user id
  // data yang dapat dipanggil nanti bisa masuk ke atribut listCart
  Future<Map<String, dynamic>> getListCart({
    required int userId,
  }) async {
    //tampilkan loading
    isLoading = true;
    notifyListeners();

    Map<String, dynamic>? result;

    //lakukan percobaan login
    try {
      final res = await Api.listCart(idUser: userId);
      if(res.success!){
        listCart = res.data!;
      }

      //jika sukses maka muncul pesan sukses
      result = {
        "success": res.success,
        "message": res.message,
      };
    } catch (err) {
      //jika error maka muncul pesan error
      result = {
        "success": false,
        "message": "Err : $err",
      };
    }

    isLoading = false;
    notifyListeners();

    return result;
  }

  //mengubah salah satu dari cartnya
  Future<Map<String, dynamic>> updateToCart({
    required int cartID,
    required int qty,

  }) async {
    //tampilkan loading
    isLoading = true;
    notifyListeners();

    Map<String, dynamic>? result;

    //lakukan percobaan login
    try {
      final res = await Api.updateCart(qty: qty, idCart: cartID);
      //jika sukses maka muncul pesan sukses
      result = {
        "success": res.success,
        "message": res.message,
      };
    } catch (err) {
      //jika error maka muncul pesan error
      result = {
        "success": false,
        "message": "Err : $err",
      };
    }

    isLoading = false;
    notifyListeners();

    return result;
  }

  //menghapus data cartnya
  Future<Map<String, dynamic>> deleteCart({
    required int cartID,
  }) async {
    //tampilkan loading
    isLoading = true;
    notifyListeners();

    Map<String, dynamic>? result;

    //lakukan percobaan login
    try {
      final res = await Api.deleteCart(idCart: cartID);
      //jika sukses maka muncul pesan sukses
      result = {
        "success": res.success,
        "message": res.message,
      };
    } catch (err) {
      //jika error maka muncul pesan error
      result = {
        "success": false,
        "message": "Err : $err",
      };
    }

    isLoading = false;
    notifyListeners();

    return result;
  }
}
