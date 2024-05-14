import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/domain/entities/comment.dart';
import 'package:okoshki/domain/entities/extensions/comment.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/comment_status.dart';
import 'package:okoshki/presentation/app/widgets/preload/preload_list.dart';
import 'package:okoshki/presentation/app/widgets/saloon_card.dart';
import 'package:okoshki/presentation/customer/bottomsheets/comment_info/comment_info.dart';
import 'package:okoshki/presentation/customer/screens/my_comments/my_comments_controller.dart';
import 'package:okoshki/presentation/customer/widgets/not_results.dart';
import 'package:okoshki/presentation/customer/widgets/preload/preload_comment_card.dart';

@RoutePage()
class MyCommentsCustomerScreen extends StatelessWidget {
  const MyCommentsCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<MyCommentsCustomerController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои отзывы'),
      ),
      body: Observer(
        builder: (_) => controller.isLoading
            ? const PreloadListWidget(card: PreloadCommentCustomerCard())
            : const MyCommentList(),
      ),
    );
  }
}

class MyCommentList extends StatelessWidget {
  const MyCommentList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<MyCommentsCustomerController>();
    return Observer(
      builder: (_) {
        final myCommentList = controller.myCommentsList.toList();
        return myCommentList.isEmpty
            ? const NotResultsWidget(
                title: 'Пока не добавлено ни одного отзыва к салонам',
                subTitle: 'Чтобы добавить отзыв, нужно сперва посетить салон',
              )
            : ListView.separated(
                separatorBuilder: (_, __) => const Divider(),
                padding: const EdgeInsets.all(16),
                itemCount: myCommentList.length,
                itemBuilder: (_, index) {
                  final comment = myCommentList[index];
                  return CommentCard(comment: comment);
                },
              );
      },
    );
  }
}

class CommentCard extends StatelessWidget {
  const CommentCard({super.key, required this.comment});
  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        context: context,
        builder: (context) => CommentInfoBottomSheet(comment: comment),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    comment.createUpdateDate,
                    style: AppTextStyles.s14w400h696969,
                  ),
                  const SizedBox(width: 8),
                  RatingBarIndicator(
                    rating: comment.rating.toDouble(),
                    itemBuilder: (context, index) => SvgPicture.asset(
                      AppAssets.iconRating,
                      colorFilter: ColorFilter.mode(
                        AppColors.hexFFB444,
                        BlendMode.srcIn,
                      ),
                    ),
                    itemCount: 5,
                    itemSize: 16.0,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
              CommentStatusWidget(
                status: comment.createUpdateStatus,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              comment.createUpdateText,
              style: AppTextStyles.s14w400h262626,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SaloonCardWidget(
              logo: comment.salon.logo,
              isPremium: comment.salon.isPremium,
              title: comment.salon.title,
              address: comment.salon.address.toString(),
              rating: comment.salon.rating.toString(),
              usersLiked: comment.salon.usersLiked!.toInt(),
            ),
          ),
        ],
      ),
    );
  }
}
