import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../theme.dart';

class Timer extends StatefulWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  MediaQueryData? queryData;
  Color bgcolor = Colors.white;
  var interval = Get.arguments['tit'];
  var tit = Get.arguments['it'];
  var i;


  void _incrementCounter() {
    setState((){
      //_counter++;

    });
  }

  @override
  Widget build(BuildContext context) {
    i=interval.replaceAll(RegExp(r'[^\w\s]+'),'');
    print(i);
    
    queryData = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: context.theme.primaryColor,
      body: Body(),
    );
  }

  Body() {
// final CountDownController controller = new CountDownController();
    return SafeArea(
      child: Center(
        child: Container(
          color: bgcolor,
          height: queryData!.size.height * 0.8,
          width: queryData!.size.width * 0.9,
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                    width: 120,
                    color: Colors.yellow,
                    child:  Text(
                      "Round $tit"  ,
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                      textAlign: TextAlign.center,
                    )),
                const SizedBox(
                  height: 100.0,
                ),
                Text(
                  interval.toString(),
                  style: HeadingStyle,
                ),

                const SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const ShapeDecoration(
                        color: Colors.grey,
                        shape: CircleBorder(),
                      ),
                    child:Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        icon: const Icon(Icons.play_arrow, size: 40,),
                        color: Colors.white,
                        onPressed: () {_incrementCounter();},
                      ),
                    ),
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      decoration: const ShapeDecoration(
                        color: Colors.grey,
                        shape: CircleBorder(),
                      ),
                    child:Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        icon: const Icon(Icons.stop,size: 40),
                        color: Colors.white,
                        onPressed: () {
                          Get.toNamed("/success/");
                        },
                      ),
                    ),
                    ),

                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "No Pain, No Gain",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  String formatDuration(Duration d) {
    String f(int n) {
      return n.toString().padLeft(2, '0');
    }

    // We want to round up the remaining time to the nearest second
    d += Duration(microseconds: 999999);
    return "${f(d.inMinutes)}:${f(d.inSeconds % 60)}";
  }
}
