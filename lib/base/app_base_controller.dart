import 'package:get/get.dart';

class AppBaseController extends GetxController {
  final RxBool _setBusy = false.obs;

  void showToast({required String? msg}) {
    if (msg?.isNotEmpty ?? false) {
      Get.showSnackbar(
        GetSnackBar(
          message: msg,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  bool get isBusy => _setBusy.value;

  set setBusy(bool value) {
    _setBusy.value = value;
    update();
  }
}
