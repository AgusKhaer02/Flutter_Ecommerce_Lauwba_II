import 'package:ecommerce_lauwba_new/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../detail_product/detail_product_screen.dart';

class ProductBySubcategoryScreen extends StatelessWidget {
  const ProductBySubcategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox();
    // final productProvider = Provider.of<Product>(context);
    // return Scaffold(
    //    appBar: AppBar(
    //      title: Text("Products by Subcategory"),
    //    ),
    //   body: Column(
    //     children: [
    //       Expanded(
    //         child: Padding(
    //           padding: EdgeInsets.all(10),
    //           child: GridView(
    //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                 crossAxisCount: 2),
    //             children: List.generate(
    //               productProvider.products!.length,
    //                   (index) => GestureDetector(
    //                 onTap: () {
    //                   productProvider.selectProduct(
    //                       product: productProvider.products![index]);
    //                   Navigator.of(context).push(
    //                     MaterialPageRoute(
    //                       builder: (context) => DetailProductScreen(),
    //                     ),
    //                   );
    //                 },
    //                 child: Container(
    //                   height: 150,
    //                   child: Card(
    //                     child: Column(
    //                       mainAxisSize: MainAxisSize.min,
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Image.network(
    //                           productProvider.products![index].images![0],
    //                           height: 100,
    //                           width: double.infinity,
    //                           fit: BoxFit.cover,
    //                         ),
    //                         const SizedBox(
    //                           height: 15,
    //                         ),
    //                         Padding(
    //                           padding: const EdgeInsets.all(2),
    //                           child: Column(
    //                             mainAxisSize: MainAxisSize.min,
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: [
    //                               Text(
    //                                 productProvider.products![index].title!,
    //                                 style: Theme.of(context).textTheme.titleSmall,
    //                                 maxLines: 1,
    //                                 overflow: TextOverflow.ellipsis,
    //                               ),
    //                               Text(
    //                                 "\$ ${productProvider.products![index].price},-",
    //                                 style: Theme.of(context).textTheme.titleLarge,
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ).toList(),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );/
  }
}
