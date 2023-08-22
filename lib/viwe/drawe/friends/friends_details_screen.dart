// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nfc/view/profilePage.dart';
//
// import '../controller/userFunctionsController.dart';
// import '../reuseableWidgets/customDefaultButton.dart';
// import '../reuseableWidgets/customTextFormField.dart';
//
//
// class ConnectionDetailsScreen extends StatefulWidget {
//   final Map<String, dynamic> dataList;
//
//   const ConnectionDetailsScreen({Key? key, required this.dataList})
//       : super(key: key);
//
//   @override
//   _ConnectionDetailsScreenState createState() => _ConnectionDetailsScreenState();
// }
//
// class _ConnectionDetailsScreenState extends State<ConnectionDetailsScreen>{
//   final GlobalKey<FormState> _formkeydetails = GlobalKey<FormState>();
//
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController titleController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController BioController = TextEditingController();
//
//
//   @override
//   Widget build(BuildContext context) {
//     UserController userController = Get.put(UserController());
//
//     Size size = MediaQuery.of(context).size;
//     return  GetBuilder<UserController>(
//         builder: (controller) {
//           return
//             Scaffold(
//                 backgroundColor: Colors.grey[100],
//                 appBar: AppBar(
//                   automaticallyImplyLeading: true,
//                   elevation: 0,
//                   backgroundColor: Colors.grey[100],
//                   leading: IconButton(onPressed: () {
//                     Get.back();
//                   }, icon: Icon(Icons.arrow_back, color: Colors.black,),),
//
//                 ),
//                 body: SingleChildScrollView(
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 20, right: 20),
//                     child: Form(
//                       key: _formkeydetails,
//                       child:
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: <Widget>[
//                           SizedBox(height: size.height * 0.05,),
//                           CustomPaint(
//                             foregroundPainter: BorderPainter(),
//                             child:
//                             Container(
//                               width: size.width * 0.6,
//                               height: size.height * 0.33,
//                               child: Center(
//                                 child: Column(
//                                   children: [
//                                     CircleAvatar(
//                                       radius: 50,
//                                       backgroundColor: Colors.grey,
//                                       child: Icon(
//                                         Icons.person,
//                                         size: 50,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                     SizedBox(height: 20),
//                                     Text(
//                                       "${widget.dataList["name"]}",
//                                       style: TextStyle(
//                                         fontSize: 24,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     SizedBox(height: 10),
//                                     Text(
//                                       "${widget.dataList["title"]}",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         color: Colors.grey,
//                                       ),
//                                     ),
//                                     SizedBox(height: 10),
//                                     Text(
//                                       "${widget.dataList["phone"]}",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         color: Colors.grey,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),),
//                           SizedBox(height: 50,),
//                           Text("Edit from here", style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold),),
//                           Icon(Icons.undo_rounded),
//                           Container(width: 30, height: 4, color: Colors.grey,),
//                           SizedBox(height: 60,),
//                           CustomTextField(
//                             initialVal: nameController.text,
//                             controller: nameController,
//                             textInputType: TextInputType.name,
//                             validate: (val) {
//                               if (val!.isEmpty) {
//                                 return 'Please enter some text';
//                               }
//                             },
//
//                             onsave: (val) {
//                               nameController.text = val!;
//                             },
//                             onChanged: (val) {
//                               nameController.text = val!;
//                             },
//                             isPassword: false,
//                             isObsecure: false,
//                             hint: "Name",
//                           ),
//                           CustomTextField(
//                             controller: titleController,
//                             initialVal: titleController.text,
//                             textInputType: TextInputType.text,
//                             isPassword: false,
//                             isObsecure: false,
//                             validate: (val) {
//                               if (val!.isEmpty) {
//                                 return 'Please enter some text';
//                               }
//                             },
//                             onsave: (val) {
//                               titleController.text = val!;
//                             },
//                             onChanged: (val) {
//                               titleController.text = val!;
//                             },
//                             hint: "Title",
//                           ),
//                           CustomTextField(
//                             controller: phoneController,
//                             textInputType: TextInputType.phone,
//                             initialVal: phoneController.text,
//                             isPassword: false,
//                             isObsecure: false,
//                             validate: (val) {
//                               if (val!.isEmpty) {
//                                 return 'Please enter some text';
//                               }
//                             },
//                             onsave: (val) {
//                               phoneController.text = val!;
//                             },
//                             onChanged: (val) {
//                               phoneController.text = val!;
//                             },
//                             hint: "Phone",
//                           ),
//                           CustomTextField(
//                             controller: BioController,
//                             initialVal: BioController.text,
//                             textInputType: TextInputType.text,
//                             isPassword: false,
//                             isObsecure: false,
//                             validate: (val) {
//                               if (val!.isEmpty) {
//                                 return 'Please enter some text';
//                               }
//                             },
//                             onsave: (val) {
//                               BioController.text = val!;
//                             },
//                             onChanged: (val) {
//                               BioController.text = val!;
//                             },
//                             hint: "Bio",
//                           ),
//                           SizedBox(height: 40,),
//                           DefaultButton(txt: "Update", function: () {
//                             _formkeydetails.currentState?.save();
//                             if (_formkeydetails.currentState!.validate()) {
//                               userController.updateUser(
//                                   userId: userController.userModel.value.id!,
//                                   newUserName: nameController.text,
//                                   newTitle: titleController.text,
//                                   newPhone: phoneController.text,
//                                   newBio: BioController.text);
//                               Navigator.pop(context);
//                             }
//                           }, bg_color: Colors.black, txt_color: Colors.white),
//                           SizedBox(height: 20,),
//
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//             );
//
//         }
//         );
//   }
//
// }
//
// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// //
// // class UserDialog extends StatelessWidget {
// //   final String userId;
// //
// //   UserDialog({required this.userId, required dataList});
// //
// //   Future<DocumentSnapshot> getUserData() async {
// //     final DocumentReference userRef = FirebaseFirestore.instance
// //         .collection('users')
// //         .doc(userId);
// //     final DocumentSnapshot snapshot = await userRef.get();
// //     return snapshot;
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return FutureBuilder<DocumentSnapshot>(
// //       future: getUserData(),
// //       builder: (context, snapshot) {
// //         if (snapshot.connectionState == ConnectionState.waiting) {
// //           return Center(
// //             child: CircularProgressIndicator(),
// //           );
// //         } else if (snapshot.hasError) {
// //           return Text('Error: ${snapshot.error}');
// //         } else if (!snapshot.hasData) {
// //           return Text('No data found');
// //         } else {
// //           final userData = snapshot.data!.data() as Map<String, dynamic>;
// //           final String name = userData['name'] ?? '';
// //           final String title = userData['title'] ?? '';
// //           final String bio = userData['bio'] ?? '';
// //           final String phone = userData['phone'] ?? '';
// //           final String photoUrl = userData['photoUrl'] ?? '';
// //
// //           return Dialog(
// //             child: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 Image.network(
// //                   photoUrl,
// //                   width: 150,
// //                   height: 150,
// //                   fit: BoxFit.cover,
// //                 ),
// //                 SizedBox(height: 10),
// //                 Text(
// //                   name,
// //                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //                 ),
// //                 SizedBox(height: 5),
// //                 Text(
// //                   title,
// //                   style: TextStyle(fontSize: 16),
// //                 ),
// //                 SizedBox(height: 5),
// //                 Text(
// //                   bio,
// //                   style: TextStyle(fontSize: 16),
// //                 ),
// //                 SizedBox(height: 5),
// //                 Text(
// //                   phone,
// //                   style: TextStyle(fontSize: 16),
// //                 ),
// //                 SizedBox(height: 10),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     Navigator.of(context).pop();
// //                   },
// //                   child: Text('Close'),
// //                 ),
// //               ],
// //             ),
// //           );
// //         }
// //       },
// //     );
// //   }
// // }
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qtap/core/controller/user_functions_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class ConnectionDetailsPage extends StatelessWidget {
  final String? userId;


  ConnectionDetailsPage({required this.userId,});
  UserFunctionsController userController = Get.put(UserFunctionsController());

  @override
  Widget build(BuildContext context) {
    userController.fetchUserData(userId!);


    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child:  GetBuilder<UserFunctionsController>(
                init: UserFunctionsController(),
                builder: (controller) {
                  return        Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                      SizedBox(height: 20,),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.topCenter,
                                width: double.infinity,
                                height: size.height * 0.25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(15),top:Radius.circular(15) ),
                                  image: DecorationImage(
                                    image: NetworkImage(controller.userToShow.value.cover!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 75,),
                            ],
                          ),
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 4,
                              ),
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(controller.userToShow.value.img!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text(
                        controller.userToShow.value.userName!,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        controller.userToShow.value.title!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        controller.userToShow.value.phone!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        controller.userToShow.value.bio!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Platform.isIOS || Platform.isAndroid ?
                              launch("tel://${controller.userToShow.value.phone}") : null;
                            },
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey,width: 1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.call_outlined),
                            ),
                          ),
                          SizedBox(width: 20,),
                          GestureDetector(
                            onTap: (){
                              openEmail(userController.userToShow.value.email!);
                            },
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey,width: 1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.message_outlined),
                            ),
                          ),
                          SizedBox(width: 20,),
                          GestureDetector(
                            onTap:
                                () async {
                              try {
                                final qrCodeBytes = await QrPainter(
                                  data: controller.userToShow.value.id!,
                                  version: QrVersions.auto,
                                  gapless: false,
                                ).toImageData(200.0);
                                final Uint8List bytes = qrCodeBytes!.buffer.asUint8List();
                                await saveQRCodeToGallery(bytes,context);
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Failed to generate QR code')),
                                );
                              }
                            },
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey,width: 1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.download_for_offline_outlined),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: 220,
                        height: size.height * 0.3,
                        child: Center(
                          child: ListView.separated(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: (){
                                launchUrl(Uri.parse(controller.userToShow.value.links![index]['url']));
                              },
                              child: buildListTile(controller.userToShow.value.links![index]['icon'], controller.userToShow.value.links![index]['title'], context,controller.userToShow.value.links![index]['isShown']),) ,
                            itemCount: controller.userToShow.value.links!.length,
                            separatorBuilder: (context, index) => SizedBox(width: 10,),
                          ),
                        ),
                      ),

                    ],
                  );

                }),
          ),
        ),
      ),
    );
  }
  buildListTile(icon,title,context,bool? isShown){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: SizedBox(
        width: 200,
        height: 60,
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: 200,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black,width: 2),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 15,),
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: CachedNetworkImageProvider(icon,)),
                  ),
                  //child: Image.asset(icon,width: 50,height: 50,),
                ),
                SizedBox(width: 5,),
                VerticalDivider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Expanded(child: SizedBox()),
                Text(title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(width: 30,),
              ],
            ),
          ),
        ),
      ),
    );

  }

  void openEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      throw 'Could not launch email app';
    }
  }

  _textMe() async {
    if (Platform.isAndroid) {
      var uri = 'sms:${userController.userToShow.value.phone}?body=hello%20there';
      await launch(uri);
    } else if (Platform.isIOS) {
      // iOS
      var uri = 'sms:${userController.userToShow.value.phone}&body=hello%20there';
      await launch(uri);
    }
  }
  Future<void> saveQRCodeToGallery(Uint8List qrCodeBytes,context) async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    String imagePath = '$tempPath/qr_code.png';

    File imageFile = File(imagePath);
    await imageFile.writeAsBytes(qrCodeBytes);

    File compressedImage = await FlutterNativeImage.compressImage(
      imagePath,
      quality: 90,
      percentage: 70,
    );

    // Save the image to the gallery or a specific location on Android
    if (Platform.isAndroid) {
      final galleryPath = '/storage/emulated/0/Pictures/QRCode';
      final galleryDir = Directory(galleryPath);
      if (!galleryDir.existsSync()) {
        galleryDir.createSync(recursive: true);
      }
      final savedImagePath = '${galleryDir.path}/qr_code.png';
      await compressedImage.copy(savedImagePath);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('QR code saved to gallery')),
      );
    }

    if (Platform.isIOS) {
      final savedImagePath = '${tempPath}/${DateTime.now().toString()}.png'; // Specify the desired path on iOS
      await compressedImage.copy(savedImagePath);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('QR code saved')),
      );
    }
  }
}