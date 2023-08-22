import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/onboarding_constat.dart';
import '../../../core/controller/user_functions_controller.dart';
import '../../drawe/landing.dart';
import '../signup.dart';
import 'custom_button.dart';
import 'custom_input_field.dart';
import 'fade_slide_transition.dart';

// class LoginForm extends StatelessWidget {
//   final Animation<double> animation;
//
//   const LoginForm({
//     required this.animation,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//
//     final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//
//     TextEditingController emailController = TextEditingController();
//
//     TextEditingController passwordController = TextEditingController();
//
//     UserFunctionsController userController = Get.put(UserFunctionsController());
//
//     final height =
//         MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
//     final space = height > 650 ? kSpaceM : kSpaceS;
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
//       child:
//       Form(
//         key: _formkey,
//         child:
//         Column(
//         children: <Widget>[
//           CustomInputField(
//             controller: emailController,
//             textInputType: TextInputType.text,
//             text: "Email",
//             isPassword: false,
//             validate: (val){
//               if(val == null || val.isEmpty ){
//                 return "Enter a valid e-mail";
//               }
//               else{
//                 return null;
//               }
//             },
//             isObsecure: false,
//             hint: "Email",
//             onsave: (val){
//               emailController.text = val!;
//             },
//             onChanged: (val){
//               emailController.text = val!;
//             },
//           ),
//     //
//     //       FadeSlideTransition(
//     //         animation: animation,
//     //         additionalOffset: 5,
//     //         child:
//     //         CustomInputField(
//     //           controller: emailController,
//     //           textInputType: TextInputType.text,
//     //           text: "Email",
//     //           isPassword: false,
//     //           validate: (val){
//     //             if(val == null || val.isEmpty ){
//     //               return "Enter a valid e-mail";
//     //             }
//     //             else{
//     //               return null;
//     //             }
//     //           },
//     //           isObsecure: false,
//     //           hint: "Email",
//     //           onsave: (val){
//     //              emailController.text = val!;
//     //           },
//     //           onChanged: (val){
//     //              emailController.text = val!;
//     //           },
//     //         ),
//     //       ),
//     //       SizedBox(height: space),
//     //       FadeSlideTransition(
//     //         animation: animation,
//     //         additionalOffset: space,
//     //         child:  CustomInputField(
//     //           controller: passwordController,
//     //           textInputType: TextInputType.visiblePassword,
//     //           text: "Password",
//     //           isPassword: true,
//     //           validate: (val){
//     //             if (val!.isEmpty) {
//     //               return 'Please enter some text';
//     //             }
//     //             else if (val.length < 6) {
//     //               return 'Must be more than 6 charater';
//     //             }else{
//     //               return null;
//     //             }
//     //           },
//     //           isObsecure: true,
//     //           hint: "Password",
//     //           onsave: (val){
//     //              passwordController.text = val!;
//     //           },
//     //           onChanged: (val){
//     //              passwordController.text = val!;
//     //           },
//     //         ),
//     //       ),
//     //       SizedBox(height: space),
//     //       FadeSlideTransition(
//     //         animation: animation,
//     //         additionalOffset: 4 * space,
//     //         child:
//     //
//     //         TextButton(onPressed: (){
//     //           // Get.to(()=> ForgotPasswordPage());
//     //         }, child: Text(
//     //           "Forget password?",style: TextStyle(
//     //           color: Color(0xff9D9D9D),
//     //           fontSize: 16,
//     //           //  fontFamily: Config.fontPrime,
//     //           fontWeight: FontWeight.w600,
//     //         ),
//     //           textAlign: TextAlign.center,
//     //         )),
//     //       ),
//     //       SizedBox(height:  space),
//     //       FadeSlideTransition(
//     //         animation: animation,
//     //         additionalOffset: 2 * space,
//     //         child: CustomButton(
//     //           color: kBlack,
//     //           textColor: kWhite,
//     //           text: 'Login to continue',
//     //           onPressed:
//     //
//     //                 (){
//     //               _formkey.currentState?.save();
//     //               if (_formkey.currentState!.validate()) {
//     //                 userController.login(emailController.text, passwordController.text,context);
//     //               }
//     //               //Get.to(()=>LandingScreen());
//     //             }
//     //             // Get.to(()=>LandingPage());
//     //
//     //         ),
//     //       ),
//     //       SizedBox(height:  space),
//     //       // SizedBox(height: space),
//     //       // SizedBox(height: space),
//     //       FadeSlideTransition(
//     //         animation: animation,
//     //         additionalOffset: 2 * space,
//     //         child:
//     //       Row(
//     //         mainAxisAlignment: MainAxisAlignment.center,
//     //         children: [
//     //           Text("Don't have an account?",style: TextStyle(
//     //             color: Color(0xff9D9D9D),
//     //             fontSize: 16,
//     //             fontWeight: FontWeight.w600,
//     //           ),),
//     //           TextButton(onPressed: (){
//     //             Navigator.of(context).push(
//     //                     MaterialPageRoute(
//     //                       builder: (_) => SignUp(),
//     //                     ),
//     //                   );
//     //
//     //               // Get.to(()=>SignUp(screenHeight: screenHeight,));
//     //           }, child: Text(
//     //             "Sign up",style: TextStyle(
//     //             color: kBlack,
//     //             fontSize: 16,
//     //             fontWeight: FontWeight.w600,
//     //           ),
//     //           )),
//     //         ],
//     //       ),
//     // ),
//         ],
//       ),
//     ),
//     );
//   }
//
//
// }

