import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qtap/viwe/Authentication/widgets/custom_list_tile.dart';
import 'package:qtap/viwe/drawe/friends/addMethods/addByCard.dart';
import 'package:qtap/viwe/drawe/friends/addMethods/addByLink.dart';
import 'package:qtap/viwe/drawe/friends/addMethods/addByQrCode.dart';
import 'package:qtap/viwe/drawe/friends/addMethods/createNew.dart';

class AddNewOptions extends StatelessWidget {
  const AddNewOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                  Text("Add new",
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
              Image.asset("assets/logo.jpg",width: 200,height: 200,),
              SizedBox(height: 20,),
              CustomListTile(title: "Create", icon: Icons.add,onTap: (){
                Get.to(()=> CreateNewContactScreen());
              },),
              CustomListTile(title: "Add by link", icon: Icons.link,onTap: (){
                Get.to(()=>AddByLinkScreen());
              },),
              CustomListTile(title: "Add by card", icon: Icons.add_card_rounded,onTap: (){
                Get.to(()=> AddByCardScreen());
              },),
              CustomListTile(title: "Add by QR code", icon: Icons.qr_code_sharp,onTap: (){
                Get.to(AddByQrScreen());
              },),
            ],
          ),
        ),
      ),
    );
  }
}
