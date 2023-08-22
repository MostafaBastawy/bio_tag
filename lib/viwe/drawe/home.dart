import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qtap/core/constant/onboarding_constat.dart';
import 'package:qtap/viwe/Authentication/widgets/custom_button.dart';
import 'package:qtap/viwe/Authentication/widgets/custom_input_field.dart';
import 'package:qtap/viwe/drawe/qr_profile.dart';
import 'package:share/share.dart';
import '../../core/controller/user_functions_controller.dart';
import '../../core/widget_reuseable/social_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  TextEditingController nameController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController urlTitleController = TextEditingController();
  TextEditingController newUrlController = TextEditingController();

  UserFunctionsController userController = Get.put(UserFunctionsController());



  Widget buildSpacer({double? val = 15}) {
    return SizedBox(
      height: val,
    );
  }

  showQRCode(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => UserQRCode()));
  }

  void _modalBottomSheetEditLink(context,title,currentUrl){
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (builder){
          urlTitleController.text = title;
          newUrlController.text = currentUrl;
          print("From urlTitle: ${urlTitleController.text}");
          return GetBuilder<UserFunctionsController>(
              builder: (controller) {
                return SingleChildScrollView(
                  child: new Container(
                    height: 650.0,
                    decoration: new BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(20.0),
                            topRight: const Radius.circular(20.0))),
                    //could change this to Color(0xFF737373),
                    //so you don't have to change MaterialApp canvasColor
                    child: new Container(
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(20.0),
                                topRight: const Radius.circular(20.0))),
                        child: new Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Form(
                              key: _formkey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 5,),
                                  Container(width: 30,height: 4,color: Colors.grey,),
                                  SizedBox(height: 60,),
                                  CustomInputField(
                                    initialVal: urlTitleController.text,
                                    controller: urlTitleController,
                                    textInputType: TextInputType.name,
                                    validate: (val){if (val!.isEmpty) {
                                      return 'Please enter some text';
                                    }},
                                    onsave: (val){
                                      urlTitleController.text = val!;
                                    },
                                    onChanged: (val){
                                      urlTitleController.text = val!;
                                    },
                                    isPassword: false,
                                    isObsecure: false,
                                    hint: "Title",
                                  ),
                                  SizedBox(height: 20,),
                                  CustomInputField(
                                    controller: newUrlController,
                                    initialVal: newUrlController.text,
                                    textInputType: TextInputType.text,
                                    isPassword: false,
                                    isObsecure: false,
                                    validate: (val){if (val!.isEmpty) {
                                      return 'Please enter some text';
                                    }},
                                    onsave: (val){newUrlController.text = val!;},
                                    onChanged: (val){newUrlController.text = val!;},
                                    hint: "Url",
                                  ),

                                  SizedBox(height: 40,),
                                  CustomButton(color: kBlack, textColor: kWhite, text:  "Update", onPressed: (){ _formkey.currentState?.save();
                                  if (_formkey.currentState!.validate()) {
                                    userController.updateUrlInLinksField(urlTitleController.text, newUrlController.text);
                                    Navigator.pop(context);
                                  }}),
                                  SizedBox(height: 15,),
                                  CustomButton(color: Colors.red, textColor: kWhite, text:  "Delete", onPressed: (){ _formkey.currentState?.save();
                _formkey.currentState?.save();
                if (_formkey.currentState!.validate()) {
                userController.deleteLinkFromLinksField(currentUrl,);
                Navigator.pop(context);
                }
                                  }),
                                  SizedBox(height: 20,),
                                ],
                              ),
                            ),
                          ),
                        )),
                  ),
                );
              }
          );
        }
    );
  }

  void _modalBottomSheetUpdateProfile(context){
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (builder){
          nameController.text = userController.userModel.value.userName!;
          titleController.text = userController.userModel.value.title!;
          phoneController.text = userController.userModel.value.phone!;
          bioController.text = userController.userModel.value.bio!;

          print("From name: ${nameController.text}");
          return GetBuilder<UserFunctionsController>(
              builder: (controller) {
                return SingleChildScrollView(
                  child: new Container(
                    height: 650.0,
                    decoration: new BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(20.0),
                            topRight: const Radius.circular(20.0))),
                    //could change this to Color(0xFF737373),
                    //so you don't have to change MaterialApp canvasColor
                    child: new Container(
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(20.0),
                                topRight: const Radius.circular(20.0))),
                        child: new Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Form(
                              key: _formkey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 5,),
                                  Container(width: 30,height: 4,color: Colors.grey,),
                                  SizedBox(height: 20,),
                                  CustomInputField(
                                    initialVal: nameController.text,
                                    controller: nameController,
                                    textInputType: TextInputType.name,
                                    validate: (val){if (val!.isEmpty) {
                                      return 'Please enter some text';
                                    }},

                                    onsave: (val){
                                      nameController.text = val!;
                                    },
                                    onChanged: (val){
                                      nameController.text = val!;
                                    },
                                    isPassword: false,
                                    isObsecure: false,
                                    hint: "Name",
                                  ),
                                  SizedBox(height: 20,),
                                  CustomInputField(
                                    controller: titleController,
                                    initialVal: titleController.text,
                                    textInputType: TextInputType.text,
                                    isPassword: false,
                                    isObsecure: false,
                                    validate: (val){if (val!.isEmpty) {
                                      return 'Please enter some text';
                                    }},
                                    onsave: (val){titleController.text = val!;},
                                    onChanged: (val){titleController.text = val!;},
                                    hint: "Title",
                                  ),
                                  SizedBox(height: 20,),
                                  CustomInputField(
                                    controller: phoneController,
                                    textInputType: TextInputType.phone,
                                    initialVal: phoneController.text,
                                    isPassword: false,
                                    isObsecure: false,
                                    validate: (val){if (val!.isEmpty) {
                                      return 'Please enter some text';
                                    }},
                                    onsave: (val){phoneController.text = val!;},
                                    onChanged: (val){phoneController.text = val!;},
                                    hint: "Phone",
                                  ),
                                  SizedBox(height: 20,),
                                  CustomInputField(
                                    controller: bioController,
                                    initialVal: bioController.text,
                                    textInputType: TextInputType.text,
                                    isPassword: false,
                                    isObsecure: false,
                                    validate: (val){if (val!.isEmpty) {
                                      return 'Please enter some text';
                                    }},
                                    onsave: (val){bioController.text = val!;},
                                    onChanged: (val){bioController.text = val!;},
                                    hint: "Bio",
                                  ),
                                  SizedBox(height: 40,),
                                  CustomButton(color: kBlack, textColor: kWhite, text: "Update", onPressed: (){
                                    _formkey.currentState?.save();
                                    if (_formkey.currentState!.validate()) {
                                      userController.updateUser(userId: userController.userModel.value.id!,newUserName:  nameController.text,newTitle:  titleController.text,newPhone:  phoneController.text,newBio: bioController.text);
                                      Navigator.pop(context);
                                    }
                                  }),
                                  SizedBox(height: 20,),
                                ],
                              ),
                            ),
                          ),
                        )),
                  ),
                );
              }
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<UserFunctionsController>(
        builder: (controller) {
      return userController.userModel.value.userName!= null ?
      Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(

        backgroundColor: kWhite,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        actions: [
          SizedBox(width: 20,),
          GestureDetector(
            onTap: ()async{
              _modalBottomSheetUpdateProfile(context);


            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Icon(Icons.edit,weight: 28,size: 40,color: Colors.black,),
              ),
            ),
          ),
          SizedBox(width: 20,),

          GestureDetector(
            onTap: ()async{
              // await shortenUrl('https://qtapjo.com/${userController.userModel.value.id}');
              Share.share("https://qtapjo.com/${userController.userModel.value.id}");
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Image.asset("assets/share.png",width: 28,height: 28,),
              ),
            ),
          ),
          SizedBox(width: 20,),


        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

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
                          color: Colors.white,
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
                                decoration:
                                BoxDecoration(
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
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: CachedNetworkImageProvider(userController.userModel.value.img!),fit: BoxFit.cover,)
                ),
              ),
            ),
            SizedBox(height: 20),
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
            SizedBox(height: 20),

            // Divider(color: Colors.black, thickness: 1),
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the container
                borderRadius: BorderRadius.circular(10), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 5, // Blur radius
                    offset: Offset(0, 3), // Offset of the shadow
                  ),
                ],
              ),
              child: ListTile(
                title: Text(
                  'Share Your QR Code',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(
                  Icons.qr_code,
                  size: 30,
                  color: Colors.black,
                ),
                onTap: () {
                  showQRCode(context);
                },
              ),
            )
