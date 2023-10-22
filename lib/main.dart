
import 'package:ecommerce_lauwba_new/provider/auth_provider.dart';
import 'package:ecommerce_lauwba_new/provider/carousel_provider.dart';
import 'package:ecommerce_lauwba_new/provider/cart_provider.dart';
import 'package:ecommerce_lauwba_new/provider/category_provider.dart';
import 'package:ecommerce_lauwba_new/provider/detail_product_provider.dart';
import 'package:ecommerce_lauwba_new/provider/feed_provider.dart';
import 'package:ecommerce_lauwba_new/provider/help_provider.dart';
import 'package:ecommerce_lauwba_new/provider/product_provider.dart';
import 'package:ecommerce_lauwba_new/provider/subcategory_provider.dart';
import 'package:ecommerce_lauwba_new/ui/auth/login_screen.dart';
import 'package:ecommerce_lauwba_new/ui/auth/profile_screen.dart';
import 'package:ecommerce_lauwba_new/ui/auth/register_screen.dart';
import 'package:ecommerce_lauwba_new/ui/cart_screen/cart_screen.dart';
import 'package:ecommerce_lauwba_new/ui/detail_product/detail_product_screen.dart';
import 'package:ecommerce_lauwba_new/ui/main_screen/main_screen.dart';
import 'package:ecommerce_lauwba_new/ui/productbysubcategory_screen/product_by_subcategory_screen.dart';
import 'package:ecommerce_lauwba_new/ui/splash_screen/splash_screen.dart';
import 'package:ecommerce_lauwba_new/ui/subcategory_screen/subcategory_screen.dart';
import 'package:ecommerce_lauwba_new/ui/subscreen/feeds/detail_feed_subscreen.dart';
import 'package:ecommerce_lauwba_new/ui/subscreen/help/detail_help_subscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/page_routes.dart';
import 'models/Product.dart';

main() {
  runApp(
    EcommerceLauwbaNew(),
  );
}

class EcommerceLauwbaNew extends StatelessWidget {
  const EcommerceLauwbaNew({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => SubcategoryProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => DetailProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        // Feed
        ChangeNotifierProvider(create: (context) => FeedProvider()),
        // Help
        ChangeNotifierProvider(create: (context) => HelpProvider()),
        // Carousel
        ChangeNotifierProvider(create: (context) => CarouselProvider()),
      ],
      child: MaterialApp(
        title: "Ecommerce Lauwba",
        routes: {
          LOGIN_SCREEN : (context) => LoginScreen(),
          REGISTER_SCREEN : (context) => RegisterScreen(),
          PROFILE_SCREEN : (context) => ProfileScreen(),
          MAIN_SCREEN : (context) => MainScreen(),
          SPLASH_SCREEN : (context) => SplashScreen(),
          SUBCATEGORY_SCREEN: (context) => SubcategoryScreen(),
          PRODUCT_BY_SUBCATEGORY_SCREEN : (context) => ProductBySubcategoryScreen(),
          CART_SCREEN : (context) => CartScreen(),
          DETAIL_PRODUCT_SCREEN : (context) => DetailProductScreen(),
          DETAIL_FEED_SCREEN : (context) => DetailFeedSubscreen(),
          DETAIL_HELP_SCREEN : (context) => DetailHelpSubscreen(),
        },
        initialRoute: SPLASH_SCREEN,
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
