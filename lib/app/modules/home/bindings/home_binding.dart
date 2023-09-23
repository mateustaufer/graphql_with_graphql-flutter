import 'package:get/get.dart';

import '../../../data/providers/home_provider.dart';
import '../../../data/repositories/home_repository.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(repository: HomeRepository(HomeProvider())),
    );
  }
}
