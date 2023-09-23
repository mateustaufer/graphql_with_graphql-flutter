import 'package:get/get.dart';
import '../../../data/repositories/login_repository.dart';

class LoginController extends GetxController {
  final LoginRepository repository;

  LoginController({required this.repository});
}
