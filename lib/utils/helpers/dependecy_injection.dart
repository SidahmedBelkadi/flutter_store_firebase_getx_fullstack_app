import 'package:get/get.dart';
import 'package:s_store/utils/helpers/network_manager.dart';

class DependecyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
