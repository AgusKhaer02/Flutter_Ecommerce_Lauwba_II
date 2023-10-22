import 'package:ecommerce_lauwba_new/provider/auth_provider.dart';
import 'package:ecommerce_lauwba_new/ui/auth/register_screen.dart';
import 'package:ecommerce_lauwba_new/ui/global_widgets.dart';
import 'package:ecommerce_lauwba_new/utils/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
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
                          .login(email: email.text, password: password.text)
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
                    child: Text("Login"),
                  );
                }
              }),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(REGISTER_SCREEN);
                },
                child: const Text("Don't have an account? Sign up here!"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
