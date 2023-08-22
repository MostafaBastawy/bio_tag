import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qtap/viwe/drawe/friends/add_new_options_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

import '../../../core/controller/user_functions_controller.dart';
import 'add_details_screen.dart';
import 'fav_friends_screen.dart';
import 'friends_details_screen.dart';

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({Key? key}) : super(key: key);

  @override
  State<ConnectionPage> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  bool isLoading = false; // Add a isLoading flag

  final GlobalKey<FormState> _formkeey = GlobalKey<FormState>();

  TextEditingController searchController = TextEditingController();


  UserFunctionsController userController = Get.put(UserFunctionsController());


  @override
  Widget build(BuildContext context) {
    userController.fetchContacts();


    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: GetBuilder<UserFunctionsController>(
            builder: (controller) {
              return Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.to(()=> AddNewOptions());
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black,width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Image.asset("assets/addNew.png",width: 28,height: 28,),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          userController.getFavContacts();
                          Get.to(()=>FavoritesPage());
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black,width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child:Image.asset("assets/favourite.png",width: 28,height: 28,),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                    ],

                  ),
                  // SizedBox(height: size.height * 0.07),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     ElevatedButton(
                  //       style: ButtonStyle(
                  //         backgroundColor:MaterialStateProperty.all(Colors.white) ,
                  //       ),
                  //       onPressed: ()async {
                  //         await userController.getFavContacts();
                  //
                  //         Get.to(()=>FavoritesScreen());
                  //       },
                  //       child: Icon(
                  //         Icons.favorite,
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //     ElevatedButton(
                  //       style: ButtonStyle(
                  //         backgroundColor:MaterialStateProperty.all(Colors.white) ,
                  //       ),
                  //       onPressed: () {
                  //         Share.share("https://qtapjo.com/#/${userController.userModel.value.id}");
                  //
                  //       },
                  //       child: Icon(
                  //         Icons.share,
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //   ],
                  // ),
// SizedBox(height: 10,),
//                   Row(
//                     children: [
//                       Icon(Icons.search),
//                       SizedBox(width: 5),
//                       Expanded(
//                         child: TextField(
//                           controller: searchController,
//                           decoration: InputDecoration(
//                             hintText: 'Search',
//                           ),
//                         ),
//                       ),
//                       ElevatedButton(
//                           style: ButtonStyle(
//                             backgroundColor:MaterialStateProperty.all(Colors.white) ,
//                           ),
//                           onPressed: (){}, child: Text("Search",style: TextStyle(color: Colors.black),))
//                     ],
//                   ),





                  SizedBox(height: size.height * 0.03),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: const Offset(0, 2),
                          blurRadius: 4.0,
                        ),
                      ],
                    ),
                    child: TabBar(
                      controller: _tabController,
                      indicatorColor: Colors.black,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: const [
                        Tab(text: 'Interconnections'),
                        Tab(text: 'Links'),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Column(
                          children: [
                            Expanded(
                              child: GetBuilder<UserFunctionsController>(
                                  builder: (controller) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10.0, left: 18),
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: userController.userModel.value
                                            .connections!.length > 0
                                            ? ListView.builder(
                                          itemCount: userController.userModel
                                              .value.connections!.length,
                                          itemBuilder: (context, index) {
                                            var user = userController.userModel
                                                .value.connections![index];

                                            return Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 0.9,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(10.0),
                                              ),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5.0,
                                                  vertical: 5.0),
                                              child: ListTile(
                                                leading: CircleAvatar(
                                                  backgroundColor: Colors.black,
                                                  radius: 20.0,
                                                  child: ClipOval(
                                                    child: Image.network(
                                                      "${user["image"]}",
                                                      fit: BoxFit.cover,
                                                      width: 50.0,
                                                      height: 50.0,
                                                    ),
                                                  ),
                                                ),
                                                title: Text(
                                                  "${user["name"]}",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  "${user["title"]}",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                trailing: IconButton(
                                                  icon: Icon(Icons.delete),
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          AlertDialog(
                                                            title:
                                                            Text('Delete User'),
                                                            content: Text(
                                                                'Are you sure you want to delete this user?'),
                                                            actions: [
                                                              ElevatedButton(
                                                                onPressed: () {
                                                                  userController
                                                                      .deleteConnection(
                                                                    userController
                                                                        .userModel
                                                                        .value
                                                                        .id!,
                                                                    user["name"],
                                                                        () {
                                                                      // Delete success callback
                                                                      Navigator.pop(
                                                                          context); // Close the dialog

                                                                      // Remove the deleted connection from the list in userController
                                                                      setState(() {
                                                                        userController
                                                                            .userModel
                                                                            .value
                                                                            .connections!
                                                                            .removeAt(
                                                                            index);
                                                                      });
                                                                    },
                                                                        (error) {
                                                                      // Delete error callback
                                                                      print(
                                                                          'Error deleting connection: $error');
                                                                    },
                                                                  );
                                                                },
                                                                child: Text('Yes'),
                                                                style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                                  primary:
                                                                  Colors.black,
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                      16.0,
                                                                      vertical:
                                                                      10.0),
                                                                  shape:
                                                                  RoundedRectangleBorder(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        8.0),
                                                                  ),
                                                                ),
                                                              ),
                                                              ElevatedButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context); // Close the dialog
                                                                },
                                                                child: Text('No'),
                                                                style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                                  primary:
                                                                  Colors.black,
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                      16.0,
                                                                      vertical:
                                                                      10.0),
                                                                  shape:
                                                                  RoundedRectangleBorder(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        8.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                    );
                                                  },
                                                ),
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        Dialog(
                                                          child: Column(
                                                            mainAxisSize:
                                                            MainAxisSize.min,
                                                            children: [
                                                              SizedBox(
                                                                  height: 10.0),
                                                              Center(
                                                                child: CircleAvatar(
                                                                  backgroundColor:
                                                                  Colors.black,
                                                                  radius: 50.0,
                                                                  child: ClipOval(
                                                                    child: Image
                                                                        .network(
                                                                      "${user["image"]}",
                                                                      // "https://via.placeholder.com/150",
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      width: 150.0,
                                                                      height: 150.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Center(
                                                                child: Text(
                                                                  "${user["name"]}",
                                                                  style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 16,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 7,
                                                              ),
                                                              Center(
                                                                child: Text(
                                                                  "${user["title"]}",
                                                                  style: TextStyle(
                                                                    color:
                                                                    Colors.grey,
                                                                    fontSize: 14,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                              ListTile(
                                                                leading: Icon(
                                                                    Icons.email),
                                                                title: Text(
                                                                  "${user["email"]},",
                                                                  style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 16,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                  ),
                                                                ),
                                                              ),
                                                              ListTile(
                                                                leading: Icon(
                                                                    Icons.phone),
                                                                title:
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    Platform.isIOS ||
                                                                        Platform
                                                                            .isAndroid
                                                                        ? launch(
                                                                        "tel://${user["phone"]}")
                                                                        : null;
                                                                  },
                                                                  child: Text(
                                                                    "${user["phone"]}",
                                                                    style:
                                                                    TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                      fontSize: 16,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              ElevatedButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context); // Close the dialog
                                                                },
                                                                child: Text(
                                                                  'Close',
                                                                  style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize: 16.0,
                                                                  ),
                                                                ),
                                                                style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                                  primary:
                                                                  Colors.black,
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                      16.0,
                                                                      vertical:
                                                                      10.0),
                                                                  shape:
                                                                  RoundedRectangleBorder(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        8.0),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(height: 5),
                                                            ],
                                                          ),
                                                        ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        )
                                            : Center(
                                            child: Text("No connections yet!")
                                        ),
                                      ),
                                    );
                                  }),
                            ),

                            SizedBox(
                              height: 10,
                            ),
                            // Your existing code for the first screen
                          ],
                        ),
                        Column(
                          children: [
                            Expanded(
                              child: GetBuilder<UserFunctionsController>(
                                builder: (controller) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10.0, left: 18),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: controller.contacts.value.length >
                                          0 ? GridView.builder(
                                        gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 28,
                                            crossAxisSpacing: 8,
                                            childAspectRatio:
                                            0.75
                                        ),
                                        itemCount: controller
                                            .contacts.value.length,
                                        itemBuilder: (context, index) =>
                                            InkWell(
                                              onTap: () async {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ConnectionDetailsPage(
                                                          userId: controller
                                                              .contacts
                                                              .value[index]
                                                              .id,
                                                        ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                height: 200,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 2,
                                                      blurRadius: 5,
                                                      offset: Offset(0, 3),
                                                    ),
                                                  ],
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(height: 10.0),
                                                    Center(
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                        Colors.black,
                                                        radius: 30.0,
                                                        child: ClipOval(
                                                          child: Image.network(
                                                            "${controller.contacts.value[index].img!}",
                                                            // "https://via.placeholder.com/150",
                                                            fit: BoxFit.cover,
                                                            width: 100.0,
                                                            height: 100.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 7),
                                                    Text(
                                                      controller
                                                          .contacts
                                                          .value[index]
                                                          .userName!,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(height: 7),
                                                    Text(
                                                      controller
                                                          .contacts
                                                          .value[index]
                                                          .title!,
                                                      style: TextStyle(
                                                        color: Colors.grey,

                                                        fontSize: 12,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(height: 7),
                                                    Text(
                                                      controller
                                                          .contacts
                                                          .value[index]
                                                          .phone!,
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                      ),
                                                    ),
                                                    Expanded(child: SizedBox()),
                                                    Align(
                                                      alignment:
                                                      Alignment.bottomRight,
                                                      child: Container(
                                                        height: 40,
                                                        width: 42,
                                                        decoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.only(
                                                            topLeft:
                                                            Radius.circular(
                                                                20),
                                                            bottomRight:
                                                            Radius.circular(
                                                                20),
                                                          ),
                                                          border: Border.all(
                                                              width: 2,
                                                              color:
                                                              Colors.black),
                                                          color: Colors.black,
                                                        ),
                                                        child: GestureDetector(
                                                          behavior: HitTestBehavior.translucent,
                                                          child: IconButton(
                                                            icon: Icon(
                                                              controller.contacts.value[index]?.isFav == true ? Icons.favorite : Icons.favorite_border,
                                                              color: controller.contacts.value[index]?.isFav == true ? Colors.red : Colors.white,
                                                            ),
                                                            onPressed: () async {

                                                              if (controller.contacts.value[index]?.isFav != null) {
                                                                // contact.isFav = contact.isFav; // Toggle the isFav property
                                                                await userController.updateContactIsFav(controller.contacts.value[index].id!,controller.contacts.value[index].isFav!); // Update the contact in Firebase
                                                              }
                                                            },
                                                          ),
                                                        ),

                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                      )
                                          : Center(
                                        child: Text("No contacts yet!"),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),

                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );

  }


}

