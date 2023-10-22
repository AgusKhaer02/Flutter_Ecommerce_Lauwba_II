import 'package:ecommerce_lauwba_new/provider/category_provider.dart';
import 'package:ecommerce_lauwba_new/utils/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ListCategory extends StatelessWidget {
  const ListCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
        builder: (context, provider, widget) {
          var dataProvider = provider.dataProduct;
          return Container(
            height: 70,
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: ListView.builder(
              itemCount: dataProvider.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var data = dataProvider[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(SUBCATEGORY_SCREEN);
                  },
                  child: Container(
                    width: 200,
                    margin: const EdgeInsets.only(right: 5),
                    child: Card(
                      child: ListTile(
                        leading: Image.network(
                          data.categoryImage!,
                        ),
                        title: Text(data.categoryName!.toString()),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
    );
  }
}
