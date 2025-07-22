import 'package:flutter/material.dart';
import 'package:flutter_application_ui/common/common_appbar.dart';
import 'package:flutter_application_ui/services/api.dart';

class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {

var nameController = TextEditingController();
var priceController = TextEditingController();
var descController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return DefaultAppBar(
    headerTitle: 'Create Product ',
    body: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextField(
      controller: nameController,
      decoration:  const InputDecoration(
      hintText: 'Input your name here',
      ),
      ),

      TextField(
      controller: priceController,
      decoration:  const InputDecoration(
      hintText: 'Input your price here',
      ),
      ),

      TextField(
      controller: descController,
      decoration:  const InputDecoration(
      hintText: 'Input your description here',
      ),
      ),

      SizedBox(height: 15,),

      ElevatedButton(onPressed: () {
      
      var data = {
      "pname": nameController.text,
      "pprice": priceController.text,
      "pdesc": descController.text
      };

      Api.addProduct(data);
      
      }, child: Text("Save"))

    ],
    ),
    ),
    );
  }
}