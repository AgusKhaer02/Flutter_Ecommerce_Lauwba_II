
import 'package:flutter/material.dart';

import '../models/Help.dart';
import '../repo/api.dart';


class HelpProvider with ChangeNotifier{

  List<Data> dataHelp = [];


  fetchData()async{
    final data = await Api.getListHelp();
    dataHelp = data.data!;
    notifyListeners();
  }
}