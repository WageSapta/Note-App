import 'package:get/get.dart';
import 'package:noteapp/features/add/controllers/add_controller.dart';

class AddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddController());
  }
}
