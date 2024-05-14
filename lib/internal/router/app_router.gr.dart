// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthCustomerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthCustomerScreen(),
      );
    },
    AuthSaloonRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthSaloonScreen(),
      );
    },
    BasicDataSaloonRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BasicDataSaloonScreen(),
      );
    },
    BookingInfoCustomerRoute.name: (routeData) {
      final args = routeData.argsAs<BookingInfoCustomerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BookingInfoCustomerScreen(
          key: args.key,
          controller: args.controller,
        ),
      );
    },
    CommentsCustomerSaloonRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CommentsCustomerSaloonScreen(),
      );
    },
    DocumentsSaloonRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DocumentsSaloonScreen(),
      );
    },
    FavoriteSaloonCustomerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoriteSaloonCustomerScreen(),
      );
    },
    HelpTipCustomerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HelpTipCustomerScreen(),
      );
    },
    HelpTipSaloonRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HelpTipSaloonScreen(),
      );
    },
    HistoryStatSaloonRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HistoryStatSaloonScreen(),
      );
    },
    HomeCustomerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeCustomerScreen(),
      );
    },
    HomeSaloonRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeSaloonScreen(),
      );
    },
    IntroCustomerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const IntroCustomerScreen(),
      );
    },
    IntroSaloonRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const IntroSaloonScreen(),
      );
    },
    MastersSaloonRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MastersSaloonScreen(),
      );
    },
    MyBookingsCustomerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyBookingsCustomerScreen(),
      );
    },
    MyCommentsCustomerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyCommentsCustomerScreen(),
      );
    },
    PrimarySettingsSaloonRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrimarySettingsSaloonScreen(),
      );
    },
    PrivacyPolicyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrivacyPolicyScreen(),
      );
    },
    ProfileCustomerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileCustomerScreen(),
      );
    },
    ProfileSaloonRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileSaloonScreen(),
      );
    },
    RulesContractsRoute.name: (routeData) {
      final args = routeData.argsAs<RulesContractsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RulesContractsScreen(
          key: args.key,
          isSaloon: args.isSaloon,
        ),
      );
    },
    SaloonDetailsCustomerRoute.name: (routeData) {
      final args = routeData.argsAs<SaloonDetailsCustomerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SaloonDetailsCustomerScreen(
          key: args.key,
          controller: args.controller,
        ),
      );
    },
    ScanningQrSaloonRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScanningQrSaloonScreen(),
      );
    },
    SearchSaloonsCustomerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchSaloonsCustomerScreen(),
      );
    },
    ServicesSaloonRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ServicesSaloonScreen(),
      );
    },
    SettingsCustomerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsCustomerScreen(),
      );
    },
    SettingsSaloonRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsSaloonScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    StocksSaloonRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StocksSaloonScreen(),
      );
    },
    TermsOfServiceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TermsOfServiceScreen(),
      );
    },
    ViewPDFRoute.name: (routeData) {
      final args = routeData.argsAs<ViewPDFRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ViewPDFScreen(
          key: args.key,
          url: args.url,
          title: args.title,
          isSaveButton: args.isSaveButton,
        ),
      );
    },
  };
}

/// generated route for
/// [AuthCustomerScreen]
class AuthCustomerRoute extends PageRouteInfo<void> {
  const AuthCustomerRoute({List<PageRouteInfo>? children})
      : super(
          AuthCustomerRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthCustomerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthSaloonScreen]
class AuthSaloonRoute extends PageRouteInfo<void> {
  const AuthSaloonRoute({List<PageRouteInfo>? children})
      : super(
          AuthSaloonRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthSaloonRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BasicDataSaloonScreen]
class BasicDataSaloonRoute extends PageRouteInfo<void> {
  const BasicDataSaloonRoute({List<PageRouteInfo>? children})
      : super(
          BasicDataSaloonRoute.name,
          initialChildren: children,
        );

  static const String name = 'BasicDataSaloonRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BookingInfoCustomerScreen]
class BookingInfoCustomerRoute
    extends PageRouteInfo<BookingInfoCustomerRouteArgs> {
  BookingInfoCustomerRoute({
    Key? key,
    required BookingInfoCustomerController controller,
    List<PageRouteInfo>? children,
  }) : super(
          BookingInfoCustomerRoute.name,
          args: BookingInfoCustomerRouteArgs(
            key: key,
            controller: controller,
          ),
          initialChildren: children,
        );

  static const String name = 'BookingInfoCustomerRoute';

  static const PageInfo<BookingInfoCustomerRouteArgs> page =
      PageInfo<BookingInfoCustomerRouteArgs>(name);
}

class BookingInfoCustomerRouteArgs {
  const BookingInfoCustomerRouteArgs({
    this.key,
    required this.controller,
  });

