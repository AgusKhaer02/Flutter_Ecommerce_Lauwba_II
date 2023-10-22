import 'package:ecommerce_lauwba_new/ui/auth/login_screen.dart';
import 'package:ecommerce_lauwba_new/utils/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../global_widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isHidden = true;

  toggleVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/ecommerce-logo.png",
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: fullName,
                decoration: const InputDecoration(
                    hintText: "Fullname", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: "Email", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: password,
                obscureText: isHidden,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      toggleVisibility();
                    },
                    icon: Icon(
                        (isHidden) ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Consumer<AuthProvider>(builder: (context, provider, widget) {
                if (provider.isLoading) {
                  return const ElevatedButton(
                      onPressed: null, child: CircularProgressIndicator());
                } else {
                  return ElevatedButton(
                    onPressed: () {
                      provider
                          .register(email: email.text, password: password.text, fullname: fullName.text)
                          .then((value) {
                        //tampilkan pesan sukses/error
                        showAlert(
                          status: (value['success'])
                              ? AlertStatus.success
                              : AlertStatus.error,
                          message: value['message'],
                          context: context,
                        );
                        //cek status login
                        if (value['success']) {
                          //kalo sudah login, pindah ke hal sebelumnya
                          Navigator.of(context).pop();
                        }
                      });
                    },
                    child: Text("Register"),
                  );
                }
              }),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(LOGIN_SCREEN);
                },
                child: const Text("Have an account? Login here!"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
