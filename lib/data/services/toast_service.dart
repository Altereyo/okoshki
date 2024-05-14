import 'package:fluttertoast/fluttertoast.dart';
import 'package:okoshki/internal/ui/app_colors.dart';

abstract class ToastService {
  static void showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: AppColors.hexFFFFFF,
      textColor: AppColors.hex262626,
      fontSize: 16.0,
    );
  }
}
