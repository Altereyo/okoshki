import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/domain/entities/search_item.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/presentation/app/widgets/icon_app.dart';
import 'package:okoshki/presentation/app/widgets/icon_buton_circle.dart';
import 'package:okoshki/presentation/app/widgets/preload/preload_list.dart';
import 'package:okoshki/presentation/customer/screens/search_saloons/search_saloons_controller.dart';
import 'package:okoshki/presentation/customer/widgets/map/map_widget.dart';
import 'package:okoshki/presentation/customer/widgets/not_results.dart';
import 'package:okoshki/presentation/customer/widgets/preload/preload_saloon_card.dart';
import 'package:okoshki/presentation/customer/widgets/saloon_card.dart';
import 'package:validators2/validators2.dart';

@RoutePage()
class SearchSaloonsCustomerScreen extends StatelessWidget {
  const SearchSaloonsCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarSearch(),
      body: ViewScreen(),
    );
  }
}

class AppBarSearch extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSearch({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = sl<SearchSaloonController>();
    return AppBar(
      centerTitle: false,
      title: _searchTextFormField(),
      leading: IconButtonApp(
        path: AppAssets.iconCloseOutline,
        color: AppColors.hex696969,
        onPressed: () {
          appRouter.pop();
          controller.clearSearch();
        },
      ),
    );
  }

  Widget _searchTextFormField() {
    final controller = sl<SearchSaloonController>();
    return RawAutocomplete<SearchItem>(
      displayStringForOption: (searchItem) => searchItem.search,
      optionsBuilder: (textEditingValue) async =>
          await controller.getSearchSaloonItemList(
        textEditingValue.text,
      ),
      fieldViewBuilder:
          (_, textEditingController, focusNode, onFieldSubmitted) {
        return TextFormField(
          autofocus: true,
          controller: textEditingController,
          focusNode: focusNode,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
            isDense: true,
            prefixIcon: IconButtonApp(
              path: AppAssets.iconSearch,
              color: AppColors.hex696969,
              size: 24,
              onPressed: null,
            ),
            suffixIcon: IconButton(
              icon: SvgPicture.asset(
                AppAssets.iconCancel,
                height: 24,
                width: 24,
              ),
              onPressed: () {
                textEditingController.clear();
                controller.clearSearch();
              },
            ),
            hintText: 'Поиск',
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.hexC0C0C0),
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.hexC0C0C0),
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
          ),
          onFieldSubmitted: (String value) {
            onFieldSubmitted();
            controller.onSearch(value);
          },
        );
      },
      onSelected: (searchItem) => controller.onSearch(searchItem.search),
      optionsViewBuilder: (context, onSelected, searchItemList) {
        return Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 90,
            child: Material(
              color: AppColors.hexFFFFFF,
              elevation: 2,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                itemCount: searchItemList.length,
                itemBuilder: (BuildContext context, int index) {
                  final searchItem = searchItemList.elementAt(index);
                  return GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            searchItem.search,
                            style: AppTextStyles.s16w400h262626,
                          ),
                          IconButtonApp(
                            path: AppAssets.iconSearch,
                            color: AppColors.hex696969,
                            size: 16,
                            onPressed: null,
                          ),
                        ],
                      ),
                    ),
                    onTap: () => onSelected(searchItem),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<SearchSaloonController>();
    return Observer(builder: (_) {
      if (isLength(controller.search, 0, 2)) {
        return _tutorialSearch();
      }
      return const ViewSaloons();
    });
  }

  Widget _tutorialSearch() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.arrow5Customer),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Введите название или адрес салона в поле сверху',
              textAlign: TextAlign.center,
              style: AppTextStyles.s18w600h262626,
            ),
          ),
        ],
      ),
    );
  }
}

class ViewSaloons extends StatelessWidget {
  const ViewSaloons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<SearchSaloonController>();
    return Observer(
      builder: (_) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            controller.isMap ? const MapWidget() : const SaloonsList(),
            const BottomNavigationBar(),
          ],
        );
      },
    );
  }
}

class SaloonsList extends StatelessWidget {
  const SaloonsList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<SearchSaloonController>();

    return Observer(builder: (_) {
      final saloonsList = controller.saloonSearchList.toList();
      return controller.isLoadingSearch
          ? const PreloadListWidget(card: PreloadSaloonCard())
          : saloonsList.isEmpty
              ? const NotResultsWidget(
                  title: 'Ничего такого мы не нашли...',
                  subTitle: 'Попробуйте другой поисковый запрос',
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: saloonsList.length,
                  itemBuilder: (context, index) => SaloonAndWindowCardWidget(
                    saloon: saloonsList[index],
                  ),
                );
    });
  }
}

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<SearchSaloonController>();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Observer(
            builder: (_) => IconButtonCircle(
              icon: controller.isMap ? AppAssets.iconList : AppAssets.iconMap,
              isSaloon: false,
              onPressed: () => controller.isMap = !controller.isMap,
            ),
          ),
        ],
      ),
    );
  }
}
