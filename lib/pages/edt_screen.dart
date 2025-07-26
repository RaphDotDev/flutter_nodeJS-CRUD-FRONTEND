import 'package:flutter/material.dart';
import 'package:flutter_application_ui/common/common_appbar.dart';
import 'package:flutter_application_ui/model/product_model.dart';
import 'package:flutter_application_ui/services/api.dart';

class EditScreen extends StatefulWidget {
  final Product data;
  const EditScreen({super.key, required this.data});

  @override
  State<EditScreen> createState() => _EditScreenState();
  
}

class _EditScreenState extends State<EditScreen> {

var nameController = TextEditingController();
var priceController = TextEditingController();
var descController = TextEditingController();

@override
void initState(){
super.initState();

nameController.text = widget.data.name.toString();
priceController.text = widget.data.price.toString();
descController.text = widget.data.desc.toString();

}

   @override
  Widget build(BuildContext context) {
    return DefaultAppBar(
    headerTitle: 'Edit Product ',
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

      Api.updateProduct(widget.data.id, {
      "pname":nameController.text,
      "pdesc": descController.text,
      "pprice": priceController.text,
      "id": widget.data.id
      });
      
      }, child: Text("Update Data"))

    ],
    ),
    ),
    );
  }
}