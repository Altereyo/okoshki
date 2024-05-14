import 'package:flutter/material.dart';
import 'package:okoshki/domain/entities/comment.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/customer/bottomsheets/edit_comment/edit_comment.dart';
import 'package:okoshki/presentation/customer/bottomsheets/edit_comment/edit_comment_controller.dart';
import 'package:okoshki/presentation/customer/screens/saloon_details/saloon_details_controller.dart';
import 'package:okoshki/presentation/customer/widgets/button_customer.dart';

class CommentInfoBottomSheet extends StatelessWidget {
  const CommentInfoBottomSheet({super.key, required this.comment});
  final Comment comment;
  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return LayoutBottomSheet.customer(
      title: '',
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtonApp.small(
              title: 'О салоне',
              onPressed: () {
                final saloonDetailsCustomerController =
                    sl<SaloonDetailsCustomerController>(
                  param1: comment.salon.id,
                );
                appRouter.push(
                  SaloonDetailsCustomerRoute(
                    controller: saloonDetailsCustomerController,
                  ),
                );
              },
            ),
            ButtonCustomer.small(
              title: 'Изменить',
              onPressed: () async {
                final controller = sl<EditCommentController>(param1: comment);
                showModalBottomSheet(
                  isScrollControlled: true,
                  useSafeArea: true,
                  context: context,
                  builder: (context) => EditCommentBottomSheet(
                    controller: controller,
                  ),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