,
            SizedBox(height: 20),
            userController.userModel.value.links!.length > 0 ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black,width: 1,),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                child: Column(
                  children: [
                    userController.userModel.value.links!.length > 0 ?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 10,),
                        Text(
                          "Shared Social Links",
                          style: TextStyle(
                            fontSize: 20,

                          ),
                        ),
                        SizedBox(width: 10,),
                      ],
                    ): SizedBox.shrink(),
                    // :SizedBox.shrink(),
                    SizedBox(height: 20,),
                    userController.userModel.value.links!.length > 0 ?
                    Wrap(
                      children: [
                        ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => buildListTile(userController.userModel.value.links![index]['icon'], userController.userModel.value.links![index]['title'], context,userController.userModel.value.links![index]['isShown'],userController.userModel.value.links![index]['url']),
                          itemCount: userController.userModel.value.links!.length,
                          separatorBuilder: (context, index) => SizedBox(width: 10,),
                        ),],
                    ) : SizedBox.shrink(),
                  ],
                ),
              ),
            ):SizedBox.shrink(),

          ],
        ),
      ),
    )
          :Center(child: CircularProgressIndicator(
        color: Colors.black,
      ),
      );
        }

    );

  }
  buildListTile(icon,title,context,bool? isShown,url){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: SizedBox(
        width: 280,
        height: 60,
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: 280,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black,width: 2),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Row(
              children: [
                SizedBox(width: 15,),
                IconButton(onPressed: (){
                  _modalBottomSheetEditLink(context, title, url);
                }, icon: Icon(Icons.edit)),
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
                Text(title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                Expanded(child: SizedBox()),
                StatefulBuilder(
                    builder: (context,setState) {
                      return CupertinoSwitch(
                          activeColor: Colors.green,
                          trackColor: Colors.grey,
                          thumbColor: Colors.white,
                          value: isShown!, onChanged: (val)async{
                        setState((){
                          isShown = !isShown!;
                        });
                        await userController.updateLinkIsShown(userController.userModel.value.id!, title, isShown!);
                        print(isShown);
                      });
                    }
                ),
                SizedBox(width: 12,)
              ],
            ),
          ),
        ),
      ),
    );

  }

}
