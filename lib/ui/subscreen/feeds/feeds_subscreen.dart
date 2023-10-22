import 'package:ecommerce_lauwba_new/provider/feed_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedsSubscreen extends StatefulWidget {
  const FeedsSubscreen({super.key});

  @override
  State<FeedsSubscreen> createState() => _FeedsSubscreenState();
}

class _FeedsSubscreenState extends State<FeedsSubscreen> {
  late FeedProvider feedProvider;

  fetchData(){
    feedProvider.fetchData();
  }
  @override
  void initState() {
    //pembahasan ada di halaman HomeSubscreen dan DetailProduct Screen
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      feedProvider = Provider.of<FeedProvider>(context, listen: false);
      fetchData();
    });
    super.initState();
  }

  onRefresh()async{
    await Future.delayed(Duration(seconds: 1));
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Postingan terkini/ Promo terbaik!"),
      ),

      body: RefreshIndicator(
        onRefresh: () async {
          await onRefresh();
        },
        child: Column(
          children: [

            Consumer<FeedProvider>(
              builder: (context, provider, widget) {
                var dataProvider = provider.dataFeed;
                return Expanded(
                  child: ListView.builder(
                    itemCount: dataProvider.length,
                    itemBuilder: (context, index) {
                      var data = dataProvider[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(data.feedImage!,height: 200,width: double.infinity,fit: BoxFit.fill,),
                              Text(data.feedTitle!),
                              Text(data.feedCategory!),
                              Text(data.feedDesc!)

                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
