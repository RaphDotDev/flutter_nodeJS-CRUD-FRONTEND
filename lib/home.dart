import 'package:flutter/material.dart';
import 'package:flutter_application_ui/common/common_appbar.dart';
import 'package:flutter_application_ui/pages/create_product.dart';
import 'package:flutter_application_ui/pages/get_product.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultAppBar(
    headerTitle: "Basic CRUD Operations with Node",
    body: Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      ElevatedButton(onPressed: () {
      Navigator.push(context, 
        MaterialPageRoute(
        builder: (BuildContext context) => const CreateProduct(),
      ));
      
       }, child: Text('CREATE')),
      ElevatedButton(onPressed: () {}, child: Text('UPDATE')),
      ElevatedButton(onPressed: () {
      
      Navigator.push(context, 
        MaterialPageRoute(
        builder: (BuildContext context) => const GetProduct(),
      ));
      
      }, child: Text('READ')),
      ElevatedButton(onPressed: () {}, child: Text('DELETE'))
      ],
      
       ),
    ) ,
    );
  }
}