import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/domain/entities/extensions/saloon_schedule.dart';
import 'package:okoshki/domain/entities/extensions/social_network.dart';
import 'package:okoshki/domain/entities/saloon_master.dart';
import 'package:okoshki/domain/entities/saloon_schedule.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/presentation/app/widgets/image_network_circular.dart';
import 'package:okoshki/presentation/customer/bottomsheets/shedule_info/shedule_info.dart';
import 'package:okoshki/presentation/customer/screens/saloon_details/saloon_details_controller.dart';
import 'package:okoshki/presentation/customer/widgets/button_social_network.dart';
import 'package:provider/provider.dart';

class BlockAdditionalInfoOfSaloon extends StatelessWidget {
  const BlockAdditionalInfoOfSaloon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            'О салоне',
            style: AppTextStyles.s14w600h696969,
          ),
        ),
        const DiscriptionOfSaloon(),
        const SiteOfSaloon(),
        const SocialNetworkOfSaloon(),
        const SheduleOfSaloon(),
        const Divider(),
        const MastersOfSaloon(),
      ],
    );
  }
}

class MastersOfSaloon extends StatelessWidget {
  const MastersOfSaloon({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SaloonDetailsCustomerController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Мастера',
          style: AppTextStyles.s14w600h696969,
        ),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: controller.saloonMastersList.length,
            itemBuilder: (context, index) {
              final master = controller.saloonMastersList[index];
              return _cardMaster(master);
            },
          ),
        ),
      ],
    );
  }

  Widget _cardMaster(SaloonMaster saloonMaster) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: saloonMaster.avatar != null
              ? ImageNetworkIndicator(
                  src: saloonMaster.avatar!,
                  height: 46,
                  width: 46,
                )
              : SvgPicture.asset(AppAssets.avatarMaster),
        ),
        const SizedBox(width: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              saloonMaster.name,
              style: AppTextStyles.s16w600h262626,
            ),
            Text(
              saloonMaster.specialization ?? '',
              style: AppTextStyles.s14w400h262626,
            ),
          ],
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

class SheduleOfSaloon extends StatelessWidget {
  const SheduleOfSaloon({super.key});

  String textTime(SaloonSchedule saloonSchedule) {
    if (saloonSchedule.weekend) {
      return 'Выходной';
    } else {
      return saloonSchedule.timeStartEnd;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SaloonDetailsCustomerController>(context);
    SaloonSchedule saloonSheduleWeekDay() {
      final DateTime dateTime = DateTime.now();
      final list = controller.saloonScheduleList;
      return list.firstWhere((element) => element.weekDay == dateTime.weekday);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => showModalBottomSheet(
          isScrollControlled: true,
          useSafeArea: true,
          context: context,
          builder: (context) => SheduleInfoBottomSheet(
            saloonSheduleList: controller.saloonScheduleList,
            currentDayOfTheWeek: saloonSheduleWeekDay().weekDay,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.hex696969,
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(textTime(saloonSheduleWeekDay()),
                  style: AppTextStyles.s14w600h696969),
              Icon(
                Icons.expand_more_outlined,
                color: AppColors.hex43BCCE,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SocialNetworkOfSaloon extends StatelessWidget {
  const SocialNetworkOfSaloon({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SaloonDetailsCustomerController>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ...controller.socialNetworksList.map((socialNetwork) {
            if (socialNetwork.isActive) {
              return ButtonSocialNetwork(
                assetIcon: socialNetwork.icon,
                onPressed: () => controller.openInBrowser(socialNetwork.url),
              );
            } 
            return Container();
          }),
        ],
      ),
    );
  }
}

class SiteOfSaloon extends StatelessWidget {
  const SiteOfSaloon({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SaloonDetailsCustomerController>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: controller.saloonDetail.site == null
          ? Container()
          : InkWell(
              onTap: () =>
                  controller.openInBrowser(controller.saloonDetail.site!),
              child: Text(
                controller.saloonDetail.site!.split('https://').last,
                style: AppTextStyles.s14w600h43BCCE,
              ),
            ),
    );
  }
}

class DiscriptionOfSaloon extends StatefulWidget {
  const DiscriptionOfSaloon({super.key});

  @override
  State<DiscriptionOfSaloon> createState() => _DiscriptionOfSaloonState();
}

class _DiscriptionOfSaloonState extends State<DiscriptionOfSaloon> {
  bool isExpandedText = false;
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SaloonDetailsCustomerController>(context);
    return controller.saloonDetail.description!.isEmpty
        ? Container()
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: DetectTextOverflowBuilder(
              maxLines: 3,
              textWidget: Text(
                controller.saloonDetail.description ?? 'Нет описания',
                overflow: TextOverflow.ellipsis,
                maxLines: isExpandedText ? 20 : 3,
                style: AppTextStyles.s14w400h262626,
              ),
              builder: (context, willOverflow) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.saloonDetail.description ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: isExpandedText ? 20 : 3,
                      style: AppTextStyles.s14w400h262626,
                    ),
                    if (willOverflow)
                      isExpandedText
                          ? Container()
                          : InkWell(
                              onTap: () {
                                setState(() => isExpandedText = true);
                              },
                              child: Text(
                                'Показать ещё',
                                style: AppTextStyles.s14w400h43BCCE,
                              ),
                            ),
                  ],
                );
              },
            ),
          );
  }
}

class DetectTextOverflowBuilder extends StatelessWidget {
  final Text textWidget;
  final Widget Function(BuildContext, bool) builder;
  final int maxLines;

  const DetectTextOverflowBuilder({
    super.key,
    required this.textWidget,
    required this.builder,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return LayoutBuilder(
      builder: (context, constraints) {
        final span = TextSpan(
          text: textWidget.data,
          style: textWidget.style ?? defaultTextStyle,
        );

        // Use a textpainter to determine if it will exceed max lines
        final tp = TextPainter(
          maxLines: maxLines,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
          text: span,
        );

        // trigger it to layout
        tp.layout(maxWidth: constraints.maxWidth);

        // whether the text overflowed or not
        final exceeded = tp.didExceedMaxLines;

        return builder(context, exceeded);
      },
    );
  }
}
