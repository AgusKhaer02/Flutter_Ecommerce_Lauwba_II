import 'package:ecommerce_lauwba_new/repo/api.dart';
import 'package:flutter/cupertino.dart';
import '../models/Product.dart';
import '../models/ProductDetail.dart' as product_detail;


class ProductProvider with ChangeNotifier{
  List<Data> dataProduct = [];
  bool isLoading = false;

  fetchData()async{
    await Future.delayed(Duration(seconds: 1));
    isLoading = true;
    notifyListeners();

    final data = await Api.getListProduct();

    dataProduct = data.data!;
    isLoading = false;
    notifyListeners();

  }


}
