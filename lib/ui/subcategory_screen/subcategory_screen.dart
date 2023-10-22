import 'package:ecommerce_lauwba_new/provider/subcategory_provider.dart';
import 'package:ecommerce_lauwba_new/ui/productbysubcategory_screen/product_by_subcategory_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../global_widgets.dart';

class SubcategoryScreen extends StatefulWidget {
  const SubcategoryScreen({Key? key}) : super(key: key);

  @override
  State<SubcategoryScreen> createState() => _SubcategoryScreenState();
}

class _SubcategoryScreenState extends State<SubcategoryScreen> {
  late SubcategoryProvider subcategoryProvider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      subcategoryProvider = Provider.of<SubcategoryProvider>(context,listen: false);
      subcategoryProvider.fetchData();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subcategory"),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 300/120
              ),
              itemCount: 10,
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductBySubcategoryScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 200,
                    margin: const EdgeInsets.only(right: 5),
                    child: Card(
                      child: ListTile(
                        leading: Image.network(
                          "https://5.imimg.com/data5/MT/MB/EO/SELLER-14290347/men-555-black-fashion-lace-up-shoes-500x500.jpg",
                        ),
                        title: const Text("Sepatu"),
                      ),
                    ),
                  ),
                );
              },

            ),
          )
        ],
      ),
      floatingActionButton: btnCart(context: context),
    );
  }
}
