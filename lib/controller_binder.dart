import 'package:bdcalling_class/presentation/state_holders/bottom_nav_controller.dart';
import 'package:bdcalling_class/presentation/state_holders/review_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> BottomNavController());
    Get.lazyPut(()=> ReviewController());
  }
}