import 'package:ecommerce_lauwba_new/provider/auth_provider.dart';
import 'package:ecommerce_lauwba_new/ui/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late AuthProvider authProvider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      authProvider = Provider.of<AuthProvider>(context, listen: false);
      authProvider.getPref();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, widget) {
      // cek apakah benar sudah tidak login?
      return Scaffold(
        appBar: AppBar(
          title: Text("Profile Screen"),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/user.png"),
                  radius: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2),
                child: Text(provider.fullname,
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2, bottom: 20),
                child: Text(provider.email,
                    style: Theme.of(context).textTheme.titleSmall),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, right: 40, left: 40),
                width: double.infinity,
                height: 50,
                child: (provider.isLoading)
                    ? const OutlinedButton(
                        onPressed: null,
                        child: CircularProgressIndicator(),
                      )
                    : OutlinedButton(
                        onPressed: () {
                          //menghapus semua yang ada di sharedpreferences
                          provider.destroyPref();

                          showAlert(
                            status: AlertStatus.success,
                            message: "Logout Success!",
                            context: context,
                          );
                          Navigator.of(context).pop();

                        },
                        child: Text(
                          "Logout",
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                      ),
              )
            ],
          ),
        ),
      );
    });
  }
}
