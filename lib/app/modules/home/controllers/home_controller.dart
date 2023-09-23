import 'package:get/get.dart';

import '../../../data/repositories/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository repository;

  HomeController({required this.repository}) {
    Get.delete<HomeController>();
  }

  String readRepositories = """
      query ReadRepositories(\$nRepositories: Int!) {
        viewer {
          repositories(last: \$nRepositories) {
            nodes {
              id
              name
              viewerHasStarred
            }
          }
        }
      }
    """;

  void fetchRepositories() {}
}
