import 'package:ecommerce_lauwba_new/provider/auth_provider.dart';
import 'package:ecommerce_lauwba_new/ui/subscreen/feeds/feeds_subscreen.dart';
import 'package:ecommerce_lauwba_new/ui/subscreen/help/help_subscreen.dart';
import 'package:ecommerce_lauwba_new/ui/subscreen/home/home_subscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/carousel_provider.dart';
import '../../provider/category_provider.dart';
import '../../provider/product_provider.dart';
import '../global_widgets.dart';

class MainScreen extends StatefulWidget {



  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  late AuthProvider authProvider;

  List<Widget> subscreens = [
    HomeSubscreen(),
    FeedsSubscreen(),
    HelpSubscreen(),
    const Center(
      child: Text("About Screen"),
    ),

  ];

  List<Tab> listOfTabs = [
    const Tab(icon: Icon(Icons.home_outlined), text: "Home",),
    const Tab(icon: Icon(Icons.feed_outlined), text: "Feeds",),
    const Tab(icon: Icon(Icons.help_outline), text: "Help",),
    const Tab(icon: Icon(Icons.info_outline), text: "About",),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      authProvider = Provider.of<AuthProvider>(context,listen: false);
      authProvider.checkLoggedIn();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return DefaultTabController(
      length: subscreens.length,
      child: Scaffold(
        body:TabBarView(
          children : subscreens,
        ),
        bottomNavigationBar: Container(
          color: Colors.orange,
          child: TabBar(
            tabs: listOfTabs,
          ),
        ),
        floatingActionButton: btnCart(context: context)
      ),
    );
  }
}