//
// class LoginForm extends StatefulWidget {
//   // final Animation<double> animation;
//   //
//   // const LoginForm({
//   //   required this.animation,
//   // });
//   @override
//   State<LoginForm> createState() => _LoginFormState();
// }
//  final Animation<double> animation;
//
//
// class _LoginFormState extends State<LoginForm> {
//
//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//
//   TextEditingController emailController = TextEditingController();
//
//   TextEditingController passwordController = TextEditingController();
//
//   UserFunctionsController userController = Get.put(UserFunctionsController());
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     // Future<void> _goToLogin() async {
//     //   await _rippleAnimationController.forward();
//     //   Navigator.of(context).push(
//     //     MaterialPageRoute(
//     //       builder: (_) => Login(screenHeight: widget.screenHeight),
//     //     ),
//     //   );
//     // }
//     final height =
//         MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
//     final space = height > 650 ? kSpaceM : kSpaceS;
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
//       child: Column(
//         children: <Widget>[
//           FadeSlideTransition(
//             animation: animation,
//             additionalOffset: 0.0,
//             child:  CustomInputField(
//               // controller: emailController,
//               textInputType: TextInputType.text,
//               text: "Email",
//               isPassword: false,
//               validate: (val){
//                 if(val == null || val.isEmpty ){
//                   return "Enter a valid e-mail";
//                 }
//                 else{
//                   return null;
//                 }
//               },
//               isObsecure: false,
//               hint: "Email",
//               onsave: (val){
//                 // emailController.text = val!;
//               },
//               onChanged: (val){
//                 // emailController.text = val!;
//               },
//             ),
//           ),
//           SizedBox(height: space),
//           FadeSlideTransition(
//             animation: animation,
//             additionalOffset: space,
//             child:  CustomInputField(
//               // controller: passwordController,
//               textInputType: TextInputType.visiblePassword,
//               text: "Password",
//               isPassword: true,
//               validate: (val){
//                 if (val!.isEmpty) {
//                   return 'Please enter some text';
//                 }
//                 else if (val.length < 6) {
//                   return 'Must be more than 6 charater';
//                 }else{
//                   return null;
//                 }
//               },
//               isObsecure: true,
//               hint: "Password",
//               onsave: (val){
//                 // passwordController.text = val!;
//               },
//               onChanged: (val){
//                 // passwordController.text = val!;
//               },
//             ),
//           ),
//           SizedBox(height: space),
//           FadeSlideTransition(
//             animation: animation,
//             additionalOffset: 4 * space,
//             child:
//             // CustomButton(
//             //   color: kBlack,
//             //   textColor: kWhite,
//             //   text: 'Create a Bubble Account',
//             //   onPressed: () {},
//             // ),
//             TextButton(onPressed: (){
//               // Get.to(()=> ForgotPasswordPage());
//             }, child: Text(
//               "Forget password?",style: TextStyle(
//               color: Color(0xff9D9D9D),
//               fontSize: 16,
//               //  fontFamily: Config.fontPrime,
//               fontWeight: FontWeight.w600,
//             ),
//               textAlign: TextAlign.center,
//             )),
//           ),
//           SizedBox(height:  space),
//           FadeSlideTransition(
//             animation: animation,
//             additionalOffset: 2 * space,
//             child: CustomButton(
//               color: kBlack,
//               textColor: kWhite,
//               text: 'Login to continue',
//               onPressed: () {
//                 Get.to(()=>LandingPage());
//
//               },
//             ),
//           ),
//           SizedBox(height:  space),
//           // SizedBox(height: space),
//           // SizedBox(height: space),
//           FadeSlideTransition(
//             animation: animation,
//             additionalOffset: 2 * space,
//             child:
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("Don't have an account?",style: TextStyle(
//                   color: Color(0xff9D9D9D),
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                 ),),
//                 TextButton(onPressed: (){
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (_) => SignUp(),
//                     ),
//                   );
//
//                   // Get.to(()=>SignUp(screenHeight: screenHeight,));
//                 }, child: Text(
//                   "Sign up",style: TextStyle(
//                   color: kBlack,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                 ),
//                 )),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   }
class LoginForm extends StatefulWidget {
  final Animation<double> animation;

