import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_lauwba_new/provider/carousel_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CarouselProvider>(builder: (context, provider, widget) {
      return CarouselSlider(
        items: List.generate(
            provider.dataCarousel.length,
            (index) => Image.network(
                  provider.dataCarousel[index].carouselImage!,
                  width: double.infinity,
                  height: 160,
                  fit: BoxFit.cover,
                )),
        options: CarouselOptions(
          height: 160.0,
          autoPlay: true,
          viewportFraction: 1
        ),
      );
    });
  }
}
