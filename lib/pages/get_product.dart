import 'package:flutter/material.dart';
import 'package:flutter_application_ui/common/common_appbar.dart';
import 'package:flutter_application_ui/model/product_model.dart';
import 'package:flutter_application_ui/services/api.dart';

class GetProduct extends StatefulWidget {
  const GetProduct({super.key});

  @override
  State<GetProduct> createState() => _GetProductState();
}

class _GetProductState extends State<GetProduct> {
  @override
  Widget build(BuildContext context) {
    return DefaultAppBar(
      headerTitle: "Get Product",
    body: FutureBuilder(
    future: Api.getProduct(), 
    builder: (BuildContext context, AsyncSnapshot snapshot){
    
   if(!snapshot.hasData){
    return Center(
    child: CircularProgressIndicator(),
    );
   }
    else {
    List<Product> pdata = snapshot.data;

    print("WAS $pdata");
    return ListView.builder(
    itemCount: pdata.length,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
      leading: Icon(Icons.storage),
      title: Text("${pdata[index].name}"),
      subtitle: Text("${pdata[index].desc}"),
      trailing: Text("\$ ${pdata[index].price}"),
      );
    }
    
    );
    
    }

    }),
    
    );
  }
}