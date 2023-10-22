import 'package:ecommerce_lauwba_new/models/Carousel.dart';
import 'package:flutter/material.dart';
import '../repo/api.dart';

class CarouselProvider with ChangeNotifier{

  List<Data> dataCarousel = [];
  bool isLoading = false;

  fetchData()async{
    await Future.delayed(Duration(seconds: 1));
    isLoading = true;
    notifyListeners();
    final data = await Api.getListCarousel();
    dataCarousel = data.data!;
    isLoading = false;
    notifyListeners();
  }
}