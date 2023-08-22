import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qtap/core/constant/onboarding_constat.dart';
import 'package:qtap/core/controller/user_functions_controller.dart';
import 'package:qtap/viwe/Authentication/widgets/custom_button.dart';
import 'package:qtap/viwe/Authentication/widgets/custom_input_field.dart';

class AddByQrScreen extends StatelessWidget {

  UserFunctionsController userController = Get.put(UserFunctionsController());
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {

    void onQRViewCreated(QRViewController controller) {
      this.controller = controller;
      controller.scannedDataStream.listen((scanData) {
        print(scanData.code); // Print the scanned QR code data
        List userLink = scanData.code!.split('/');
        if(userLink.contains("qtapjo.com")){
          userController.addUserToContacts(userLink.last,context);
        }else{
          showDialog(context: context, builder: (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Text("No user found",style: TextStyle(
                  fontSize: 25,
                ),
                ),
                Expanded(child: SizedBox()),
                CustomButton(color: kBlack, textColor: kWhite, text: "Ok", onPressed: (){Navigator.pop(context);},),
              ],
            ),
          ),

          );
        }
      });
    }

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
                    Text("Add by Qr Code",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 26,
                            color: Colors.black)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back,color: Colors.transparent,)),
                  ],
                ),
                SizedBox(height: size.height * 0.15,),
                Container(
                  height: size.height * 0.6,
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: onQRViewCreated,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
