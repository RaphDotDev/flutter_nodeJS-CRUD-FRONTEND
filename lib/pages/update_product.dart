import 'package:flutter/material.dart';
import 'package:flutter_application_ui/common/common_appbar.dart';
import 'package:flutter_application_ui/model/product_model.dart';
import 'package:flutter_application_ui/pages/edt_screen.dart';
import 'package:flutter_application_ui/services/api.dart';

class UpdateProduct extends StatefulWidget {
  const UpdateProduct({super.key});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
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
      trailing: IconButton(onPressed: () {
        Navigator.push (
        context,
        MaterialPageRoute( builder: (context) =>EditScreen(data:pdata[index])),
        );
      },
       icon: const Icon(Icons.edit)),
      );
    }
    
    );
    
    }

    }),
    
    );
  }
}