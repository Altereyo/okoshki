import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/domain/entities/comment.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/comment_client_card.dart';
import 'package:okoshki/presentation/app/widgets/preload/preload_list.dart';
import 'package:okoshki/presentation/saloon/screens/comments_customer/comments_customer_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/preload/preload_comment_card.dart';

@RoutePage()
class CommentsCustomerSaloonScreen extends StatelessWidget {
  const CommentsCustomerSaloonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<CommentsCustomerSaloonController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Отзывы клиентов  (${controller.numComments})'),
      ),
      body: Observer(
        builder: (_) => controller.isLoading
            ? const PreloadListWidget(card: PreloadCommentSaloonCard())
            : const ViewScreen(),
      ),
    );
  }
}

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<CommentsCustomerSaloonController>();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Observer(
        builder: (_) => Column(
          children: [
            ...controller.commentsGroupSort.entries.map(
              (map) => _commentsList(map),
            ),
          ],
        ),
      ),
    );
  }

  Widget _commentsList(MapEntry<String, List<Comment>> map) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          map.key,
          style: AppTextStyles.s14w600h696969,
        ),
        ListView.separated(
          separatorBuilder: (_,__)=>const Divider(),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: map.value.length,
          itemBuilder: (_, index) {
            final comment = map.value[index];

            return CommentClientCard(comment: comment);
          },
        ),
      ],
    );
  }
}
