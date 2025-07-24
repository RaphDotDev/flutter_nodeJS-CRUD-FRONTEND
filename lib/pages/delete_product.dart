import 'package:flutter/material.dart';
import 'package:flutter_application_ui/common/common_appbar.dart';
import 'package:flutter_application_ui/model/product_model.dart';
import 'package:flutter_application_ui/services/api.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultAppBar(
      headerTitle: "Delete Product",
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
      trailing: IconButton(onPressed: () async{
       
     await Api.deleeteProduct(pdata[index].id);

       

      setState(() {
        pdata.removeAt(index);
      });

      },
       icon: const Icon(Icons.delete)),
      );
    }
    
    );
    
    }

    }),
    
    );
  
  }
}