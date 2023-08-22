// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:qtap/core/constant/onboarding_constat.dart';
// import 'package:qtap/core/controller/add_friends.dart';
// import 'package:qtap/core/controller/user_functions_controller.dart';
// import 'package:qtap/viwe/Authentication/widgets/custom_button.dart';
// import 'package:qtap/viwe/Authentication/widgets/custom_input_field.dart';
//
// class AddConnectionPage extends StatelessWidget {
//   AddConnectionController addController = Get.put(AddConnectionController());
//   UserFunctionsController userController = Get.put(UserFunctionsController());
//   TextEditingController nameController = TextEditingController();
//   TextEditingController titleController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController linkController = TextEditingController();
//
//   bool isLoading = false; // Add a isLoading flag
//   final GlobalKey<FormState> _formkeey = GlobalKey<FormState>();
//   QRViewController? controller;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     void onQRViewCreated(QRViewController controller) {
//       this.controller = controller;
//       controller.scannedDataStream.listen((scanData) {
//         print(scanData.code); // Print the scanned QR code data
//         List userLink = scanData.code!.split('/');
//         if(userLink.contains("qtapjo.com")){
//           userController.addUserToContacts(userLink.last,context);
//         }else{
//           showDialog(context: context, builder: (context) => Dialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Column(
//               children: [
//                 Text("No user found",style: TextStyle(
//                   fontSize: 25,
//                 ),
//                 ),
//                 Expanded(child: SizedBox()),
//                 CustomButton(color: kBlack, textColor: kWhite, text: "Ok", onPressed: (){Navigator.pop(context);},),
//               ],
//             ),
//           ),
//
//           );
//         }
//       });
//     }
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           width: size.width,
//           height: size.height,
//           child: GetBuilder<AddConnectionController>(builder: (controller) {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                         onPressed: () {
//                           Get.back();
//                         },
//                         icon: Icon(Icons.arrow_back)),
//                     Text("Add new",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w700,
//                             fontSize: 26,
//                             color: Colors.black)),
//                     IconButton(
//                         onPressed: () {},
//                         icon: Icon(Icons.arrow_back,color: Colors.transparent,)),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 25,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   child: Container(
//                     height: 40,
//                     width: size.width,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             addController.changeIndex(0);
//                           },
//                           child: Container(
//                             height: 30,
//                             width: 180,
//                             decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.black),
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: Center(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text("Create"),
//                                   SizedBox(
//                                     width: 5,
//                                   ),
//                                   Icon(Icons.add),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 5,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             addController.changeIndex(1);
//                           },
//                           child: Container(
//                             height: 30,
//                             width: 180,
//                             decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.black),
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: Center(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text("Add by link"),
//                                   SizedBox(
//                                     width: 5,
//                                   ),
//                                   Icon(Icons.link),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 5,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             addController.changeIndex(2);
//                           },
//                           child: Container(
//                             height: 30,
//                             width: 180,
//                             decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.black),
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: Center(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text("Add by card"),
//                                   SizedBox(
//                                     width: 5,
//                                   ),
//                                   Icon(Icons.add_card),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 5,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             addController.changeIndex(3);
//                           },
//                           child: Container(
//                             height: 30,
//                             width: 180,
//                             decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.black),
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: Center(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text("Add by QR code"),
//                                   SizedBox(
//                                     width: 5,
//                                   ),
//                                   Icon(Icons.qr_code),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 if (controller.currentIndex.value == 0)
//                   Expanded(
//                     child: Form(
//                       key: _formkeey,
//                       child: Container(
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                           child: SingleChildScrollView(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 SizedBox(height: 50,),
//                                 CustomInputField(
//                                   initialVal: nameController.text,
//
//                                   controller: nameController,
//                                   textInputType: TextInputType.name,
//                                   validate: (val) {
//                                     if (val!.isEmpty) {
//                                       return 'Please enter some text';
//                                     }
//                                   },
//                                   onsave: (val) {
//                                     nameController.text = val!;
//                                   },
//                                   onChanged: (val) {
//                                     nameController.text = val!;
//                                   },
//                                   isPassword: false,
//                                   isObsecure: false,
//                                   hint: "Name",
//                                 ),
//                                 SizedBox(height: 20,),
//                                 CustomInputField(
//                                   controller: titleController,
//                                   initialVal: titleController.text,
//                                   textInputType: TextInputType.text,
//                                   isPassword: false,
//                                   isObsecure: false,
//                                   validate: (val) {
//                                     if (val!.isEmpty) {
//                                       return 'Please enter some text';
//                                     }
//                                   },
//                                   onsave: (val) {
//                                     titleController.text = val!;
//                                   },
//                                   onChanged: (val) {
//                                     titleController.text = val!;
//                                   },
//                                   hint: "Title",
//                                 ),
//                                 SizedBox(height: 20,),
//                                 CustomInputField(
//                                   controller: phoneController,
//                                   textInputType: TextInputType.phone,
//                                   initialVal: phoneController.text,
//                                   isPassword: false,
//                                   isObsecure: false,
//                                   validate: (val) {
//                                     if (val!.isEmpty) {
//                                       return 'Please enter some text';
//                                     }
//                                   },
//                                   onsave: (val) {
//                                     phoneController.text = val!;
//                                   },
//                                   onChanged: (val) {
//                                     phoneController.text = val!;
//                                   },
//                                   hint: "Phone",
//                                 ),
//                                 SizedBox(height: 20,),
//                                 CustomInputField(
//                                   controller: emailController,
//                                   initialVal: emailController.text,
//                                   textInputType: TextInputType.text,
//                                   isPassword: false,
//                                   isObsecure: false,
//                                   validate: (val) {
//                                     if (val!.isEmpty) {
//                                       return 'Please enter some text';
//                                     }
//                                   },
//                                   onsave: (val) {
//                                     emailController.text = val!;
//                                   },
//                                   onChanged: (val) {
//                                     emailController.text = val!;
//                                   },
//                                   hint: "Email",
//                                 ),
//                                 SizedBox(
//                                   height: 40,
//                                 ),
//
//                                 CustomButton(color: kBlack, textColor: kWhite, text: "Add connection", onPressed: () async {
//                                   _formkeey.currentState?.save();
//                                   if (_formkeey.currentState!.validate()) {
//                                     userController.addConnectionContact(
//                                       userController.userModel.value.id!,
//                                       nameController.text,
//                                       phoneController.text,
//                                       titleController.text,
//                                       emailController.text,
//                                     );
//                                     nameController.clear();
//                                     titleController.clear();
//                                     phoneController.clear();
//                                     Get.back();
//                                   }
//                                 },),
//
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 else if (controller.currentIndex.value == 1)
//                   Expanded(
//                     child: Container(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             CustomInputField(
//                               initialVal: "https://qtapjo.com/",
//                               textInputType: TextInputType.text,
//                               hint: "Link",
//                               controller: linkController,
//                               onsave: (val){
//                                 linkController.text = "https://qtapjo.com/$val";
//                               },
//                               onChanged: (val){
//                                 linkController.text = "https://qtapjo.com/$val";
//                                 print(linkController.text);
//                               },
//                               isPassword: false,
//                               isObsecure: false,
//                             ),
//                             SizedBox(height: 30,),
//
//                             CustomButton(color: kBlack, textColor: kWhite, text: "Add contact", onPressed: (){
//                               List userData = linkController.text.split('/');
//                               print(userData.last);
//                               userController.addUserToContacts(userData.last,context);
//                             },),
//                           ],
//                         ),
//                       ),
//                     ),
//                   )
//                 else if (controller.currentIndex.value == 2)
//                     Expanded(
//                       child: Container(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Lottie.asset(
//                               'assets/on_boarding/onboarding2.json',
//                               /* width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height * 0.8, */
//                               fit: BoxFit.cover,
//                               //width: MediaQuery.of(context).size.width,
//                               // height: MediaQuery.of(context).size.height,
//                             ),
//                             SizedBox(height: 20,),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                               child:
//                               CustomButton(color: kBlack, textColor: kWhite, text: "Start scan", onPressed:  (){
//                                      userController.tagRead(context);
//                               },),
//
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   else if (controller.currentIndex.value == 3)
//                       Expanded(
//                         child: Container(
//                           child: QRView(
//                             key: qrKey,
//                             onQRViewCreated: onQRViewCreated,
//                           ),
//                         ),
//                       )
//                     else
//                       Container(
//                         color: Colors.lime,
//                       ),
//               ],
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
