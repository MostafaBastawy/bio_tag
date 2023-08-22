
import 'package:get/get.dart';
import 'package:qtap/core/controller/user_functions_controller.dart';

import 'controller/add_friends.dart';


class Binding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut(() => UserFunctionsController());
    Get.lazyPut(() => AddConnectionController());


  }
}