import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qtap/core/controller/user_functions_controller.dart';
import 'package:qtap/viwe/Authentication/widgets/custom_button.dart';

import '../../../../core/constant/onboarding_constat.dart';
import '../../../Authentication/widgets/custom_input_field.dart';

class CreateNewContactScreen extends StatelessWidget {

  final GlobalKey<FormState> _formkeey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  UserFunctionsController userController = Get.put(UserFunctionsController());



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Form(
          key: _formkeey,
          child: SafeArea(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(Icons.arrow_back)),
                          Text("Create new contact",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 26,
                                  color: Colors.black)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_back,color: Colors.transparent,)),
                        ],
                      ),
                      SizedBox(height: 150,),
                      CustomInputField(
                        initialVal: nameController.text,

                        controller: nameController,
                        textInputType: TextInputType.name,
                        validate: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                        onsave: (val) {
                          nameController.text = val!;
                        },
                        onChanged: (val) {
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
                        validate: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                        onsave: (val) {
                          titleController.text = val!;
                        },
                        onChanged: (val) {
                          titleController.text = val!;
                        },
                        hint: "Title",
                      ),
                      SizedBox(height: 20,),
                      CustomInputField(
                        controller: phoneController,
                        textInputType: TextInputType.phone,
                        initialVal: phoneController.text,
                        isPassword: false,
                        isObsecure: false,
                        validate: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                        onsave: (val) {
                          phoneController.text = val!;
                        },
                        onChanged: (val) {
                          phoneController.text = val!;
                        },
                        hint: "Phone",
                      ),
                      SizedBox(height: 20,),
                      CustomInputField(
                        controller: emailController,
                        initialVal: emailController.text,
                        textInputType: TextInputType.text,
                        isPassword: false,
                        isObsecure: false,
                        validate: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                        onsave: (val) {
                          emailController.text = val!;
                        },
                        onChanged: (val) {
                          emailController.text = val!;
                        },
                        hint: "Email",
                      ),
                      SizedBox(
                        height: 40,
                      ),

                      CustomButton(color: kBlack, textColor: kWhite, text: "Add connection", onPressed: () async {
                        _formkeey.currentState?.save();
                        if (_formkeey.currentState!.validate()) {
                          userController.addConnectionContact(
                            userController.userModel.value.id!,
                            nameController.text,
                            phoneController.text,
                            titleController.text,
                            emailController.text,
                          );
                          nameController.clear();
                          titleController.clear();
                          phoneController.clear();
                          Get.back();
                        }
                      },),

                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
