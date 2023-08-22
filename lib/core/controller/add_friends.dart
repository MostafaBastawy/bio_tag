import 'package:get/get.dart';

class AddConnectionController extends GetxController{

  RxInt currentIndex = 0.obs;

  changeIndex(int index){
    currentIndex = index.obs;
    notifyChildrens();
    update();
  }

}