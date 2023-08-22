import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/controller/user_functions_controller.dart';

class PreviewProfilePage extends StatelessWidget {
  UserFunctionsController userController = Get.put(UserFunctionsController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: GetBuilder<UserFunctionsController>(
                builder: (controller) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Column(
                            children: [
                              InkWell(
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  width: double.infinity,
                                  height: size.height * 0.25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(15),top:Radius.circular(15) ),
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(userController.userModel.value.cover!),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      alignment: Alignment.topRight,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: IconButton(onPressed: (){
                                        var _myDialog;
                                        showDialog(
                                            context: context,
                                            builder: (context) => _myDialog = ClipRRect(
                                              borderRadius: BorderRadius.circular(15),
                                              child: Dialog(
                                                elevation: 2,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20.0),
                                                ),
                                                child: Container(
                                                  width: size.width,
                                                  height: size.height * 0.55,

                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(20.0),
                                                  ),
                                                  child: Center(child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          IconButton(onPressed: (){
                                                            Navigator.pop(context,_myDialog);
                                                          }, icon: Icon(Icons.cancel_outlined)),
                                                        ],
                                                      ),
                                                      Container(
                                                        width: 200,
                                                        height: 200,
                                                        decoration: BoxDecoration(
                                                            shape: BoxShape.rectangle,
                                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                                            image: DecorationImage(image: CachedNetworkImageProvider(userController.userModel.value.cover!))
                                                        ),
                                                      ),
                                                      Expanded(child: SizedBox()),
                                                      Text("Update cover picture"),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: [
                                                          IconButton(onPressed: ()async{
                                                            await userController.uploadUserCover(ImageSource.camera);
                                                            Navigator.pop(context,_myDialog);
                                                          }, icon: Icon(Icons.camera_alt,color: Colors.black,)),
                                                          IconButton(onPressed: ()async{
                                                            await userController.uploadUserCover(ImageSource.gallery);
                                                            Navigator.pop(context,_myDialog);
                                                          }, icon: Icon(Icons.photo_library,color: Colors.black,)),
                                                        ],
                                                      ),
                                                      SizedBox(height: 20,),
                                                    ],
                                                  )),
                                                ),

                                              ),
                                            ));
                                      },icon: Icon(Icons.edit_outlined)),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 75,),
                            ],
                          ),
                          InkWell(
                            onTap: (){
                              var _myDialog;
                              showDialog(
                                  context: context,
                                  builder: (context) => _myDialog = ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Dialog(
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      child: Container(
                                        width: size.width,
                                        height: size.height * 0.55,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                        child: Center(child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                IconButton(onPressed: (){
                                                  Navigator.pop(context,_myDialog);
                                                }, icon: Icon(Icons.cancel_outlined)),
                                              ],
                                            ),
                                            Container(
                                              width: 200,
                                              height: 200,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                                  image: DecorationImage(image: CachedNetworkImageProvider(userController.userModel.value.img!))
                                              ),
                                            ),
                                            Expanded(child: SizedBox()),
                                            Text("Update profile picture"),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                IconButton(onPressed: ()async{
                                                  await userController.uploadUserImage(ImageSource.camera);
                                                  Navigator.pop(context,_myDialog);
                                                }, icon: Icon(Icons.camera_alt,color: Colors.black,)),
                                                IconButton(onPressed: ()async{
                                                  await userController.uploadUserImage(ImageSource.gallery);
                                                  Navigator.pop(context,_myDialog);
                                                }, icon: Icon(Icons.photo_library,color: Colors.black,)),
                                              ],
                                            ),
                                            SizedBox(height: 20,),
                                          ],
                                        )),
                                      ),

                                    ),
                                  ));
                            },
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 4,
                                ),
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(userController.userModel.value.img!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text(
                        userController.userModel.value.userName!,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        userController.userModel.value.title!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        userController.userModel.value.phone!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        userController.userModel.value.bio!,
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
                              launch("tel://${userController.userModel.value.phone}") : null;
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
                              _textMe();
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
                                  data: userController.userModel.value.id!,
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
                                launchUrl(Uri.parse(userController.userModel.value.links![index]['url']));
                              },
                              child: buildListTile(userController.userModel.value.links![index]['icon'], userController.userModel.value.links![index]['title'], context,userController.userModel.value.links![index]['isShown']),) ,
                            itemCount: userController.userModel.value.links!.length,
                            separatorBuilder: (context, index) => SizedBox(width: 10,),
                          ),
                        ),
                      ),

                    ],
                  );
                }
            ),
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
  _textMe() async {
    if (Platform.isAndroid) {
      var uri = 'sms:${userController.userModel.value.phone}?body=hello%20there';
      await launch(uri);
    } else if (Platform.isIOS) {
      // iOS
      var uri = 'sms:${userController.userModel.value.phone}&body=hello%20there';
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