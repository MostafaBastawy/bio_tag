import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../core/controller/user_functions_controller.dart';


class UserQRCode extends StatelessWidget {
  UserFunctionsController userController = Get.put(UserFunctionsController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          'Here You Go',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,),onPressed: (){
          Get.back();
        },),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: kInnerDecoration,
                  child:     QrImageView(data: "https://qtapjo.com/${userController.userModel.value.id}",size: 200,),


                  //QrImage(data: "https://qtapjo.com/${userController.userModel.value.id}",size: 200,),

                ),
              ),
              decoration: kGradientBoxDecoration,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Scan this QR Code with your friend and share your Profile',
            textAlign: TextAlign.center,
            //style:
            // GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w300),
          ),

          SizedBox(height: 40,),

          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: InkWell(
                onTap: (){
                  Clipboard.setData(new ClipboardData(text: "https://qtapjo.com/${userController.userModel.value.id}"
                  ),);
                  ScaffoldMessenger.of(context).showSnackBar(
                      new SnackBar(content: new Text("Copied to Clipboard",),backgroundColor: Colors.grey.withOpacity(0.1)));
                },
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: size.width,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(width: 15,),
                          Icon(Icons.copy,color: Colors.black,),
                          SizedBox(width: 15,),
                          Container(
                            height: 60,
                            width: 2,
                            color: Colors.black,
                          ),
                          Container(
                            width: size.width * 0.7,
                            child: SelectableText(
                              "https://qtapjo.com/${userController.userModel.value.id}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )

            // CustomTextField(
            //   initialVal: "https://jamilcards.com/#/${controller.userModel.value.id}",
            //   controller: userId,
            //   isObsecure: false,
            //   isPassword: false,
            //   hint: "User Id",
            //   onChanged: (val){
            //     userId.text = "https://jamilcards.com/#/${controller.userModel.value.id}";
            //   },
            //   onsave: (val){
            //       userId.text = "https://jamilcards.com/#/${controller.userModel.value.id}";
            //   },
            // ),
          ),
        ],
      ),
    );
  }
}

final kInnerDecoration = BoxDecoration(
  color: Colors.white,
  border: Border.all(color: Colors.white),
  borderRadius: BorderRadius.circular(32),
);

final kGradientBoxDecoration = BoxDecoration(
  gradient: const LinearGradient(
      colors: [Colors.pink, Colors.redAccent, Colors.cyan]),
  border: Border.all(
    color: Colors.black,
  ),
  borderRadius: BorderRadius.circular(32),
);