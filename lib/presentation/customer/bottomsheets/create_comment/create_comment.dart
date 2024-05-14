import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/dialogs/alert_dialog.dart';

import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/customer/bottomsheets/create_comment/create_comment_controller.dart';
import 'package:okoshki/presentation/customer/widgets/button_customer.dart';

class CreateCommentBottomSheet extends StatelessWidget {
  const CreateCommentBottomSheet({super.key, required this.controller});
  final CreateCommentController controller;

  String get text => switch (controller.rating) {
        0 => '',
        <= 3 => 'Что разочаровало?',
        4 => 'Что можно улучшить?',
        5 => 'Что понравилось?',
        _ => "null"
      };

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return LayoutBottomSheet.customer(
      padding: EdgeInsets.fromLTRB(
        16,
        16,
        16,
        MediaQuery.of(context).viewInsets.bottom,
      ),
      title: 'Добавление отзыва',
      children: [
        Observer(
          builder: (_) => Column(
            children: [
              Center(
                child: Padding(
                  padding: controller.rating == 0
                      ? const EdgeInsets.only(top: 32, bottom: 64)
                      : const EdgeInsets.symmetric(vertical: 16),
                  child: RatingBar.builder(
                    initialRating: controller.rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => SvgPicture.asset(
                      AppAssets.iconRating,
                      height: 34,
                      width: 34,
                      colorFilter: ColorFilter.mode(
                        AppColors.hexFFB444,
                        BlendMode.srcIn,
                      ),
                    ),
                    onRatingUpdate: (rating) => controller.rating = rating,
                  ),
                ),
              ),
              controller.rating != 0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          text,
                          style: AppTextStyles.s16w400h262626,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextField(
                            autofocus: true,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.sentences,
                            onChanged: (val) => controller.textComment = val,
                            decoration: const InputDecoration(
                              hintText: 'Твой отзыв',
                            ),
                            maxLines: 5,
                            minLines: 1,
                          ),
                        ),
                        ButtonCustomer.large(
                          title: 'Опубликовать отзыв',
                          onPressed: controller.isEnabledButtonCreateComment
                              ? () async {
                                  final isResult =
                                      await controller.createComment();
                                  if (!isResult) {
                                    return;
                                  }
                                  if (context.mounted) {
                                    await appRouter.pop();
                                  }
                                  if (context.mounted) {
                                    showAdaptiveDialog(
                                      context: context,
                                      builder: (context) {
                                        return const DialogApp.createComment();
                                      },
                                    );
                                  }
                                }
                              : null,
                        ),
                      ],
                    )
                  : Container()
            ],
          ),
        ),
      ],
    );
  }
}
