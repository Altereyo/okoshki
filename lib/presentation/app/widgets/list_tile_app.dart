import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:validators2/validators2.dart';

class ListTileApp extends StatelessWidget {
  const ListTileApp({
    super.key,
    this.pathIcon,
    required this.title,
    this.counter,
    required this.isSaloon,
    required this.onTap,
  });

  final String? pathIcon;
  final String title;
  final String? counter;
  final bool? isSaloon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.hexFFFFFFTransparent0,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              _leading(),
              _text(),
              _trailing(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _leading() {
    return pathIcon != null
        ? Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SvgPicture.asset(
              pathIcon!,
              height: 20,
              width: 20,
              colorFilter: ColorFilter.mode(
                AppColors.hex696969,
                BlendMode.srcIn,
              ),
            ),
          )
        : Container();
  }

  Widget _trailing() {
    return onTap != null
        ? Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 16,
              color: isSaloon == null
                  ? AppColors.hex696969
                  : isSaloon!
                      ? AppColors.hex385EO
                      : AppColors.hex43BCCE,
            ),
          )
        : Container();
  }

  Widget _text() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: counter != null && isLength(counter!, 4) ? 140 : null,
            child: Text(
              title,
              softWrap: true,
              overflow: TextOverflow.clip,
              style: AppTextStyles.s16w600h262626,
            ),
          ),
          counter != null
              ? Text(
                  counter!,
                  style: counter != '0'
                      ? isSaloon!
                          ? AppTextStyles.s16w600h385EO
                          : AppTextStyles.s16w600h43BCCE
                      : AppTextStyles.s16w600hC0C0C0,
                )
              : Container(),
        ],
      ),
    );
  }
}
