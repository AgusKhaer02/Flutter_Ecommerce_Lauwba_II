import 'package:ecommerce_lauwba_new/provider/product_provider.dart';
import 'package:ecommerce_lauwba_new/utils/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ListProduct extends StatelessWidget {
  const ListProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
        builder: (context, product, widget) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: List.generate(
                  product.dataProduct.length,
                      (index) {
                    var data = product.dataProduct[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(DETAIL_PRODUCT_SCREEN, arguments: {
                          "id_product" : data.productId
                        });
                      },
                      child: Container(
                        height: 150,
                        child: Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                data.productImage!,
                                height: 100,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.productName!,
                                      style:
                                      Theme.of(context).textTheme.titleSmall,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "Rp ${data.productPrice},-",
                                      style:
                                      Theme.of(context).textTheme.titleLarge,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          );
        }
    );
  }
}