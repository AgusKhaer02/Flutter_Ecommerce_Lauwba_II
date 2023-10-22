import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_lauwba_new/provider/auth_provider.dart';
import 'package:ecommerce_lauwba_new/provider/carousel_provider.dart';
import 'package:ecommerce_lauwba_new/provider/cart_provider.dart';
import 'package:ecommerce_lauwba_new/provider/category_provider.dart';
import 'package:ecommerce_lauwba_new/provider/product_provider.dart';
import 'package:ecommerce_lauwba_new/ui/auth/login_screen.dart';
import 'package:ecommerce_lauwba_new/ui/detail_product/detail_product_screen.dart';
import 'package:ecommerce_lauwba_new/ui/subcategory_screen/subcategory_screen.dart';
import 'package:ecommerce_lauwba_new/ui/subscreen/home/widgets/carousel.dart';
import 'package:ecommerce_lauwba_new/ui/subscreen/home/widgets/list_category.dart';
import 'package:ecommerce_lauwba_new/ui/subscreen/home/widgets/list_product.dart';
import 'package:ecommerce_lauwba_new/utils/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/Product.dart';

class HomeSubscreen extends StatefulWidget {
  @override
  State<HomeSubscreen> createState() => _HomeSubscreenState();
}

class _HomeSubscreenState extends State<HomeSubscreen> {
  late CategoryProvider _categoryProvider;
  late ProductProvider _productProvider;
  late CarouselProvider _carouselProvider;

  fetchAllData() {
    _categoryProvider.fetchData();
    _productProvider.fetchData();
    _carouselProvider.fetchData();
  }

  onRefresh() {
    fetchAllData();
  }

  @override
  void initState() {
    //dijalankan pertama kali sebelum build
    //akan tetapi dijalankan setelah frame di tampilkan, karna butuh context
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _carouselProvider = Provider.of<CarouselProvider>(context, listen: false);
      _categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
      _productProvider = Provider.of<ProductProvider>(context, listen: false);
      fetchAllData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ecommerce"),
        actions: [
          Consumer<AuthProvider>(
            builder: (context, provider, widget) {
              if (provider.isLoggedIn) {
               return IconButton(onPressed: () {
                 Navigator.of(context).pushNamed(PROFILE_SCREEN);
               }, icon: Icon(Icons.person));
              }
              return IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(LOGIN_SCREEN);
                  },
                  icon: Icon(Icons.login));
            }
          ),

        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await onRefresh();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  carousel
            Carousel(),

            //  list category
            Container(
              margin: const EdgeInsets.fromLTRB(10, 20, 0, 0),
              child: Text(
                "Category",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),

            ListCategory(),

            //  list product
            Container(
              margin: const EdgeInsets.fromLTRB(10, 20, 0, 0),
              child: Text(
                "Products",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),

            ListProduct(),
          ],
        ),
      ),
    );
  }
}
