import 'package:ecommerce_lauwba_new/models/Feed.dart';
import 'package:flutter/material.dart';

import '../repo/api.dart';


class FeedProvider with ChangeNotifier{

  List<Data> dataFeed = [];


  fetchData()async{
    final data = await Api.getListFeed();
    dataFeed = data.data!;
    notifyListeners();
  }
}