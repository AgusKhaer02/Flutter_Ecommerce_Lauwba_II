import 'package:ecommerce_lauwba_new/provider/auth_provider.dart';
import 'package:ecommerce_lauwba_new/provider/cart_provider.dart';
import 'package:ecommerce_lauwba_new/ui/detail_product/detail_product_screen.dart';
import 'package:ecommerce_lauwba_new/ui/global_widgets.dart';
import 'package:ecommerce_lauwba_new/utils/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartProvider cartProvider = CartProvider();
  AuthProvider authProvider = AuthProvider();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      cartProvider = Provider.of<CartProvider>(context, listen: false);
      authProvider = Provider.of<AuthProvider>(context, listen: false);
      cartProvider.getListCart(userId: authProvider.userID);
      if (!authProvider.isLoggedIn) {
        showAlert(
            status: AlertStatus.error,
            message: "Login to this app to continue",
            context: context);
        Navigator.of(context).pushReplacementNamed(LOGIN_SCREEN);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, provider, widget) {

      return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 2));
            await cartProvider.getListCart(userId: authProvider.userID);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Your Cart",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              (provider.listCart.isNotEmpty) ?
              Expanded(
                child: ListView.builder(
                  itemCount: cartProvider.listCart.length,
                  itemBuilder: (context, index) {
                    var data = provider.listCart[index];
                    var dataProduct = data.product!;
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          dataProduct.productImage!,
                          width: 50,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          dataProduct.productName!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text("QTY : ${data.quantity}"),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                provider.cartID = data.cartId!;
                                provider.updateExistingCart = true;
                                Navigator.of(context)
                                    .pushNamed(DETAIL_PRODUCT_SCREEN,arguments: {"id_product" : data.productId});
                              },
                              child: const Icon(
                                Icons.edit,
                                color: Colors.black38,
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                var res = await provider.deleteCart(
                                    cartID: data.cartId!);
                                if (context.mounted) {
                                  cartProvider.getListCart(userId: authProvider.userID);
                                  showAlert(
                                      status: (res['success'])
                                          ? AlertStatus.success
                                          : AlertStatus.error,
                                      message: res['message'],
                                      context: context);
                                }

                              },
                              child: const Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ) : Expanded(child: Center(
                child: Text("Your cart is empty, let's go buy something!"),
              )),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  maxLines: 2,
                  decoration: const InputDecoration(
                      hintText: "Add a nore here...",
                      border: OutlineInputBorder()),
                ),
              ),
              (provider.listCart.isNotEmpty) ?
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Checkout"),
                ),
              ) : Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                width: double.infinity,
                child: const ElevatedButton(
                  onPressed: null,
                  child: Text("Checkout"),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
