import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qtap/core/constant/onboarding_constat.dart';
import 'package:qtap/core/controller/user_functions_controller.dart';
import 'package:qtap/viwe/Authentication/widgets/custom_button.dart';
import 'package:qtap/viwe/Authentication/widgets/custom_input_field.dart';

class AddByLinkScreen extends StatelessWidget {

  TextEditingController linkController = TextEditingController();
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
                    Text("Add by link",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 26,
                            color: Colors.black)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back,color: Colors.transparent,)),
                  ],
                ),

                SizedBox(height: size.height / 3 ,),
                CustomInputField(
                  initialVal: "https://qtapjo.com/",
                  textInputType: TextInputType.text,
                  hint: "Link",
                  controller: linkController,
                  onsave: (val){
                    linkController.text = "https://qtapjo.com/$val";
                  },
                  onChanged: (val){
                    linkController.text = "https://qtapjo.com/$val";
                    print(linkController.text);
                  },
                  isPassword: false,
                  isObsecure: false,
                ),
                SizedBox(height: 30,),
                CustomButton(color: kBlack, textColor: kWhite, text: "Add contact", onPressed: (){
                  List userData = linkController.text.split('/');
                  print(userData.last);
                  userController.addUserToContacts(userData.last,context);
                },),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
