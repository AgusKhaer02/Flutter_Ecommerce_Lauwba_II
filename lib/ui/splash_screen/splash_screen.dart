import 'package:ecommerce_lauwba_new/utils/page_routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  gotoMain() async {
    await Future.delayed(Duration(seconds: 2));

    if (context.mounted) {
      Navigator.of(context).pushReplacementNamed(MAIN_SCREEN);
    }
  }

  @override
  void initState() {
    gotoMain();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/ecommerce-logo.png",
                  width: 150,
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Ecommerce",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: Text("Mohon tunggu..."),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
