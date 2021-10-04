import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import 'home_page.dart';
class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: context.theme.primaryColor,
      body: SafeArea(
        child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [

              Text("Great you are done", style: TextStyle(fontSize: 20),),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                Get.to(Home());
              }, child: Text("Repeat",style: TextStyle(fontSize: 18)))
              ]
    ),
            ),
        ),
      ),
    );
  }
}
