
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:qtap/core/controller/user_functions_controller.dart';

import 'friends_details_screen.dart';


class FavoritesPage extends StatelessWidget {
  // final List<int> favoriteItems;
  //
  // FavoritesScreen({required this.favoriteItems});
  UserFunctionsController userController = Get.put(UserFunctionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 29,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),        backgroundColor: Colors.grey[100],
        title: Text("Favorites",style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<UserFunctionsController>(
        builder: (controller) {
          // Filter favorite contacts based on the stored indices

          return ListView.builder(
            itemCount: controller.favContacts.value.length,
            itemBuilder: (context, index) {
              var contact = controller.favContacts.value[index];
              return ListTile(
                onTap: (){
                  Get.to(()=> ConnectionDetailsPage(userId: controller.favContacts.value[index].id));
                },
                leading: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(contact.img!),
                ),
                title: Text(contact.userName!),
                subtitle: Text(contact.title!),
              );
            },
          );
        },
      ),
    );
  }
}