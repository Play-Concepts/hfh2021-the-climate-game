import 'package:climategame/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class AuthController extends GetxController {
  final AuthService authService = Get.find<AuthService>();

  String loginUrl() => authService.loginUrl();
  String extractPda(String token) => authService.extractPda(token);
}
