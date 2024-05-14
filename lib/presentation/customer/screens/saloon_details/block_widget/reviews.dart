import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/app/widgets/comment_client_card.dart';
import 'package:okoshki/presentation/app/widgets/dialogs/alert_dialog.dart';
import 'package:okoshki/presentation/app/widgets/dialogs/client_not_auth.dart';
import 'package:okoshki/presentation/customer/bottomsheets/create_comment/create_comment.dart';
import 'package:okoshki/presentation/customer/bottomsheets/create_comment/create_comment_controller.dart';
import 'package:okoshki/presentation/customer/screens/saloon_details/saloon_details_controller.dart';
import 'package:provider/provider.dart';

class BlockReviewsOfSaloon extends StatelessWidget {
  const BlockReviewsOfSaloon({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SaloonDetailsCustomerController>(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.hexE9FCFF,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Отзывы клиентов  (${controller.commentsList.length})',
              style: AppTextStyles.s14w600h696969,
            ),
          ),
          controller.commentsList.isEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Пока нет ни одного отзыва',
                    style: AppTextStyles.s14w400h696969,
                  ),
                )
              : const CommentsList(),
          const CreateCommentButton(),
        ],
      ),
    );
  }
}

class CommentsList extends StatelessWidget {
  const CommentsList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SaloonDetailsCustomerController>(context);
    return Observer(
      builder: (_) => Column(
        children: [
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.itemCountComment,
            itemBuilder: (_, index) {
              final comment = controller.commentsList[index];
              return CommentClientCard(comment: comment);
            },
          ),
          controller.commentsList.length > controller.itemCountComment
              ? TextButton(
                  onPressed: controller.setItemCountComment,
                  child: Text(
                    'Загрузить еще 5 отзывов',
                    style: AppTextStyles.s16w600h43BCCE,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class CreateCommentButton extends StatelessWidget {
  const CreateCommentButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SaloonDetailsCustomerController>(context);
    return ButtonApp.large(
      title: 'Добавить свой отзыв',
      onPressed: () {
        if (!controller.whetherTheUserIsAuthorized) {
          showAdaptiveDialog(
            context: context,
            builder: (context) {
              return const ClientNotAuthDialog.comment();
            },
          );
          return;
        }
        if (controller.saloonDetail.canAddComment == false) {
          showAdaptiveDialog(
            context: context,
            builder: (context) {
              return const DialogApp.notBooking();
            },
          );
          return;
        }
        final createCommentController = sl<CreateCommentController>(
          param1: controller.saloonDetail.id,
        );
        showModalBottomSheet(
          isScrollControlled: true,
          useSafeArea: true,
          context: context,
          builder: (context) => CreateCommentBottomSheet(
            controller: createCommentController,
          ),
        );
      },
    );
  }
}
