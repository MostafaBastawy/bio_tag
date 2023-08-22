import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:qtap/core/constant/onboarding_constat.dart';
import 'package:qtap/viwe/drawe/profile_screen.dart';
import 'package:qtap/viwe/drawe/setting_screen.dart';
import 'package:qtap/viwe/drawe/social_screen.dart';
import '../../core/controller/user_functions_controller.dart';
import 'friends/friends_screen.dart';
import 'home.dart';


class DrawerItem {

  final String title;
  final IconData iconData;
  final Function() onTap;

  DrawerItem(this.title, this.iconData, this.onTap);
}

List<DrawerItem> drawerItems = [
  DrawerItem('Home', Icons.home,(){}),
  DrawerItem('links', Icons.link,(){}),
  DrawerItem('Friends', Icons.connect_without_contact_sharp,(){}),
  DrawerItem('Settings', Icons.settings,(){}),
  DrawerItem('Profile', Icons.person,(){}),

];
class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  UserFunctionsController userController = Get.put(UserFunctionsController());

  final AdvancedDrawerController _advancedDrawerController =
  AdvancedDrawerController();

  int selectedDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    userController.getUserData();
    return AdvancedDrawer(
      controller: _advancedDrawerController,
      backdropColor: Colors.grey[100],
      drawer: buildMenu(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset("assets/logo.jpg",height: 60,width: 60,),
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.menu_sharp,color: kBlack,size: 27,),
            onPressed: () => _advancedDrawerController.showDrawer(),
          ),
        ),
        body: buildHomePage(),
      ),
    );
  }

  Widget buildMenu() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        GetBuilder<UserFunctionsController>(
        builder: (controller) {
      return
        CircleAvatar(
          radius: 60,
          backgroundImage:  CachedNetworkImageProvider(userController.userModel.value.img!),
        );
        }
        ),


            SizedBox(height: 36),

            Expanded(
              child: ListView.builder(
                itemCount: drawerItems.length,
                itemBuilder: (context, index) {
                  return buildMenuItem(index, drawerItems[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildMenuItem(int index, DrawerItem drawerItem) {
    final isSelected = index == selectedDrawerIndex;
    final textStyle = TextStyle(
      fontSize: 16,
      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      color: isSelected ? kBlack : kGrey,
    );

    return ListTile(
      leading: Icon(
        drawerItem.iconData,
        color: isSelected ? kBlack : kGrey,
      ),
      title: Text(
        drawerItem.title,
        style: textStyle,
      ),
      selected: isSelected,
      selectedTileColor: Colors.grey[300], // Background color when selected
      onTap: () {
        setState(() {
          selectedDrawerIndex = index;
          _advancedDrawerController.hideDrawer();
        });
      },
    );
  }


  Widget buildHomePage() {
    List<Widget> pages = [
      HomeScreen(),
      SocilaScreen(),
      ConnectionPage(),
      Settings(),
      PreviewProfilePage(),


    ];

    return Scaffold(
      body: pages[selectedDrawerIndex],
    );
  }
}