  final Key? key;

  final BookingInfoCustomerController controller;

  @override
  String toString() {
    return 'BookingInfoCustomerRouteArgs{key: $key, controller: $controller}';
  }
}

/// generated route for
/// [CommentsCustomerSaloonScreen]
class CommentsCustomerSaloonRoute extends PageRouteInfo<void> {
  const CommentsCustomerSaloonRoute({List<PageRouteInfo>? children})
      : super(
          CommentsCustomerSaloonRoute.name,
          initialChildren: children,
        );

  static const String name = 'CommentsCustomerSaloonRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DocumentsSaloonScreen]
class DocumentsSaloonRoute extends PageRouteInfo<void> {
  const DocumentsSaloonRoute({List<PageRouteInfo>? children})
      : super(
          DocumentsSaloonRoute.name,
          initialChildren: children,
        );

  static const String name = 'DocumentsSaloonRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FavoriteSaloonCustomerScreen]
class FavoriteSaloonCustomerRoute extends PageRouteInfo<void> {
  const FavoriteSaloonCustomerRoute({List<PageRouteInfo>? children})
      : super(
          FavoriteSaloonCustomerRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteSaloonCustomerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HelpTipCustomerScreen]
class HelpTipCustomerRoute extends PageRouteInfo<void> {
  const HelpTipCustomerRoute({List<PageRouteInfo>? children})
      : super(
          HelpTipCustomerRoute.name,
          initialChildren: children,
        );

  static const String name = 'HelpTipCustomerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HelpTipSaloonScreen]
class HelpTipSaloonRoute extends PageRouteInfo<void> {
  const HelpTipSaloonRoute({List<PageRouteInfo>? children})
      : super(
          HelpTipSaloonRoute.name,
          initialChildren: children,
        );

