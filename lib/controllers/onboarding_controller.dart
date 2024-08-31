import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  final _storage = GetStorage();

  // Key to check if onboarding has been viewed
  static const _onboardingKey = 'onboardingViewed';

  bool get isOnboardingViewed => _storage.read<bool>(_onboardingKey) ?? false;

  void setOnboardingViewed(bool viewed) {
    _storage.write(_onboardingKey, viewed);
  }
}
