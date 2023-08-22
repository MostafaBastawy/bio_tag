import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:qtap/core/constant/onboarding_constat.dart';
import 'package:qtap/core/controller/user_functions_controller.dart';
import 'package:qtap/viwe/Authentication/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Authentication/widgets/custom_list_tile.dart';

class Settings extends StatelessWidget {

   UserFunctionsController userController = Get.put(UserFunctionsController());

  @override
  Widget build(BuildContext context) {

    void _modalBottomSheetMenu(){
      userController.ndefWrite("https://qtapjo.com/${userController.userModel.value.id}",context);
      showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          context: context,
          builder: (builder){
            return new
            Container(
              height: 800.0,
              decoration: new BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(20.0),
                      topRight: const Radius.circular(20.0))),
              child: new Container(
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(20.0),
                          topRight: const Radius.circular(20.0))),
                  child: new Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child:

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 5,),
                                  Container(width: 30,height: 4,color: Colors.grey,),
                                  Lottie.asset(
                                    'assets/on_boarding/onboarding2.json',
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 2,),
                               Text("Move your Card to activation",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 18),),
                                  SizedBox(height: 5,),
                                ],
                              ),


                    ),

                  )),
            );
          }
      );
    }

    Future<void> showDeleteAccountDialog() async {
      await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          actions: [
            Padding(
              padding: const EdgeInsets.all(20.0),
          child:      CustomButton(
            textColor: kWhite,
            color: kBlack,
            onPressed:
                (){
              Navigator.pop(context);
            },
            text: "yes",
          ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child:
              CustomButton(
                textColor: kWhite,
                color: kBlack,
                onPressed:
                    (){
                  Navigator.pop(context);
                },
                text: "no",
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),

          contentPadding: EdgeInsets.zero,
          content: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [kDarkBlue, Color(0xffFFFFFF).withOpacity(0.4)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            height: MediaQuery.of(context).size.height * 0.24,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Delete my account',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Are you sure that you want to delete your account?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Text("Settings",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 26,color: Colors.black)),
      ),
      // backgroundColor: Colors.grey[100],

      body: SingleChildScrollView(child: Center(
        child:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child:  Column(
            children: [
              SizedBox(height: 40,),
              SizedBox(height: 40,),
              CustomListTile(title: "Activate your product", icon: Icons.arrow_forward_ios,onTap: (){_modalBottomSheetMenu();},),
              CustomListTile(title: "Get QTap Product", icon: Icons.arrow_forward_ios,onTap: ()async{
                 await launch("https://qtapjo.shop/");
              },),
              GetBuilder<UserFunctionsController>(
                  builder: (controller) {
                    return
                      CustomListTile(title: "Logout", icon: Icons.logout, onTap: (){controller.logout();},);
                  }
              ),
              SizedBox(height: 40,),

              GetBuilder<UserFunctionsController>(
                  builder: (controller) {
                    return
                      CustomListTile(title: "Delete my account".tr,
                        icon: Icons.delete_outline,
                        color: Colors.grey.withOpacity(0.9),
                        onTap: () {
                          showDeleteAccountDialog();
                        },);
                  }
              ),
            ],

            //CSPzDRNJ74cJnZaHFYdryQ0oKqB2
          ),
        ),
      ),
      ),
    );

  }



}


