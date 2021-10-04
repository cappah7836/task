import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  final Function()? onTap;
  final TextInputFormatter? formater;
  const InputField({Key? key, required this.title,required this.hint, this.controller, this.widget, this.formater, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          const SizedBox(height: 5.0,),
           Container(
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: onTap,
                      child: TextFormField(
                       inputFormatters: [formater==null?FilteringTextInputFormatter(RegExp(r"^\d?\.?\d{0}"), allow: false):FilteringTextInputFormatter(RegExp(r"^\d?\.?\d{0}"), allow: true)],
                       readOnly: widget == null ? false : true,
                        autofocus: false,
                        style: SubtitleStyle,
                        cursorColor: Colors.grey[700],
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: hint,

                          hintStyle: SubtitleStyle,
                          focusedBorder:const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 0
                            ),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color:Colors.grey,
                                width: 0
                            ),
                          ),
                        ),

                      ),
                    ),
                  ),
                  widget==null?Container():Container(child: widget)
                ],
              ),
              width: queryData.size.width,
            ),

        ],
      ),
    );
  }
}
