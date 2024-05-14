import 'package:flutter/material.dart';
import 'package:okoshki/application.dart';
import 'package:okoshki/domain/repository/services/local_data_repository.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/utils/sl.dart';

class SnackbarService {
  Future<void> _showSnack({
    String? title,
    required String content,
    bool isError = false,
  }) async {
    final snackbar = _buildSnack(
      title: title,
      content: content,
      isError: isError,
    );
    scaffoldMessengerKey.currentState!
      ..hideCurrentSnackBar()
      ..showSnackBar(snackbar);
  }

  SnackBar _buildSnack({
    String? title,
    required String content,
    bool isError = false,
  }) {
    final isSaloon = sl<LocalDataRepository>().getIsSaloon();
    final backgroundColor = isError
        ? AppColors.hexF64C4C
        : isSaloon
            ? AppColors.hex385EO
            : AppColors.hex43BCCE;

    return SnackBar(
      duration: const Duration(seconds: 10),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.fixed,
      dismissDirection: DismissDirection.none,
      showCloseIcon: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          Text(content),
        ],
      ),
    );
  }

  Future<void> showCustomSnack({
    String? title,
    required String content,
    bool isError = false,
  }) async {
    _showSnack(
      title: title,
      content: content,
      isError: isError,
    );
  }

  Future<void> showUserBlocked() async {
    _showSnack(
      title: 'Ошибка',
      content: 'Пользователь заблокирован',
      isError: true,
    );
  }

  Future<void> showRequestError(int code, String content) async {
    _showSnack(
      title: 'Ошибка',
      content: content,
      isError: true,
    );
  }

  // Future<void> showNoConnection() async {
  //   _showSnack(
  //     title: 'Ошибка',
  //     content:
  //         'Отсутствует подключение к сети. Пожалуйста, проверьте подключение',
  //     isError: true,
  //   );
  // }
  //
  // Future<void> showRequestFailed() async {
  //   _showSnack(
  //     title: 'Ошибка',
  //     content:
  //         'Не удалось обратиться к серверу. Попробуйте, попробуйте снова через некоторое время',
  //     isError: true,
  //   );
  // }
}
