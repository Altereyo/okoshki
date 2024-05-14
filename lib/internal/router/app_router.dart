import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:okoshki/internal/router/path_route.dart';
import 'package:okoshki/presentation/app/screens/privacy_policy/privacy_policy.dart';
import 'package:okoshki/presentation/app/screens/rules_contracts/rules_contracts.dart';
import 'package:okoshki/presentation/app/screens/splash/splash.dart';
import 'package:okoshki/presentation/app/screens/terms_of_service/terms_of_service.dart';
import 'package:okoshki/presentation/app/screens/view_pdf/view_pdf.dart';
import 'package:okoshki/presentation/customer/screens/auth/auth.dart';
import 'package:okoshki/presentation/customer/screens/booking_info/booking_info_controller.dart';
import 'package:okoshki/presentation/customer/screens/favorite_saloons/favorite_saloons.dart';
import 'package:okoshki/presentation/customer/screens/help_tip/help_tip.dart';
import 'package:okoshki/presentation/customer/screens/booking_info/booking_info.dart';
import 'package:okoshki/presentation/customer/screens/my_bookings/my_bookings.dart';
import 'package:okoshki/presentation/customer/screens/my_comments/my_comments.dart';
import 'package:okoshki/presentation/customer/screens/profile/profile.dart';
import 'package:okoshki/presentation/customer/screens/home/home.dart';
import 'package:okoshki/presentation/customer/screens/saloon_details/saloon_details.dart';
import 'package:okoshki/presentation/customer/screens/saloon_details/saloon_details_controller.dart';
import 'package:okoshki/presentation/saloon/screens/comments_customer/comments_customer.dart';
import 'package:okoshki/presentation/saloon/screens/scanning_qr/scanning_qr.dart';
import 'package:okoshki/presentation/customer/screens/search_saloons/search_saloons.dart';
import 'package:okoshki/presentation/customer/screens/settings/settings.dart';
import 'package:okoshki/presentation/saloon/screens/auth/auth.dart';
import 'package:okoshki/presentation/customer/screens/intro/intro.dart';
import 'package:okoshki/presentation/saloon/screens/documents/documents.dart';
import 'package:okoshki/presentation/saloon/screens/help_tip/help_tip.dart';
import 'package:okoshki/presentation/saloon/screens/history_stat/history_stat.dart';
import 'package:okoshki/presentation/saloon/screens/basic_data/basic_data.dart';
import 'package:okoshki/presentation/saloon/screens/intro/intro.dart';
import 'package:okoshki/presentation/saloon/screens/masters/masters.dart';
import 'package:okoshki/presentation/saloon/screens/home/home.dart';
import 'package:okoshki/presentation/saloon/screens/primary_settings/primary_settings.dart';
import 'package:okoshki/presentation/saloon/screens/profile/profile.dart';
import 'package:okoshki/presentation/saloon/screens/services/services.dart';
import 'package:okoshki/presentation/saloon/screens/settings/settings.dart';
import 'package:okoshki/presentation/saloon/screens/stocks/stocks.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        //app
        AutoRoute(
          page: SplashRoute.page,
          path: PathRoute.splashScreen,
        ),
        AutoRoute(
          page: ViewPDFRoute.page,
        ),
        AutoRoute(
          page: PrivacyPolicyRoute.page,
          path: PathRoute.privacyPolicyScreen,
        ),
        AutoRoute(
          page: RulesContractsRoute.page,
        ),
        AutoRoute(
          page: TermsOfServiceRoute.page,
          path: PathRoute.termsOfServiceScreen,
        ),
        //customer
        AutoRoute(
          page: AuthCustomerRoute.page,
          path: PathRoute.authCustomerScreen,
        ),
        AutoRoute(
          page: HelpTipCustomerRoute.page,
          path: PathRoute.helpTipCustomerScreen,
        ),
        AutoRoute(
          page: IntroCustomerRoute.page,
          path: PathRoute.introCustomerScreen,
        ),
        AutoRoute(
          page: HomeCustomerRoute.page,
          path: PathRoute.homeCustomerScreen,
        ),
        AutoRoute(
          page: SaloonDetailsCustomerRoute.page,
        ),
        AutoRoute(
          page: ProfileCustomerRoute.page,
          path: PathRoute.profileCustomerScreen,
        ),
        AutoRoute(
          page: SearchSaloonsCustomerRoute.page,
          path: PathRoute.searchSaloonsCustomerScreen,
        ),
        AutoRoute(
          page: FavoriteSaloonCustomerRoute.page,
          path: PathRoute.favoriteSaloonsCustomerScreen,
        ),
        AutoRoute(
          page: BookingInfoCustomerRoute.page,
        ),
        AutoRoute(
          page: MyBookingsCustomerRoute.page,
          path: PathRoute.myBookingsCustomerScreen,
        ),
        AutoRoute(
          page: MyCommentsCustomerRoute.page,
          path: PathRoute.myCommentsCustomerScreen,
        ),
        //saloon
        AutoRoute(
          page: AuthSaloonRoute.page,
          path: PathRoute.authSaloonScreen,
        ),
        AutoRoute(
          page: HelpTipSaloonRoute.page,
          path: PathRoute.helpTipSaloonScreen,
        ),
        AutoRoute(
          page: IntroSaloonRoute.page,
          path: PathRoute.introSaloonScreen,
        ),
        AutoRoute(
          page: PrimarySettingsSaloonRoute.page,
          path: PathRoute.primarySettingSaloonScreen,
        ),
        AutoRoute(
          page: HomeSaloonRoute.page,
          path: PathRoute.homeSaloonScreen,
        ),
        AutoRoute(
          page: ProfileSaloonRoute.page,
          path: PathRoute.profileSaloonScreen,
        ),
        AutoRoute(
          page: BasicDataSaloonRoute.page,
          path: PathRoute.basicDataSaloonScreen,
        ),
        AutoRoute(
          page: MastersSaloonRoute.page,
          path: PathRoute.mastersSaloonScreen,
        ),
        AutoRoute(
          page: ServicesSaloonRoute.page,
          path: PathRoute.servicesSaloonScreen,
        ),
        AutoRoute(
          page: SettingsCustomerRoute.page,
          path: PathRoute.settingsCustomerScreen,
        ),
        AutoRoute(
          page: SettingsSaloonRoute.page,
          path: PathRoute.settingsSaloonScreen,
        ),
        AutoRoute(
          page: DocumentsSaloonRoute.page,
          path: PathRoute.documentsSaloonScreen,
        ),
        AutoRoute(
          page: HistoryStatSaloonRoute.page,
          path: PathRoute.historyStatSaloonScreen,
        ),
        AutoRoute(
          page: ScanningQrSaloonRoute.page,
          path: PathRoute.scanningQrSaloonScreen,
        ),
        AutoRoute(
          page: StocksSaloonRoute.page,
          path: PathRoute.stocksSaloonScreen,
        ),
        AutoRoute(
          page: CommentsCustomerSaloonRoute.page,
          path: PathRoute.commentsCustomerSaloonScreen,
        ),
      ];
}
