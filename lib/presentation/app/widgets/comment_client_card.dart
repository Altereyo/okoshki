import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/domain/entities/comment.dart';
import 'package:okoshki/domain/entities/extensions/comment.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

class CommentClientCard extends StatelessWidget {
  const CommentClientCard({super.key, required this.comment});
  final Comment comment;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: 36,
                  width: 36,
                  color: AppColors.hex77BFCA,
                  child: Center(
                    child: Text(
                      comment.abbreviationUserName,
                      style: AppTextStyles.s16w600hFFFFFF,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      comment.userNameClient,
                      style: AppTextStyles.s16w600h262626,
                    ),
                    Text(
                      comment.createUpdateDate,
                      style: AppTextStyles.s14w400h696969,
                    ),
                  ],
                ),
              ),
              RatingBarIndicator(
                rating: double.tryParse(comment.rating.toString()) ?? 0,
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              comment.text,
              softWrap: true,
              style: AppTextStyles.s14w400h262626,
            ),
          ),
        ],
      ),
    );
  }
}