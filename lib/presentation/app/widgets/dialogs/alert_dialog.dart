import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

class DialogApp extends StatelessWidget {
  final String text;
  const DialogApp.booking({
    super.key,
  }) : text =
            'Напоминаем, что если вы не придёте и не отмените бронь — мы заблокируем возможность брони в этом салоне';
  const DialogApp.notBooking({
    super.key,
  }) : text =
            'Отзывы можно оставить только для салонов, которые оказывали тебе услуги через наш сервис, либо вы уже оставляли отзыв данному салону';
  const DialogApp.comment({
    super.key,
  }) : text = 'Вы уже оставляли отзыв данному салону';
  const DialogApp.createComment({
    super.key,
  }) : text = 'Ваш отзыв добавлен';
  const DialogApp.updateComment({
    super.key,
  }) : text = 'Ваш отзыв обновлён';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: AppColors.hexFFFFFF,
      backgroundColor: AppColors.hexFFFFFF,
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              text,
              textAlign: TextAlign.center,
              style: AppTextStyles.s18w600h262626,
            ),
            const Divider(),
            Center(
              child: TextButton(
                child: Text(
                  'Ок',
                  style: AppTextStyles.s18w600h262626,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
