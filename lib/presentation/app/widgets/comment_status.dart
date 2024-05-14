import 'package:flutter/material.dart';
import 'package:okoshki/internal/constants/status_comment.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

class CommentStatusWidget extends StatelessWidget {
  const CommentStatusWidget({
    super.key,
    required this.status,
  });
  final String status;

  Color color() {
    if (StatusCommentEnum.posted.name == status) {
      return AppColors.hex0BD0AD;
    }
    if (StatusCommentEnum.moderate.name == status) {
      return AppColors.hex43BCCE;
    }
    if (StatusCommentEnum.canceled.name == status) {
      return AppColors.hex979797;
    }

    return Colors.red;
  }

  String title() {
    if (StatusCommentEnum.posted.name == status) {
      return 'Опубликован';
    }
    if (StatusCommentEnum.moderate.name == status) {
      return 'На модерации';
    }
    if (StatusCommentEnum.canceled.name == status) {
      return 'Отклонён';
    }
    return 'null';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: 28,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                color: color()),
            child: Center(
              child: Text(
                title(),
                style: AppTextStyles.s14w600hFFFFFF,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
