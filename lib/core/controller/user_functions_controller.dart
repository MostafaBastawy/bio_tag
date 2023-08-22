import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';
import 'package:qtap/viwe/Authentication/login.dart';
import 'package:qtap/viwe/drawe/landing.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../viwe/drawe/friends/friends_screen.dart';
import '../../viwe_model/conections_model.dart';
import '../../viwe_model/user_model.dart';

class UserFunctionsController extends GetxController {
  final _auth = FirebaseAuth.instance;

  Rx<UserModel> userModel = UserModel().obs;
  Rx<UserModel> userToShow = UserModel().obs;

  FirebaseFirestore db = FirebaseFirestore.instance;

  RxList<ContactModel> contacts = <ContactModel>[].obs;

  RxList<ContactModel> favContacts = <ContactModel>[].obs;


  final imageFile = Rxn<File>();

  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await _auth
          .sendPasswordResetEmail(email: email)
          .then((value) => Get.offAll(Login(screenHeight: double.infinity,)));
      print('Password reset email sent to $email');
    } catch (e) {
      print('Error sending password reset email: $e');
    }
  }

  void deleteConnection(
      String userId,
      String connectionName,
      void Function() onDeleteSuccess,
      void Function(dynamic error) onDeleteError,
      ) async {
    try {
      final userDoc = FirebaseFirestore.instance.collection('users').doc(userId);
      final userSnapshot = await userDoc.get();
      List<dynamic> connections = userSnapshot.data()!['connections'];

      int connectionIndex = connections.indexWhere(
            (connection) => connection['name'] == connectionName,
      );

      if (connectionIndex != -1) {
        connections.removeAt(connectionIndex);
        await userDoc.update({'connections': connections});
        onDeleteSuccess(); // Invoke the success callback
      } else {
        print('Connection not found.');
      }
    } catch (error) {
      print('Error deleting connection: $error');
      onDeleteError(error); // Invoke the error callback
    }
  }

  Future<void> updateContactIsFav(String userId, bool currentIsFavValue) async {
    final usersCollection = FirebaseFirestore.instance.collection('users');
    try {
      final userDoc = await usersCollection.doc(userModel.value.id).get();

      if (userDoc.exists) {
        var userData = userDoc.data() as Map;
        final contactList = userData['contacts'] as List<dynamic>;

        final updatedContacts = contactList.map((contact) {
          if (contact['id'] == userId) {
            print("User with id: ${contact['id']} , isFav Before: ${currentIsFavValue}");
            bool isFav = !currentIsFavValue; // Negate the current value
            print("User with id: ${contact['id']} , isFav: ${isFav}");
            contacts.forEach((element) {
              if(element.id == contact['id']){
                element.isFav = isFav;
                update();
                notifyChildrens();
              }
            });
            return {'id': userId, 'isFav': isFav};
          } else {
            return contact;
          }
        }).toList();

        print("Contacts after edit: $updatedContacts");

        await usersCollection.doc(userModel.value.id).update({'contacts': updatedContacts});

        // await fetchContacts();
      }
    } catch (e) {
      print('Error updating contact isFav value: $e');
    }
  }

  Future<void> updateUrlInLinksField( String titleToUpdate, String newUrl) async {
    CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
    DocumentSnapshot document = await usersCollection.doc(userModel.value.id).get();
    Map userData = document.data() as Map;
    List<Map<String, dynamic>> links = List.from(userData['links']);
    int indexToUpdate = -1;
    for (int i = 0; i < links.length; i++) {
      if (links[i]['title'] == titleToUpdate) {
        indexToUpdate = i;
        break;
      }
    }
    if (indexToUpdate != -1) {
      links[indexToUpdate]['url'] = newUrl;
      await usersCollection.doc(userModel.value.id).update({'links': links});
      userModel.value.links = links;
      update();
      notifyChildrens();
    }
  }

  Future<void> deleteLinkFromLinksField(String urlToDelete) async {
    CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

    DocumentSnapshot document = await usersCollection.doc(userModel.value.id).get();

    Map userData = document.data() as Map;


    List<Map<String, dynamic>> links = List.from(userData['links']);

    links.removeWhere((link) => link['url'] == urlToDelete);

    await usersCollection.doc(userModel.value.id).update({'links': links});
    userModel.value.links = links;
    update();
    notifyChildrens();
  }

  Future<void> fetchContacts()async{
    contacts = <ContactModel>[].obs;
    getUserData();
    userModel.value.contacts!.forEach((element) async{
      print("User from contacts: ${element['id']} , ${element['isFav']}");
      contacts.value.add(
        await fetchContactData(element['id'],element['isFav']),
      );
    });
    contacts.forEach((element) {print("User from contacts: ${element.userName} , ${element.isFav}");});
    update();
    notifyChildrens();
  }


  Future<void> fetchUserData(String userId) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
      await db.collection('users').doc(userId).get();
      if (snapshot.exists) {
        print("User data: ${snapshot.data()}");
        final UserModel userData = UserModel.fromJson(snapshot.data());
        userToShow.value = userData;
        print("Username: ${userToShow.value.userName}");
        update();
        notifyChildrens();
      }
    } catch (error) {
      // Handle any potential errors
      print('Error fetching user data: $error');
    }
  }

  Future<ContactModel> fetchContactData(String userId,isFav) async {
    ContactModel userData = ContactModel();
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
      await db.collection('users').doc(userId).get();
      if (snapshot.exists) {
        print("User data: ${snapshot.data()}");

        var data = snapshot.data() as Map;

        userData = ContactModel(email: data['email'],title: data['title'],bio: data['bio'],cover: data['cover'],id: data['id'],img: data['photo'],isFav: isFav,links: data['links'],phone: data['phone'],userName: data['userName']);
        update();
        notifyChildrens();

      }
    } catch (error) {
      // Handle any potential errors
      print('Error fetching user data: $error');
    }
    print("From fetch single contact ${userData.id}");
    return userData;
  }

  getUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    if (userModel.value.email == null) {
      final QuerySnapshot userQuerySnapshot = await db
          .collection('users')
          .where('email', isEqualTo: pref.getString("email"))
          .get();

      // Get the user data from the user document snapshot
      final userData = userQuerySnapshot.docs[0].data() as Map<String, dynamic>;

      // Access user data by field name
      print(userData['email']);
      pref.setBool("loggedIn", true);
      pref.setString("userName", userData['userName']);
      pref.setString("bio", userData['bio']);
      pref.setString("id", userData['id']);
      pref.setString("phone", userData['phone']);
      pref.setString("email", userData['email']);
      pref.setString("title", userData['title']);

      userModel.value = UserModel(
        userName: userData['userName'],
        id: userData['id'],
        bio: userData['bio'],
        connections: userData['connections'],
        email: userData['email'],
        img: userData['photo'],
        links: userData['links'],
        phone: userData['phone'],
        cover: userData['cover'],
        contacts: userData['contacts'],
        title: userData['title'],
      );


      print(userModel.value.links);
      update();
      notifyChildrens();
    }
  }

  Future<void> addUserToContacts(String userId,context) async {
    final usersCollection = FirebaseFirestore.instance.collection('users');
    final specificUserDoc = usersCollection.doc(userModel.value.id);
    // Replace 'specificUserId' with the actual user ID

    usersCollection.doc(userId).get().then((value) async{
      if(value.exists){
        try {
          await specificUserDoc.update({
            'contacts': FieldValue.arrayUnion([
              {'id': userId, 'isFav': false}
            ])
          });

          final QuerySnapshot userQuerySnapshot = await db
              .collection('users')
              .where('email', isEqualTo: userModel.value.email)
              .get();

          final userData = userQuerySnapshot.docs[0].data() as Map<String, dynamic>;

          userModel.value.contacts = userData['contacts'];

          await fetchContacts();

          Get.to(()=> LandingPage());
          update();
          notifyChildrens();
          print('User added to contacts successfully!');
        } catch (error) {
          print('Error adding user to contacts: $error');
        }
      }
      else{
        showDialog(context: context, builder: (context) => AlertDialog(
          title:
          Text('User not found'),
          content: Text(
              'Double check user id then try again'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Ok'),
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
        ),);
      }
    });




  }

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
      update();
      // Save the image to a specific location
      // final directory = Directory('D:/Graduation project/EgyEye AI/EgyEye/images');
      // if (!await directory.exists()) {
      //   await directory.create(recursive: true);
      // }
      // final newImagePath = '${directory.path}/${_imageFile.value!.path.split('/').last}';
      // await _imageFile.value!.copy(newImagePath);
      update();
    } else {
      print('No image selected.');
    }
  }

  Future<void> updateLinkIsShown(
      String userId, String linkTitle, bool isShown) async {
    // Get the user document reference
    DocumentReference userRef =
    FirebaseFirestore.instance.collection('users').doc(userId);

    // Get the links list from the user document
    DocumentSnapshot userSnapshot = await userRef.get();
    List<dynamic> links = userSnapshot.get('links');

    // Find the link with the given title in the links list
    Map<String, dynamic>? linkToUpdate;
    for (int i = 0; i < links.length; i++) {
      Map<String, dynamic> link = links[i];
      if (link['title'] == linkTitle) {
        linkToUpdate = link;
        break;
      }
    }

    // Update the isShown value in the link map
    if (linkToUpdate != null) {
      linkToUpdate['isShown'] = isShown;
      // Update the links list in the user document
      await userRef.update({'links': links});
    }
  }

  Future<void> signUp(String email, String password, String userName, String title, String phone, String bio, context) async {
    Dialog? _myDialog;
    showDialog(
      context: context,
      builder: (context) => _myDialog = Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(child: CircularProgressIndicator()),
        backgroundColor: Colors.transparent,
      ),
    );

    try {
      // Check if the email already exists
      bool emailExists = await checkEmailExists(email);
      if (emailExists) {
        Get.snackbar(
          'Email Exists',
          'An account already exists with this email. Please sign in or reset your password.',
          snackPosition: SnackPosition.TOP,
        );
        Navigator.pop(context, _myDialog);
        return;
      }

      // Check if the username already exists
      bool userNameExists = await checkUserNameExists(userName);
      if (userNameExists) {
        Get.snackbar(
          'Username Exists',
          'The username already exists. Please choose a different username.',
          snackPosition: SnackPosition.TOP,
        );
        Navigator.pop(context, _myDialog);
        return;
      }

      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User created with UID: ${userCredential.user!.uid} + ${userName}');

      Map<String, dynamic> user = {
        'email': email,
        'userName': userName,
        'id': userName,
        'photo': 'https://villagesonmacarthur.com/wp-content/uploads/2020/12/Blank-Avatar.png',
        'links': [],
        'cover': 'https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/images%2F1685653668095.png?alt=media&token=59035f2a-8039-4c78-877b-0d313c0b80e9',
        'title': title,
        'connections': [],
        'contacts': [],
        'phone': phone,
        'bio': bio,
      };

      userModel.value = UserModel(
        userName: userName,
        bio: bio,
        connections: [],
        email: email,
        img: 'https://villagesonmacarthur.com/wp-content/uploads/2020/12/Blank-Avatar.png',
        links: [],
        phone: phone,
        cover: 'https://firebasestorage.googleapis.com/v0/b/nfcqr-a1d80.appspot.com/o/images%2F1685653668095.png?alt=media&token=59035f2a-8039-4c78-877b-0d313c0b80e9',
        contacts: [],
        id: userName,
        title: title,
      );

      SharedPreferences pref = await SharedPreferences.getInstance();

      db
          .collection('users')
          .doc(userName)
          .set(user, SetOptions(merge: true))
          .then((value) {
        pref.setBool('loggedIn', true);
        pref.setString('userName', userName);
        pref.setString('id',userName);
        pref.setString('bio', bio);
        pref.setString('phone', phone);
        pref.setString('email', email);
        pref.setString('title', title);
        Navigator.pop(context, _myDialog);
        Get.to(() => LandingPage());
        print('User added successfully!');
      }).catchError((error) => print('Error adding user: $error'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.snackbar(
          'Email Exists',
          'An account already exists with this email. Please sign in or reset your password.',
          snackPosition: SnackPosition.TOP,
        );
      }
      Navigator.pop(context, _myDialog);
    } catch (e) {
      print(e);
      Navigator.pop(context, _myDialog);
    }
  }
  Future<bool> checkEmailExists(String email) async {
    UserCredential? userCredential;
    try {
      userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: 'temp_password', // A temporary password is required for the check
      );
    } on FirebaseAuthException catch (e) {
      // Handle specific exceptions if needed
    }
    return userCredential != null;
  }

  Future<bool> checkUserNameExists(String userName) async {
    final result = await FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: userName)
        .get();

    return result.docs.isNotEmpty;
  }

  Future<void> updateContactInFirebase(ContactModel contact) async {
    try {
      final contactRef = FirebaseFirestore.instance.collection('users').doc(userModel.value.id);
      await contactRef.update({
        'isFav': contact.isFav,
      });
      print('Contact updated in Firebase: ${contact.userName}');

      // Update the contacts list in the favorite screen
      getFavContacts();
    } catch (e) {
      print('Error updating contact in Firebase: $e');
      // Handle the error gracefully

    }
    update();
    notifyChildrens();
  }

  getFavContacts(){
    favContacts.value = contacts.value.where((element) => element.isFav == true).toList();
    favContacts.value.forEach((element) {
      print("IS FAV: ${element.userName}");
    });
    update();
    notifyChildrens();
  }

  uploadUserImage(ImageSource source) async {
    await pickImage(source);
    try {
      final fileName = 'images/${DateTime.now().millisecondsSinceEpoch}.png';
      final storageRef = FirebaseStorage.instance.ref().child(fileName);
      await storageRef.putFile(imageFile.value!);
      final imageUrl = await storageRef.getDownloadURL();
      FirebaseFirestore.instance
          .collection('users')
          .doc(userModel.value.id)
          .update({"photo": imageUrl});
      userModel.value.img = imageUrl;
      update();
      notifyChildrens();
      print('File uploaded successfully');
    } on FirebaseException catch (e) {
      print('File upload failed: $e');
    }
  }

  uploadUserCover(ImageSource source) async {
    await pickImage(source);
    try {
      final fileName = 'images/${DateTime.now().millisecondsSinceEpoch}.png';
      final storageRef = FirebaseStorage.instance.ref().child(fileName);
      await storageRef.putFile(imageFile.value!);
      final imageUrl = await storageRef.getDownloadURL();
      FirebaseFirestore.instance
          .collection('users')
          .doc(userModel.value.id)
          .update({"cover": imageUrl});
      userModel.value.cover = imageUrl;
      update();
      notifyChildrens();
      print('File uploaded successfully');
    } on FirebaseException catch (e) {
      print('File upload failed: $e');
    }
  }

  Future<void> login(
      String email, String password, BuildContext context) async {
    Dialog? _myDialog;
    showDialog(
        context: context,
        builder: (context) => _myDialog = Dialog(
          child: Center(child: CircularProgressIndicator()),
          backgroundColor: Colors.transparent,
        ));
    try {
      // Sign in the user with email and password
      final UserCredential userCredential =
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the current user ID from Firebase Authentication
      final String userId = userCredential.user!.uid;

      // Query Firestore for the user document with the matching email field
      final QuerySnapshot userQuerySnapshot =
      await db.collection('users').where('email', isEqualTo: email).get();

      // Get the user data from the user document snapshot
      final userData = userQuerySnapshot.docs[0].data() as Map<String, dynamic>;

      // Access user data by field name
      SharedPreferences pref = await SharedPreferences.getInstance();
      print(userData['email']);
      pref.setBool("loggedIn", true);
      pref.setString("id", userCredential.user!.uid);
      pref.setString("userName", userData['userName']);
      pref.setString("bio", userData['bio']);
      pref.setString("phone", userData['phone']);
      pref.setString("email", userData['email']);
      pref.setString("title", userData['title']);

      userModel.value = UserModel(
        userName: userData['userName'],
        bio: userData['bio'],
        connections: userData['connections'],
        email: userData['email'],
        img: userData['photo'],
        links: userData['links'],
        contacts: userData['contacts'],
        cover: userData['cover'],
        id: userData['id'],
        phone: userData['phone'],
        title: userData['title'],
      );

      Navigator.pop(context, _myDialog);
      Get.to(() => LandingPage());
      // etc.

      // Navigate to the home screen or other appropriate UI
      // Get.offAll(LandingScreen());
    } catch (e) {
      // Handle login errors
      print('Login failed: $e');
      Navigator.pop(context, _myDialog);
      Get.snackbar('Login Error', 'Login failed: $e');
    }
  }

  Future<void> addConnectionContact(
      String userId,
      String name,
      String phone,
      String title,
      String email,
      ) async {
    // Get a reference to the user document
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference userDocRef = firestore.collection('users').doc(userId);

    // Construct the contact map
    Map<String, dynamic> contact = {
      'name': name,
      'phone': phone,
      'title': title,
      'image': 'https://via.placeholder.com/150',
      'isFav': false,
      'email':email,
    };

    // Add the contact to the user's connections list
    await userDocRef.update({
      'connections': FieldValue.arrayUnion([contact])
    });

    final QuerySnapshot userQuerySnapshot =
    await db.collection('users').where('id', isEqualTo: userId).get();

    final userData = userQuerySnapshot.docs[0].data() as Map<String, dynamic>;


    userModel.value.connections = userData['connections'] as List<dynamic>;

    Get.to(()=> ConnectionPage());

    update();
    notifyChildrens();

  }

  Future<void> addLink(
      {required String userId,
        required String linkTitle,
        required String url,
        required icon,
        required bool? isShown}) async {
    try {
      final DocumentReference userDocRef = db.collection('users').doc(userModel.value.id);

      List<dynamic> newItem = [
        {
          'title': linkTitle,
          'icon': icon,
          'isShown': isShown,
          'url': url,
        }
      ];

      await userDocRef.update({
        'links': FieldValue.arrayUnion(newItem),
      });

      final QuerySnapshot userQuerySnapshot =
      await db.collection('users').where('id', isEqualTo: userId).get();

      final userData = userQuerySnapshot.docs[0].data() as Map<String, dynamic>;

      userModel.value.links = userData['links'] as List<dynamic>;

      print("User Links: ");

      //-------------------

      update();
      notifyChildrens();

      print('User data updated successfully!');
    } catch (e) {
      print('Error updating user data: $e');
    }
  }

  Future<void> updateUser(
      {
        String? userId,
        String? newUserName,
        String? newTitle,
        String? newPhone,
        String? newBio
      }) async {
    try {
      final DocumentReference userDocRef = db.collection('users').doc(userId);

      await userDocRef.update({
        'userName': newUserName,
        'title': newTitle,
        'phone': newPhone,
        'bio': newBio,
      }).then((value) => print('User data updated successfully!'));

      userModel.value.userName = newUserName;
      userModel.value.title = newTitle;
      userModel.value.bio = newBio;
      userModel.value.phone = newPhone;
      getUserData();
      update();
      notifyChildrens();


    } catch (e) {
      print('Error updating user data: $e');
    }
  }

  void logout
      () async {
    await _auth.signOut();
    SharedPreferences pref = await SharedPreferences.getInstance();
    userModel.value = UserModel();
    pref.clear();
    Get.offAll(() => Login(screenHeight: double.infinity));
  }

  void ndefWrite(userUrl,context) {
    ValueNotifier<dynamic> result = ValueNotifier(null);

    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null || !ndef.isWritable) {
        result.value = 'Tag is not ndef writable';
        NfcManager.instance.stopSession(errorMessage: result.value);
        return;
      }

      NdefMessage message = NdefMessage([
        NdefRecord.createUri(Uri.parse(userUrl)),
      ]);

      try {
        await ndef.write(message);
        result.value = 'Success to "Ndef Write"';
        Navigator.of(context).pop();
        NfcManager.instance.stopSession();
      } catch (e) {
        result.value = e;
        NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }
    });
  }
  void tagRead(context) {

    showDialog(context: context, builder: (context) => AlertDialog(
      title:
      Text('SCANING!'),
      content: Text(
          'Move card behind the phone to add contact'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
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
    ),);

    ValueNotifier<dynamic> result = ValueNotifier(null);
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      result.value = tag.data;
      print("Tag detected");
      var ndef = Ndef.from(tag);
      var record = ndef!.cachedMessage!.records.first;
      var decodedPayload = String.fromCharCodes(record.payload);
      List splittedLink = decodedPayload.split("/");
      addUserToContacts(splittedLink.last,context);

      print("My URL: $decodedPayload");
      if(record.typeNameFormat == NdefTypeNameFormat.absoluteUri){
        print(record);
      }

      log("handel:${tag.data}");

      NfcManager.instance.stopSession();
    });
  }
  void deleteUser(context) async {

    Dialog? _myDialog;
    showDialog(
        context: context,
        builder: (context) => _myDialog = Dialog(
          child: Center(child: CircularProgressIndicator()),
          backgroundColor: Colors.transparent,
        ));

    try {
      // Get the current user

      // await _auth.signInWithEmailAndPassword(email: email, password: password);

      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null || currentUser.uid == null || currentUser.uid.isEmpty) {
        print("Nullaya");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User not logged in please login again")));
        return;
      }

      // Delete the user from Firebase Authentication
      await currentUser.delete();

      // Delete the corresponding document from Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentReference userRef = firestore.collection('users').doc(userModel.value.id);
      await userRef.delete();
      SharedPreferences pref = await SharedPreferences.getInstance();
      userModel.value = UserModel();
      pref.clear();
      Navigator.pop(context,_myDialog);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("The user has been deleted successfully")));
      Get.offAll(() => Login(screenHeight: double.infinity));

      // Success! The user has been deleted from both Firebase Authentication and Firestore.
      print('User deleted successfully.');
    } catch (e) {
      // Handle any errors that occur during the deletion process
      Navigator.pop(context,_myDialog);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please log in again and try deleting the account once more.".tr),behavior: SnackBarBehavior.floating,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),));
      print('Error deleting user: $e');
    }
  }
}
