import 'package:ecommerce_lauwba_new/provider/help_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HelpSubscreen extends StatefulWidget {
  const HelpSubscreen({super.key});

  @override
  State<HelpSubscreen> createState() => _HelpSubscreenState();
}

class _HelpSubscreenState extends State<HelpSubscreen> {

  late HelpProvider helpProvider;

  fetchData(){
    helpProvider.fetchData();
  }

  @override
  void initState() {
    //pembahasan ada di halaman HomeSubscreen dan DetailProduct Screen
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      helpProvider = Provider.of<HelpProvider>(context, listen: false);
      fetchData();
    });
    super.initState();
  }

  onRefresh()async{
    await Future.delayed(Duration(seconds: 2));
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
      ),
      body: Consumer<HelpProvider>(
        builder: (context, provider, widget) {
          final data = provider.dataHelp;
          return RefreshIndicator(
            onRefresh: () async {
              onRefresh();
            },
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index){
                      return Card(
                        child: ListTile(
                          leading: Image.network(data[index].helpImage!, height: 100,),
                          title: Text(data[index].helpName!),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
