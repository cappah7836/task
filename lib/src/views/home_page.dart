import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snack.dart';
import 'package:intl/intl.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:task/src/views/timer_page.dart';
import 'package:task/src/views/widgets/buttons.dart';
import 'package:task/src/views/widgets/input_field.dart';

import '../theme.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController _intervalController = TextEditingController();

  Duration initialtimer = new Duration();
  Duration initialtimer2 = new Duration();
  String? time, time2;
  int? timeer;
  MediaQueryData? queryData;

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: context.theme.primaryColor,
      body: Body(),
    );
  }
  Body(){
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(

            children: [

              InputField(title: "Total Training Intervals", hint: "", controller: _intervalController, formater: FilteringTextInputFormatter(RegExp(r"^\d?\.?\d{0}"), allow: true),),
              const SizedBox(height: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Training Interval Time",
                    style: titleStyle,
                  ),
                  const SizedBox(height: 5.0,),
                  GestureDetector(
                    onTap: (){
                      _openTimer();
                    },
                    child: Container(
                      width: queryData!.size.width,
                      margin: const EdgeInsets.only(top: 10),
                      padding:const EdgeInsets.only(left: 8, right: 9),
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              width: 1.0
                          ),
                          borderRadius: BorderRadius.circular(12.0)
                      ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, top:15),
                      child: time == null ? Container() : Text("$time", style: SubtitleStyle,),
                    ),
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Break Interval Time",
                    style: titleStyle,
                  ),
                  const SizedBox(height: 5.0,),
                  GestureDetector(
                    onTap: (){
                      _openTimer2();
                    },
                    child: Container(
                      width: queryData!.size.width,
                      margin: const EdgeInsets.only(top: 10),
                      padding:const EdgeInsets.only(left: 8, right: 9),
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              width: 1.0
                          ),
                          borderRadius: BorderRadius.circular(12.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, top:15),
                        child: time2 == null ? Container() : Text("$time2", style: SubtitleStyle,),
                      ),
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 20,),
              Buttons(label: "Submit", onTap: ()=>_validateFields()),
          ],
          ),
        ),
      ),
    );
  }
  _validateFields(){
    if(_intervalController.text.isNotEmpty&&time != null&&time2 != null){
      Get.toNamed("/timer/", arguments: {
        'tti': _intervalController.text.toString(), 'tit': time, 'bit': time2, 'it': _intervalController.text
      });
    }
    else if(_intervalController.text.isEmpty){
      Get.snackbar("Alert", "Please enter #No of intervals.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          icon: const Icon(Icons.warning_amber_rounded));
    }
    else if(time == null){
      Get.snackbar("Alert", "Please enter training duration.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          icon: const Icon(Icons.warning_amber_rounded));
    }
    else if(time2 == null){
      Get.snackbar("Alert", "Please enter break duration.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          icon: const Icon(Icons.warning_amber_rounded));
    }
    else{
      Get.snackbar("Alert", "Something went wrong",
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.info));
    }
  }
  _openTimer(){
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (builder) {
        return Container(
            height:
            MediaQuery.of(context).copyWith().size.height / 3,
            child: SizedBox.expand(
              child: CupertinoTimerPicker(
                mode: CupertinoTimerPickerMode.ms,
                onTimerDurationChanged: (Duration changedtimer) {
                  setState(() {
                    initialtimer = changedtimer;


                    String twoDigits(int n) => n.toString().padLeft(2, "0");
                    String twoDigitMinutes = twoDigits(changedtimer.inMinutes.remainder(60));
                    String twoDigitSeconds = twoDigits(changedtimer.inSeconds.remainder(60));
                     time ="$twoDigitMinutes:$twoDigitSeconds";


                  });
                },
              ),
            ));
      },  // fix form
    );
  }
  _openTimer2(){
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (builder) {
        return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            child: SizedBox.expand(
              child: CupertinoTimerPicker(
                mode: CupertinoTimerPickerMode.ms,
                onTimerDurationChanged: (Duration changedtimer2) {
                  setState(() {
                    initialtimer2 = changedtimer2;

                    String twoDigits(int n) => n.toString().padLeft(2, "0");
                    String twoDigitMinutes = twoDigits(changedtimer2.inMinutes.remainder(60));
                    String twoDigitSeconds = twoDigits(changedtimer2.inSeconds.remainder(60));
                    time2 ="$twoDigitMinutes:$twoDigitSeconds";
                  });
                },
              ),
            ));
      },  // fix form
    );
  }


}