  const LoginForm({
    required this.animation,
  });

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserFunctionsController userController = Get.put(UserFunctionsController());



  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final space = height > 650 ? kSpaceM : kSpaceS;
    return
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
      child: Form(
        key: _formkey,
        child:
        Column(
          children: <Widget>[

            FadeSlideTransition(
              animation: widget.animation,
              additionalOffset: 5,
              child: CustomInputField(
                controller: emailController,
                textInputType: TextInputType.text,
                text: "Email",
                isPassword: false,
                validate: (val) {
                  if (val == null || val.isEmpty) {
                    return "Enter a valid e-mail";
                  } else {
                    return null;
                  }
                },
                isObsecure: false,
                hint: "Email",
                onsave: (val) {
                  emailController.text = val!;
                },
                onChanged: (val) {
                  emailController.text = val!;
                },
              ),
            ),
            SizedBox(height: space),
            FadeSlideTransition(
              animation: widget.animation,
              additionalOffset: space,
              child: CustomInputField(
                controller: passwordController,
                textInputType: TextInputType.visiblePassword,
                text: "Password",
                isPassword: true,
                validate: (val) {
                  if (val!.isEmpty) {
                    return 'Please enter some text';
                  } else if (val.length < 6) {
                    return 'Must be more than 6 charater';
                  } else {
                    return null;
                  }
                },
                isObsecure: true,
                hint: "Password",
                onsave: (val) {
                  passwordController.text = val!;
                },
                onChanged: (val) {
                  passwordController.text = val!;
                },
              ),
            ),
            SizedBox(height: space),
            FadeSlideTransition(
              animation: widget.animation,
              additionalOffset: 4 * space,
              child: TextButton(
                onPressed: () {
                  // Get.to(()=> ForgotPasswordPage());
                },
                child: Text(
                  "Forget password?",
                  style: TextStyle(
                    color: Color(0xff9D9D9D),
                    fontSize: 16,
                    //  fontFamily: Config.fontPrime,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: space),
            FadeSlideTransition(
              animation: widget.animation,
              additionalOffset: 2 * space,
              child: CustomButton(
                color: kBlack,
                textColor: kWhite,
                text: 'Login to continue',
                onPressed: () {
                  _formkey.currentState?.save();
                  if (_formkey.currentState!.validate()) {
                    userController.login(
                      emailController.text,
                      passwordController.text,
                      context,
                    );
                  }
                  //Get.to(()=>LandingScreen());
                },
              ),
            ),
            SizedBox(height: space),
            // SizedBox(height: space),
            // SizedBox(height: space),
            FadeSlideTransition(
              animation: widget.animation,
              additionalOffset: 2 * space,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Color(0xff9D9D9D),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => SignUp(),
                        ),
                      );

                      // Get.to(()=>SignUp(screenHeight: screenHeight,));
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: kBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
