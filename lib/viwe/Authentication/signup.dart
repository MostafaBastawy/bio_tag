// import 'package:flutter/material.dart';
// import 'package:qtap/viwe/Authentication/widgets/custom_clippers/blue_top_clipper.dart';
// import 'package:qtap/viwe/Authentication/widgets/custom_clippers/grey_top_clipper.dart';
// import 'package:qtap/viwe/Authentication/widgets/custom_clippers/white_top_clipper.dart';
// import 'package:qtap/viwe/Authentication/widgets/custom_input_field.dart';
// import '../../core/constant/onboarding_constat.dart';
// import 'widgets/header.dart';
// import 'widgets/login_form.dart';
//
// class SignUp extends StatefulWidget {
//   final double screenHeight;
//
//   const SignUp({
//     required this.screenHeight,
//   });
//
//   @override
//   _SignUpState createState() => _SignUpState();
// }
//
// class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
//   late final AnimationController _animationController;
//   late final Animation<double> _headerTextAnimation;
//   late final Animation<double> _formElementAnimation;
//   late final Animation<double> _whiteTopClipperAnimation;
//   late final Animation<double> _blueTopClipperAnimation;
//   late final Animation<double> _greyTopClipperAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: kLoginAnimationDuration,
//     );
//
//     final fadeSlideTween = Tween<double>(begin: 0.0, end: 1.0);
//     _headerTextAnimation = fadeSlideTween.animate(CurvedAnimation(
//       parent: _animationController,
//       curve: const Interval(
//         0.0,
//         0.6,
//         curve: Curves.easeInOut,
//       ),
//     ));
//     _formElementAnimation = fadeSlideTween.animate(CurvedAnimation(
//       parent: _animationController,
//       curve: const Interval(
//         0.7,
//         1.0,
//         curve: Curves.easeInOut,
//       ),
//     ));
//
//     final clipperOffsetTween = Tween<double>(
//       begin: widget.screenHeight,
//       end: 0.0,
//     );
//     _blueTopClipperAnimation = clipperOffsetTween.animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: const Interval(
//           0.2,
//           0.7,
//           curve: Curves.easeInOut,
//         ),
//       ),
//     );
//     _greyTopClipperAnimation = clipperOffsetTween.animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: const Interval(
//           0.35,
//           0.7,
//           curve: Curves.easeInOut,
//         ),
//       ),
//     );
//     _whiteTopClipperAnimation = clipperOffsetTween.animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: const Interval(
//           0.5,
//           0.7,
//           curve: Curves.easeInOut,
//         ),
//       ),
//     );
//
//     _animationController.forward();
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: kWhite,
//       body: Stack(
//         children: <Widget>[
//           // AnimatedBuilder(
//           //   animation: _whiteTopClipperAnimation,
//           //   builder: (_, Widget? child) {
//           //     return ClipPath(
//           //       clipper: WhiteTopClipper(
//           //         yOffset: _whiteTopClipperAnimation.value,
//           //       ),
//           //       child: child,
//           //     );
//           //   },
//           //   child: Container(color: kBlack),
//           // ),
//           // AnimatedBuilder(
//           //   animation: _greyTopClipperAnimation,
//           //   builder: (_, Widget? child) {
//           //     return ClipPath(
//           //       clipper: GreyTopClipper(
//           //         yOffset: _greyTopClipperAnimation.value,
//           //       ),
//           //       child: child,
//           //     );
//           //   },
//           //   child: Container(color: kWhite),
//           // ),
//           // AnimatedBuilder(
//           //   animation: _blueTopClipperAnimation,
//           //   builder: (_, Widget? child) {
//           //     return ClipPath(
//           //       clipper: BlueTopClipper(
//           //         yOffset: _blueTopClipperAnimation.value,
//           //       ),
//           //       child: child,
//           //     );
//           //   },
//           //   child: Container(color: kWhite),
//           // ),
//
//           SingleChildScrollView(
//             child:  SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: kPaddingL),
//                 child: Column(
//                   children: <Widget>[
//                      // Header(animation: _headerTextAnimation),
//                     // SizedBox(height:  180),
//                     // LoginForm(animation: _formElementAnimation),
//                     Form(
//                       // key: _formkeyy,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             height: 60,
//                           ),
//                           Text("Sign up",style: TextStyle(
//                             fontSize: 30,
//                             fontWeight: FontWeight.w600,
//                           ),),
//                           SizedBox(height: 33,),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                             child: CustomInputField(
//                               // controller: emailController,
//                               textInputType: TextInputType.text,
//                               text: "Email",
//                               isPassword: false,
//                               validate: (val){
//                                 if(val == null || val.isEmpty ){
//                                   return "Enter a valid e-mail";
//                                 }
//                                 else{
//                                   return null;
//                                 }
//                               },
//                               isObsecure: false,
//                               hint: "Email",
//                               onsave: (val){
//                                 // emailController.text = val!;
//                               },
//                               onChanged: (val){
//                                 // emailController.text = val!;
//                               },
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                             child: CustomInputField(
//                               // controller: usernameController,
//                               textInputType: TextInputType.text,
//                               text: "Username",
//                               isPassword: false,
//                               validate: (val){
//                                 if(val == null || val.isEmpty ){
//                                   return "Enter a valid Username";
//                                 }
//                                 else{
//                                   return null;
//                                 }
//                               },
//                               isObsecure: false,
//                               hint: "Username",
//                               onsave: (val){
//                                 // usernameController.text = val!;
//                               },
//                               onChanged: (val){
//                                 // usernameController.text = val!;
//                               },
//                             ),
//                           ),
//
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                             child: CustomInputField(
//                               // controller: titleController,
//                               textInputType: TextInputType.text,
//                               text: "Title",
//                               isPassword: false,
//                               validate: (val){
//                                 if(val == null || val.isEmpty ){
//                                   return "Enter a valid title";
//                                 }
//                                 else{
//                                   return null;
//                                 }
//                               },
//                               isObsecure: false,
//                               hint: "Title",
//                               onsave: (val){
//                                 // titleController.text = val!;
//
//                               },
//                               onChanged: (val){
//                                 // titleController.text = val!;
//
//                               },
//                             ),
//                           ),
//
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                             child: CustomInputField(
//                               // controller: passwordController,
//                               textInputType: TextInputType.visiblePassword,
//                               text: "Password",
//                               isPassword: true,
//                               validate: (val){
//                                 if (val!.isEmpty) {
//                                   return 'Please enter some text';
//                                 }
//                                 else if (val.length < 6) {
//                                   return 'Must be more than 6 charater';
//                                 }else{
//                                   return null;
//                                 }
//                               },
//                               isObsecure: true,
//                               hint: "Password",
//                               onsave: (val){
//                                // passwordController.text = val!;
//
//                               },
//                               onChanged: (val){
//                                 print("Password: $val");
//                                 //passwordController.text = val!;
//
//                               },
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                             child: CustomInputField(
//                               //controller: phoneController,
//                               textInputType: TextInputType.text,
//                               text: "Phone Number",
//                               isPassword: false,
//                               validate: (val){
//                                 if(val == null || val.isEmpty ){
//                                   return "Enter a valid e-mail";
//                                 }
//                                 else{
//                                   return null;
//                                 }
//                               },
//                               isObsecure: false,
//                               hint: "Phone Number",
//                               onsave: (val){
//                                 //phoneController.text = val!;
//                               },
//                               onChanged: (val){
//                                // phoneController.text = val!;
//                               },
//                             ),
//                           ),
//
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                           child: CustomInputField(
//                             //  controller: bioController,
//                               textInputType: TextInputType.text,
//                               text: "Bio",
//                               isPassword: false,
//                               validate: (val){
//                                 if(val == null || val.isEmpty ){
//                                   return "Enter a valid bio";
//                                 }
//                                 else{
//                                   return null;
//                                 }
//                               },
//                               isObsecure: false,
//                               hint: "Bio",
//                               onsave: (val){
//                                // bioController.text = val!;
//                               },
//                               onChanged: (val){
//                                // bioController.text = val!;
//                               },
//                             ),
//                           ),
//
//                           SizedBox(height: 51,),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text("You have an account?",style: TextStyle(
//                                 color: Color(0xff9D9D9D),
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                               ),),
//                               TextButton(onPressed: (){
//                                 // Get.offAll(()=>LoginPage());
//                               }, child: Text(
//                                 "Sign in",style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                               )),
//                             ],
//                           ),
//                           SizedBox(height: 50,),
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 24),
//                             child: Container(color: Colors.blueGrey,),
//                             // DefaultButton(txt: "Signup", function: (){
//                             //   _formkeyy.currentState?.save();
//                             //   if (_formkeyy.currentState!.validate()) {
//                             //     userController.signUp(emailController.text, passwordController.text, usernameController.text, titleController.text, phoneController.text, bioController.text,context);
//                             //   }
//                             //   // Get.to(()=>LandingScreen());
//                             // }, bg_color: Colors.black, txt_color: Colors.white,),
//                           ),
//                           SizedBox(height: 16,),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           )
//
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qtap/core/controller/user_functions_controller.dart';
import 'package:qtap/viwe/Authentication/widgets/custom_button.dart';
import 'package:qtap/viwe/Authentication/widgets/custom_input_field.dart';
import 'package:qtap/viwe/drawe/landing.dart';

import '../../core/constant/onboarding_constat.dart';
import 'login.dart';


class SignUp extends StatefulWidget {

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formkeyy = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  TextEditingController titleController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController bioController = TextEditingController();

  UserFunctionsController userController = Get.put(UserFunctionsController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Form(
              key: _formkeyy,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Text("Sign up",style: TextStyle(
                    color: kBlack,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),),
                  SizedBox(height: kPaddingL,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: CustomInputField(
                      controller: emailController,
                      textInputType: TextInputType.text,
                      text: "Email",
                      isPassword: false,
                      validate: (val){
                        if(val == null || val.isEmpty ){
                          return "Enter a valid e-mail";
                        }
                        else{
                          return null;
                        }
                      },
                      isObsecure: false,
                      hint: "Email",
                      onsave: (val){
                        emailController.text = val!;
                      },
                      onChanged: (val){
                        emailController.text = val!;
                      },
                    ),
                  ),
                  SizedBox(height: kPaddingM,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: CustomInputField(
                      controller: usernameController,
                      textInputType: TextInputType.text,
                      text: "Username",
                      isPassword: false,
                      validate: (val){
                        if(val == null || val.isEmpty ){
                          return "Enter a valid Username";
                        }
                        else{
                          return null;
                        }
                      },
                      isObsecure: false,
                      hint: "Username",
                      onsave: (val){
                        usernameController.text = val!;
                      },
                      onChanged: (val){
                        usernameController.text = val!;
                      },
                    ),
                  ),
                  SizedBox(height: kPaddingM,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: CustomInputField(
                      controller: titleController,
                      textInputType: TextInputType.text,
                      text: "Title",
                      isPassword: false,
                      validate: (val){
                        if(val == null || val.isEmpty ){
                          return "Enter a valid title";
                        }
                        else{
                          return null;
                        }
                      },
                      isObsecure: false,
                      hint: "Title",
                      onsave: (val){
                        titleController.text = val!;

                      },
                      onChanged: (val){
                        titleController.text = val!;

                      },
                    ),
                  ),
                  SizedBox(height: kPaddingM,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: CustomInputField(
                      controller: passwordController,
                      textInputType: TextInputType.visiblePassword,
                      text: "Password",
                      isPassword: true,
                      validate: (val){
                        if (val!.isEmpty) {
                          return 'Please enter some text';
                        }
                        else if (val.length < 6) {
                          return 'Must be more than 6 charater';
                        }else{
                          return null;
                        }
                      },
                      isObsecure: true,
                      hint: "Password",
                      onsave: (val){
                        passwordController.text = val!;

                      },
                      onChanged: (val){
                        print("Password: $val");
                        passwordController.text = val!;

                      },
                    ),
                  ),
                  SizedBox(height: kPaddingM,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: CustomInputField(
                      controller: phoneController,
                      textInputType: TextInputType.text,
                      text: "Phone Number",
                      isPassword: false,
                      validate: (val){
                        if(val == null || val.isEmpty ){
                          return "Enter a valid e-mail";
                        }
                        else{
                          return null;
                        }
                      },
                      isObsecure: false,
                      hint: "Phone Number",
                      onsave: (val){
                        phoneController.text = val!;
                      },
                      onChanged: (val){
                        phoneController.text = val!;
                      },
                    ),
                  ),
                  SizedBox(height: kPaddingM,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: CustomInputField(
                      controller: bioController,
                      textInputType: TextInputType.text,
                      text: "Bio",
                      isPassword: false,
                      validate: (val){
                        if(val == null || val.isEmpty ){
                          return "Enter a valid bio";
                        }
                        else{
                          return null;
                        }
                      },
                      isObsecure: false,
                      hint: "Bio",
                      onsave: (val){
                        bioController.text = val!;
                      },
                      onChanged: (val){
                        bioController.text = val!;
                      },
                    ),
                  ),

                  SizedBox(height: 51,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("You have an account?",style: TextStyle(
                        color: Color(0xff9D9D9D),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),),
                      TextButton(onPressed: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => Login(screenHeight: double.infinity),
                          ),
                        );                      }, child: Text(
                        "Sign in",style: TextStyle(
                        color: kBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      )),
                    ],
                  ),
                  SizedBox(height: 50,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: CustomButton(
                      onPressed: (){
                        _formkeyy.currentState?.save();
                        if (_formkeyy.currentState!.validate()) {
                          userController.signUp(emailController.text, passwordController.text, usernameController.text, titleController.text, phoneController.text, bioController.text,context);
                        }
                      },
                      color: kBlack,
                      text: "Signup",
                      textColor: Colors.white,

                    ),
                    // (txt: "Signup", function: (){
                    //   _formkeyy.currentState?.save();
                    //   if (_formkeyy.currentState!.validate()) {
                    //     userController.signUp(emailController.text, passwordController.text, usernameController.text, titleController.text, phoneController.text, bioController.text,context);
                    //   }
                    //   // Get.to(()=>LandingScreen());
                    // }, bg_color: Colors.black, txt_color: Colors.white,),
                  ),
                  SizedBox(height: 16,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