  static const String name = 'HelpTipSaloonRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HistoryStatSaloonScreen]
class HistoryStatSaloonRoute extends PageRouteInfo<void> {
  const HistoryStatSaloonRoute({List<PageRouteInfo>? children})
      : super(
          HistoryStatSaloonRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryStatSaloonRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeCustomerScreen]
class HomeCustomerRoute extends PageRouteInfo<void> {
  const HomeCustomerRoute({List<PageRouteInfo>? children})
      : super(
          HomeCustomerRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeCustomerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeSaloonScreen]
class HomeSaloonRoute extends PageRouteInfo<void> {
  const HomeSaloonRoute({List<PageRouteInfo>? children})
      : super(
          HomeSaloonRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeSaloonRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [IntroCustomerScreen]
class IntroCustomerRoute extends PageRouteInfo<void> {
  const IntroCustomerRoute({List<PageRouteInfo>? children})
      : super(
          IntroCustomerRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroCustomerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [IntroSaloonScreen]
class IntroSaloonRoute extends PageRouteInfo<void> {
  const IntroSaloonRoute({List<PageRouteInfo>? children})
      : super(
          IntroSaloonRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroSaloonRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MastersSaloonScreen]
class MastersSaloonRoute extends PageRouteInfo<void> {
  const MastersSaloonRoute({List<PageRouteInfo>? children})
      : super(
          MastersSaloonRoute.name,
          initialChildren: children,
        );

  static const String name = 'MastersSaloonRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyBookingsCustomerScreen]
class MyBookingsCustomerRoute extends PageRouteInfo<void> {
  const MyBookingsCustomerRoute({List<PageRouteInfo>? children})
      : super(
          MyBookingsCustomerRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyBookingsCustomerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyCommentsCustomerScreen]
class MyCommentsCustomerRoute extends PageRouteInfo<void> {
  const MyCommentsCustomerRoute({List<PageRouteInfo>? children})
      : super(
          MyCommentsCustomerRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyCommentsCustomerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PrimarySettingsSaloonScreen]
class PrimarySettingsSaloonRoute extends PageRouteInfo<void> {
  const PrimarySettingsSaloonRoute({List<PageRouteInfo>? children})
      : super(
          PrimarySettingsSaloonRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrimarySettingsSaloonRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PrivacyPolicyScreen]
class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
      : super(
          PrivacyPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileCustomerScreen]
class ProfileCustomerRoute extends PageRouteInfo<void> {
  const ProfileCustomerRoute({List<PageRouteInfo>? children})
      : super(
          ProfileCustomerRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileCustomerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileSaloonScreen]
class ProfileSaloonRoute extends PageRouteInfo<void> {
  const ProfileSaloonRoute({List<PageRouteInfo>? children})
      : super(
          ProfileSaloonRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileSaloonRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RulesContractsScreen]
class RulesContractsRoute extends PageRouteInfo<RulesContractsRouteArgs> {
  RulesContractsRoute({
    Key? key,
    required bool isSaloon,
    List<PageRouteInfo>? children,
  }) : super(
          RulesContractsRoute.name,
          args: RulesContractsRouteArgs(
            key: key,
            isSaloon: isSaloon,
          ),
          initialChildren: children,
        );

  static const String name = 'RulesContractsRoute';

  static const PageInfo<RulesContractsRouteArgs> page =
      PageInfo<RulesContractsRouteArgs>(name);
}

class RulesContractsRouteArgs {
  const RulesContractsRouteArgs({
    this.key,
    required this.isSaloon,
  });

  final Key? key;

  final bool isSaloon;

  @override
  String toString() {
    return 'RulesContractsRouteArgs{key: $key, isSaloon: $isSaloon}';
  }
}

/// generated route for
/// [SaloonDetailsCustomerScreen]
class SaloonDetailsCustomerRoute
    extends PageRouteInfo<SaloonDetailsCustomerRouteArgs> {
  SaloonDetailsCustomerRoute({
    Key? key,
    required SaloonDetailsCustomerController controller,
    List<PageRouteInfo>? children,
  }) : super(
          SaloonDetailsCustomerRoute.name,
          args: SaloonDetailsCustomerRouteArgs(
            key: key,
            controller: controller,
          ),
          initialChildren: children,
        );

  static const String name = 'SaloonDetailsCustomerRoute';

  static const PageInfo<SaloonDetailsCustomerRouteArgs> page =
      PageInfo<SaloonDetailsCustomerRouteArgs>(name);
}

class SaloonDetailsCustomerRouteArgs {
  const SaloonDetailsCustomerRouteArgs({
    this.key,
    required this.controller,
  });

  final Key? key;

  final SaloonDetailsCustomerController controller;

  @override
  String toString() {
    return 'SaloonDetailsCustomerRouteArgs{key: $key, controller: $controller}';
  }
}

/// generated route for
/// [ScanningQrSaloonScreen]
class ScanningQrSaloonRoute extends PageRouteInfo<void> {
  const ScanningQrSaloonRoute({List<PageRouteInfo>? children})
      : super(
          ScanningQrSaloonRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScanningQrSaloonRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchSaloonsCustomerScreen]
class SearchSaloonsCustomerRoute extends PageRouteInfo<void> {
  const SearchSaloonsCustomerRoute({List<PageRouteInfo>? children})
      : super(
          SearchSaloonsCustomerRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchSaloonsCustomerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ServicesSaloonScreen]
class ServicesSaloonRoute extends PageRouteInfo<void> {
  const ServicesSaloonRoute({List<PageRouteInfo>? children})
      : super(
          ServicesSaloonRoute.name,
          initialChildren: children,
        );

  static const String name = 'ServicesSaloonRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsCustomerScreen]
class SettingsCustomerRoute extends PageRouteInfo<void> {
  const SettingsCustomerRoute({List<PageRouteInfo>? children})
      : super(
          SettingsCustomerRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsCustomerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsSaloonScreen]
class SettingsSaloonRoute extends PageRouteInfo<void> {
  const SettingsSaloonRoute({List<PageRouteInfo>? children})
      : super(
          SettingsSaloonRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsSaloonRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StocksSaloonScreen]
class StocksSaloonRoute extends PageRouteInfo<void> {
  const StocksSaloonRoute({List<PageRouteInfo>? children})
      : super(
          StocksSaloonRoute.name,
          initialChildren: children,
        );

  static const String name = 'StocksSaloonRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TermsOfServiceScreen]
class TermsOfServiceRoute extends PageRouteInfo<void> {
  const TermsOfServiceRoute({List<PageRouteInfo>? children})
      : super(
          TermsOfServiceRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsOfServiceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ViewPDFScreen]
class ViewPDFRoute extends PageRouteInfo<ViewPDFRouteArgs> {
  ViewPDFRoute({
    Key? key,
    required String url,
    required String title,
    required bool isSaveButton,
    List<PageRouteInfo>? children,
  }) : super(
          ViewPDFRoute.name,
          args: ViewPDFRouteArgs(
            key: key,
            url: url,
            title: title,
            isSaveButton: isSaveButton,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewPDFRoute';

  static const PageInfo<ViewPDFRouteArgs> page =
      PageInfo<ViewPDFRouteArgs>(name);
}

class ViewPDFRouteArgs {
  const ViewPDFRouteArgs({
    this.key,
    required this.url,
    required this.title,
    required this.isSaveButton,
  });

  final Key? key;

  final String url;

  final String title;

  final bool isSaveButton;

  @override
  String toString() {
    return 'ViewPDFRouteArgs{key: $key, url: $url, title: $title, isSaveButton: $isSaveButton}';
  }
}
