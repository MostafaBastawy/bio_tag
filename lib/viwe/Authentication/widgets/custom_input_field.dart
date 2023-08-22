import 'package:flutter/material.dart';

import '../../../core/constant/onboarding_constat.dart';
import 'package:get/get.dart';



class CustomInputField extends StatelessWidget {
  CustomInputField({
    Key? key,
    this.text,
    this.hint,
    this.validate,
    this.onsave,
    this.controller,
    this.isPassword,
    this.isObsecure,
    this.textInputType,
    this.onChanged,
    this.initialVal,
    this.prefixIcon,
  }) : super(key: key);
  final String? text;
  final String? initialVal;
  final TextEditingController? controller;
  final String? hint;
  final String? Function(String?)? validate;
  final String? Function(String?)? onsave;
  final bool? isPassword;
  bool? isObsecure;

  final TextInputType? textInputType;
  final String? Function(String?)? onChanged;
  final prefixIcon;

  @override
  Widget build(BuildContext context) {
    return
      StatefulBuilder(builder: (context, setState) {
      return  TextFormField(
      initialValue: initialVal != null ? initialVal : null,
      onSaved: onsave,
      validator: validate,
      obscureText: isObsecure!,
      keyboardType: textInputType,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(kPaddingM),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.30)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.30)),
        ),
        hintText: "   $hint",

        hintStyle: TextStyle(color: Colors.grey,),
        fillColor: Colors.white,
        suffixIcon: isPassword!
            ? IconButton(
          icon: Icon(
            isObsecure!
                ? Icons.visibility
                : Icons.visibility_off,
            color: isObsecure!
                ? Colors.black
                : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              isObsecure = !isObsecure!;
            });
          },
          alignment: Alignment.center,
          // padding: EdgeInsets.only(bottom: 50),
        )
            : SizedBox.shrink(),
      ),
    );
      }
      );

  }
}
