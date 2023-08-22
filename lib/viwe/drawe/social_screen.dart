import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qtap/core/constant/onboarding_constat.dart';
import 'package:qtap/viwe/Authentication/widgets/custom_button.dart';


import '../../core/controller/user_functions_controller.dart';
import '../Authentication/widgets/custom_input_field.dart';

class SocilaScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  TextEditingController linkTitleController = TextEditingController();

  TextEditingController urlController = TextEditingController();

   UserFunctionsController userController = Get.put(UserFunctionsController());



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Center(child:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              // Container(
              //   width: size.width,
              //   child: Text("Add links",style: TextStyle(
              //     fontSize: 30,
              //     fontWeight: FontWeight.bold,
              //   ),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              // // SizedBox(height: size.height * 0.1,),
              Text("Socila media",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 30,),

              Container(
                width: size.width,
                height: size.height * 0.34,
                child:
                ListView(
                  scrollDirection: Axis.horizontal,
                   shrinkWrap: true,
                  children: [
Wrap(
  children: [
    Column(
      children: [
        buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FfacebookIcon.png?alt=media&token=99e9cfe0-5f7b-4fdf-b0b2-7c6488e61bf8", "Facebook",context,"listView"),
        buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FInstagramIcon.png?alt=media&token=0a56d80b-cb42-46a7-9318-ede8b8e9a8b7", "Instagram",context,"listView"),
        buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FwhatsappIcon.png?alt=media&token=6e1b473c-bd49-46be-8987-7e53b8a1587d", "Whatsapp",context,"listView"),
      ],
    ),
  ],
),

                    SizedBox(width: 20,),
                    Wrap(
                      children: [
                        Column(
                          children: [
                            buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FtiktokLogo.png?alt=media&token=a87e8591-b4ea-4c51-a645-2c5951de08d6", "Tik Tok",context,"listView"),
                            buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FtwitterIcon.png?alt=media&token=586d0618-4706-4cba-a4a6-396fb632c31b", "Twitter",context,"listView"),
                            buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FyoutubeIcon.png?alt=media&token=24c1570b-ceb9-494c-89ec-1262f4b7ba3d", "YouTube",context,"listView"),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(width: 20,),
                    Wrap(
                      children: [
                        Column(
                          children: [
                            buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FwechatIcon.png?alt=media&token=a5ea903d-6bf1-47fe-9b7e-fd9260633947", "We Chat",context,"listView"),
                            buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FtelegramIcon.png?alt=media&token=d82802f5-2bdc-404e-8164-2e5b91e25a33", "Telegram",context,"listView"),
                            buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FsnapchatIcon.png?alt=media&token=2f59bfcc-70b1-420d-8fdc-babe42e790f6", "Snapchat",context,"listView"),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(width: 20,),
                    Wrap(
                      children: [
                        Column(
                          children: [
                            buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FmessengerIcon.png?alt=media&token=722c335f-e8a5-458a-91b5-4cae23621d58", "FB Messenger",context,"listView"),
                            buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FvimeoIcon.png?alt=media&token=27541697-526d-4994-911b-fc161db0507c", "Vimeo",context,"listView"),
                          ],
                        ),
                      ],
                    ),

                  ],),
              ),

              Divider(thickness: 2, color: kBlack),

              SizedBox(height: size.height *0.04,),
              Text("Bussiness",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 30,),

              Container(
                width: size.width,
                height: size.height * 0.53,
                child:
                ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      Wrap(
                        children: [
                          Column(
                            children: [
                              buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FlinkedinIcon.png?alt=media&token=f39ad53c-d871-41c0-899b-9c29a53dd4e9", "LinkedIn",context,"listView"),
                              buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FteamsIcon.png?alt=media&token=1c6f0334-3629-4a88-8d74-ee51e70f93c8", "Teams",context,"listView"),
                              buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FlinkIcon.png?alt=media&token=7ad99a9a-234b-4fd6-ba22-c0a44b110a64", "Custom link",context,"listView"),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(width: 20,),
                      Wrap(
                        children: [
                          Column(
                            children: [
                              buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FpaypalIcon.png?alt=media&token=48ff6eaf-143a-44be-a3d9-407ba85e0fb8", "Pay Pal",context,"listView"),
                              buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FmediumIcon.png?alt=media&token=a37a47f0-2c6e-4828-a6fd-c59cae73f21b", "Medium",context,"listView"),
                              buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FlinktreeIcon.png?alt=media&token=5fdcf5e5-ca18-4e5e-bf84-05d94f2c6db6", "Linktree",context,"listView"),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(width: 20,),
                      Wrap(
                        children: [
                          Column(
                            children: [
                              buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FmapsIcon.png?alt=media&token=92d190e2-f5be-48a0-be24-314c5ffa07c7", "Your location",context,"listView"),
                              buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FcalendlyIcon.png?alt=media&token=1fe94cc7-dfec-4a58-95bb-9ef7b55b6af6", "Calendly",context,"listView"),
                              buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FcalendlyIcon.png?alt=media&token=1fe94cc7-dfec-4a58-95bb-9ef7b55b6af6", "Slack",context,"listView"),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(width: 20,),
                      Wrap(
                        children: [
                          Column(
                            children: [
                              buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FwhatsappBussinessIcon.png?alt=media&token=6f65de14-aec6-4432-8fb7-ba524f00338f", "WA Business",context,"listView"),
                              buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FnotionIcon.png?alt=media&token=e8611192-03f1-42c2-b715-568901a9e2f7", "Notion",context,"listView"),
                              buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FgoogleMeetIcon.png?alt=media&token=0cd52a61-55ab-48e0-b834-06daad52668d", "Google Meet",context,"listView"),

                            ],
                          ),
                        ],
                      ),

                      SizedBox(width: 20,),
                      Wrap(
                        children: [
                          Column(
                            children: [
                              buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FgooglePlayIcon.png?alt=media&token=b27eccdd-1e80-407b-988a-0d9ba07408fd", "Google play",context,"listView"),
                              buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FappStoreIcon.png?alt=media&token=da17a28b-f605-46b2-a127-876a5da8557e", "App Store",context,"listView"),
                              buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FcareemLogo.png?alt=media&token=776b66be-9b04-4c68-9dec-155ee0fd63c8", "Careem",context,"listView"),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(width: 20,),
                      Wrap(
                        children: [
                          Column(
                            children: [
                              buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FtalabatLogo.png?alt=media&token=02ef82db-1f65-4063-b89f-018a9dff7e79", "Talabat",context,"listView"),
                              buildListTile("https://firebasestorage.googleapis.com/v0/b/jamilnfc-bc4bb.appspot.com/o/social%2Fmenu.png?alt=media&token=d18f52bc-1877-448e-8f4f-d97d368b00ff", "Menu",context,"listView"),
                              buildListTile("https://firebasestorage.googleapis.com/v0/b/jamilnfc-bc4bb.appspot.com/o/social%2Frate.png?alt=media&token=70d96dae-d941-4295-83d5-69a53cbf1f72", "Rate us",context,"listView"),

                            ],
                          ),
                        ],
                      ),

                      SizedBox(width: 20,),

                      Column(
                        children: [
                          buildListTile("https://firebasestorage.googleapis.com/v0/b/jamilnfc-bc4bb.appspot.com/o/social%2Fprofile.png?alt=media&token=a67e0574-1d62-4ccf-a5b5-2395c08f454d", "Customer data",context,"listView"),
                        ],
                      ),
                    ]),
              ),
              Divider(thickness: 2, color: kBlack),

              SizedBox(height: size.height *0.04,),
              Text("Inspiration",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 30,),

              Container(
                width: size.width,
                height: 140,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FbehanceIcon.png?alt=media&token=5bdf7e08-001e-401b-be94-9a2fbe4037d6", "Behance",context,"column"),
                    buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FdribbbleIcon.png?alt=media&token=89ae33f2-6fd2-4ac3-9a01-3d2e7b2b5fe0", "Dribbble",context,"column"),
                    buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FpinterestIcon.png?alt=media&token=52b618c8-ec2a-4b39-9fdf-01ece3e0c26f", "Pinterest",context,"column"),
                  ],
                ),
              ),
              Divider(thickness: 2, color:kBlack),

              SizedBox(height: size.height *0.04,),
              Text("Music",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 30,),

              Container(
                width: size.width,
                height: 140,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FanghamiIcon.png?alt=media&token=30f7a101-f2cf-44e0-a094-66e4feedf83c", "Anghami",context,"column"),
                    buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FspotifyIcon.png?alt=media&token=13351997-3b7d-4333-b4ce-8d4923072723", "Spotify",context,"column"),
                    buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2FyoutubeMusicIcon.png?alt=media&token=048dfdce-ac2b-4875-b5d5-00efa4baaa43", "Youtube Music",context,"column"),
                    buildListTile("https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/social%2Fsouncloud.png?alt=media&token=63d1ba7c-2106-446a-9d16-1d344e026ee1", "Soundcloud",context,"column"),
                  ],
                ),
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      )),

    );
  }
  buildListTile(icon,title,context,width){
    return
      Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: SizedBox(
        width:  200,
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width:  60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kBlack,width: 2),
                image: DecorationImage(image: CachedNetworkImageProvider(icon,)),
              ),
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(width: 5,),
                InkWell(
                  onTap: (){
                    _modalBottomSheetMenu(context,icon,title);
                  },
                  child: Container(
                      width: 70,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_circle_outline,color:kBlack,),
                          SizedBox(width: 5,),
                          Text("Add"),
                        ],
                      )),
                ),
              ],
            ),
            SizedBox(height: 5,),
          ],
        ),
      ),
    );

  }

  void _modalBottomSheetMenu(context,icon,linkTitle){
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    linkTitleController.text = linkTitle;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (builder){
          return SingleChildScrollView(
            child: new Container(
              height: 700.0,
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
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: CachedNetworkImageProvider(icon)),
                              ),
                            ),
                            SizedBox(height: 40,),

                            CustomInputField(
                              initialVal: linkTitleController.text,
                              controller: linkTitleController,
                              textInputType: TextInputType.name,
                              validate: (val){if (val!.isEmpty) {
                                return 'Please enter some text';
                              }},
                              onsave: (val){
                                linkTitleController.text = val!;
                              },
                              onChanged: (val){
                                linkTitleController.text = val!;
                              },
                              isPassword: false,
                              isObsecure: false,
                              hint: "Link title",
                            ),
                            SizedBox(height: 40,),

                            CustomInputField(
                              controller: urlController,
                              initialVal: urlController.text,
                              textInputType: TextInputType.text,
                              isPassword: false,
                              isObsecure: false,
                              validate: (val){if (val!.isEmpty) {
                                return 'Please enter some text';
                              }},
                              onsave: (val){urlController.text = val!;},
                              onChanged: (val){urlController.text = val!;},
                              hint: "URL",
                            ),
                            SizedBox(height: 40,),
                            CustomButton(color: kBlack, textColor: kWhite, text: "Add", onPressed: (){
                              _formkey.currentState?.save();
                              if (_formkey.currentState!.validate()) {
                                Navigator.pop(context);
                                userController.addLink(userId: userController.userModel.value.id!,linkTitle:  linkTitleController.text,url:  urlController.text,icon: icon,isShown: true);
                                urlController.clear();
                              }
                            }),
                            // DefaultButton(txt: "Add link", function: (){
                            //   _formkey.currentState?.save();
                            //   if (_formkey.currentState!.validate()) {
                            //     Navigator.pop(context);
                            //     userController.addLink(userId: userController.userModel.value.id!,linkTitle:  linkTitleController.text,url:  urlController.text,icon: icon,isShown: true);
                            //     urlController.clear();
                            //   }
                            // }, bg_color: Color(0xff873CFF), txt_color: Colors.white),
                            SizedBox(height: 10,),
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

}
