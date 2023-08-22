import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:qtap/core/constant/onboarding_constat.dart';
import 'package:qtap/core/controller/user_functions_controller.dart';
import 'package:qtap/viwe/Authentication/widgets/custom_button.dart';
import 'package:qtap/viwe/Authentication/widgets/custom_input_field.dart';

class AddByCardScreen extends StatelessWidget {

  UserFunctionsController userController = Get.put(UserFunctionsController());


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back)),
                    Text("Add by Card",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 26,
                            color: Colors.black)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back,color: Colors.transparent,)),
                  ],
                ),

                SizedBox(height: 30,),
                Lottie.asset(
                  'assets/on_boarding/onboarding2.json',
                  /* width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.8, */
                  fit: BoxFit.cover,
                  //width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height,
                ),
                SizedBox(height: 60,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child:
                  CustomButton(color: kBlack, textColor: kWhite, text: "Start scan", onPressed:  (){
                    userController.tagRead(context);
                  },),

                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
