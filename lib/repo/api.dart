import 'dart:convert';

import 'package:ecommerce_lauwba_new/models/Carousel.dart';
import 'package:ecommerce_lauwba_new/models/Feed.dart';
import 'package:ecommerce_lauwba_new/models/Help.dart';
import 'package:ecommerce_lauwba_new/models/ProductDetail.dart';
import 'package:ecommerce_lauwba_new/models/auth/Login.dart';
import 'package:ecommerce_lauwba_new/models/auth/Register.dart';
import 'package:ecommerce_lauwba_new/models/cart/AddCart.dart';
import 'package:ecommerce_lauwba_new/models/cart/DeleteCart.dart';
import 'package:ecommerce_lauwba_new/models/cart/ShowCart.dart';
import 'package:ecommerce_lauwba_new/models/cart/UpdateCart.dart';
import 'package:http/http.dart' as http;

import '../models/Category.dart';
import '../models/Product.dart' as product;

const BASE_URL = "https://ecommerce.aguskhaer.com/api/";

class Api {
  //Auth
  static Future<Login> login({required Map<String, String> dataUser}) async {
    var url = "${BASE_URL}login";
    final response = await http.post(Uri.parse(url), body: dataUser);
    if (response.statusCode == 200) {
      return Login.fromJson(jsonDecode(response.body));
    }

    throw "Login failed";
  }

  static Future<Register> register(
      {required Map<String, String> dataUser}) async {
    var url = "${BASE_URL}register";
    final response = await http.post(Uri.parse(url), body: dataUser);
    if (response.statusCode == 200) {
      return Register.fromJson(jsonDecode(response.body));
    }

    throw "Register failed";
  }

  static Future<product.Product> getListProduct() async {
    var url = "${BASE_URL}product";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return product.Product.fromJson(jsonDecode(response.body));
    }

    throw "fetching data product failed";
  }

  static Future<ProductDetail> getProductDetail(
      {required String idProduct}) async {
    var url = "${BASE_URL}product/$idProduct";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return ProductDetail.fromJson(jsonDecode(response.body));
    }

    throw "fetching detail product failed";
  }

  static Future<Category> getListCategory() async {
    var url = "${BASE_URL}category";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Category.fromJson(jsonDecode(response.body));
    }

    throw "fetching data category failed";
  }

  static Future<dynamic> getListSubcategory({required int idCategory}) async {
    var url = "${BASE_URL}subcategory/$idCategory";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return response.body;
    }

    throw "fetching data category failed";
  }

  static Future<Feed> getListFeed() async {
    var url = "${BASE_URL}feed";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Feed.fromJson(jsonDecode(response.body));
    }

    throw "fetching data feed failed";
  }

  static Future<Carousel> getListCarousel() async {
    var url = "${BASE_URL}carousel";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Carousel.fromJson(jsonDecode(response.body));
    }

    throw "fetching data feed failed";
  }

  static Future<Help> getListHelp() async {
    var url = "${BASE_URL}help";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Help.fromJson(jsonDecode(response.body));
    }

    throw "fetching data help failed";
  }

  // cart
  static Future<ShowCart> listCart({required int idUser}) async {
    var url = "${BASE_URL}cart/$idUser";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return ShowCart.fromJson(jsonDecode(response.body));
    }

    throw "fetching data cart failed";
  }
  static Future<AddCart> addNewCart({required Map<String, dynamic> dataCart}) async {
    var url = "${BASE_URL}cart-add";
    final response = await http.post(Uri.parse(url), body: dataCart);
    if (response.statusCode == 200) {
      return AddCart.fromJson(jsonDecode(response.body));
    }

    throw "add data cart failed";
  }
  static Future<UpdateCart> updateCart({required int qty, required int idCart}) async {
    var url = "${BASE_URL}cart-update/$idCart";

    final response = await http.post(Uri.parse(url), body: {"quantity": qty.toString()});

    if (response.statusCode == 200) {
      return UpdateCart.fromJson(jsonDecode(response.body));
    }

    throw "update data cart failed";
  }

  static Future<DeleteCart> deleteCart({required int idCart}) async {
    var url = "${BASE_URL}cart-delete/$idCart";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return DeleteCart.fromJson(jsonDecode(response.body));
    }

    throw "delete data cart failed";
  }
}
