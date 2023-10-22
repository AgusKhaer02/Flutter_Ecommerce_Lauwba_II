import 'package:ecommerce_lauwba_new/models/ProductDetail.dart';
import 'package:ecommerce_lauwba_new/provider/auth_provider.dart';
import 'package:ecommerce_lauwba_new/provider/cart_provider.dart';
import 'package:ecommerce_lauwba_new/provider/detail_product_provider.dart';
import 'package:ecommerce_lauwba_new/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../global_widgets.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({Key? key}) : super(key: key);

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  late DetailProductProvider detailProductProvider;
  late Map<String, dynamic> dataArgs;
  CartProvider cartProvider = CartProvider();

  @override
  void initState() {
    // eksekusikan perintah di dalam addPostFrameCallback ini setelah frame di load,
    // pakai cara ini ketika ingin mengeksekusikan perintah yang membutuhkan context dari sebuah widget tree dan hanya sekali eksekusi
    // sama halnya ketika kita ingin menjeda perintah di da lamnya selama kurang lebih dari 2 detik
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dataArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      //untuk mencegah tidak terjadi perubahan state di sini
      detailProductProvider =
          Provider.of<DetailProductProvider>(context, listen: false);
      cartProvider = Provider.of<CartProvider>(context, listen: false);
      detailProductProvider.getDetails(id: dataArgs['id_product'].toString());
    });
    super.initState();
  }

  onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    detailProductProvider.getDetails(id: dataArgs['id_product'].toString());
  }

  void _showMoreDescription(BuildContext context, String desc) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Text(
                  "Description",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(desc),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // detailProductProvider.dispose();
        detailProductProvider.remove();
        return true;
      },
      child: Material(
        child: Consumer<DetailProductProvider>(
          builder: (context, provider, state) {
            if (provider.error != "") {
              return Scaffold(
                body: RefreshIndicator(
                  onRefresh: () async {
                    await onRefresh();
                  },
                  child: ListView(
                    children: [
                      Center(
                        child: Text(provider.error),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (provider.isLoading) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (provider.productDetail.productStock != null) {
              final data = provider.productDetail;
              cartProvider.setStocknPrice(
                  nstock: data.productStock!, nprice: data.productPrice!);
              return showDetail(data, context);
            }
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget showDetail(Data data, BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        cartProvider.resetAll();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(data.productName!),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await onRefresh();
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  data.productImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.productName!,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        "RP ${data.productPrice!}",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        data.productStock!.toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Description",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        data.productDesc!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                      TextButton(
                        onPressed: () {
                          _showMoreDescription(context, data.productDesc!);
                        },
                        child: const Text("+ Read More"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: QTYnTotal(),
        floatingActionButton: btnCart(context: context),
      ),
    );
  }
}

class QTYnTotal extends StatefulWidget {



  @override
  State<QTYnTotal> createState() => _QTYnTotalState();
}

class _QTYnTotalState extends State<QTYnTotal> {
  AuthProvider auth = AuthProvider();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      auth = Provider.of<AuthProvider>(context,listen: false);
      auth.getPref();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final product = Provider.of<DetailProductProvider>(context);

    return Consumer<CartProvider>(builder: (context, provider, widget) {
      return Container(
        color: Colors.orange,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(provider.totalPrice.toString(),
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        provider.removeQty();
                      },
                      icon: Icon(Icons.remove),
                    ),
                    Text(
                      provider.qty.toString(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    IconButton(
                      onPressed: () {
                        provider.addQty();
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),

                // jadi apakah masuk ke product screen untuk mengubah cart atau menambah cart?
                // untuk jawabannya ada di updateExistingCart pada cartProvider
                // yang terjadi perubahan status pada updateExistingCart itu pada saat user klik
                // tombol edit pada salah satu product di dalam cart screen
                (provider.isLoading)
                    ? const ElevatedButton(
                        onPressed: null, child: CircularProgressIndicator())
                    : (provider.updateExistingCart)
                        ? ElevatedButton(
                            onPressed: () async{

                              var res = await provider.updateToCart(cartID: provider.cartID, qty: provider.qty);

                              if(context.mounted){
                                showAlert(
                                  status: (res['success'])
                                      ? AlertStatus.success
                                      : AlertStatus.error,
                                  message: res['message'],
                                  context: context,
                                );
                              }
                            },
                            child: Text("Update cart"),
                          )
                        : ElevatedButton(
                            onPressed: () async {
                              print("User id : ${auth.userID}, product id : ${product.productDetail.productId}, qty : ${provider.qty}");
                              var res = await provider.addToCart(
                                  userId: auth.userID,
                                  productId: product.productDetail.productId!,
                                  qty: provider.qty);

                              if(context.mounted){
                                showAlert(
                                  status: (res['success'])
                                      ? AlertStatus.success
                                      : AlertStatus.error,
                                  message: res['message'],
                                  context: context,
                                );
                              }
                            },
                            child: Text("Add to cart"),
                          ),
              ],
            )
          ],
        ),
      );
    });
  }
}
