import 'package:dio/dio.dart';
import 'package:okoshki/data/api/rest_client_api.dart';
import 'package:okoshki/data/repository/api/address_repository_impl.dart';
import 'package:okoshki/data/repository/api/app_api_repository_impl.dart';
import 'package:okoshki/data/repository/api/auth_repository_impl.dart';
import 'package:okoshki/data/repository/api/booking_repository_imp.dart';
import 'package:okoshki/data/repository/api/comment_repository_impl.dart';
import 'package:okoshki/data/repository/api/saloon_balance_repository_impl.dart';
import 'package:okoshki/data/repository/api/saloon_documents_repository_impl.dart';
import 'package:okoshki/data/repository/api/saloon_master_repository_impl.dart';
import 'package:okoshki/data/repository/api/saloon_master_services_repository_impl.dart';
import 'package:okoshki/data/repository/api/saloon_photo_repository_impl.dart';
import 'package:okoshki/data/repository/api/saloon_repository_impl.dart';
import 'package:okoshki/data/repository/api/saloon_schedule_repository_impl.dart';
import 'package:okoshki/data/repository/api/saloon_statistics_repository_impl.dart';
import 'package:okoshki/data/repository/api/services_repository_impl.dart';
import 'package:okoshki/data/repository/api/social_network_repository_impl.dart';
import 'package:okoshki/data/repository/api/stock_repository_impl.dart';
import 'package:okoshki/data/repository/api/tariffs_repository_impl.dart';
import 'package:okoshki/data/repository/api/user_profile_repository_impl.dart';
import 'package:okoshki/data/repository/api/window_repository_impl.dart';
import 'package:okoshki/data/repository/api/window_service_repository_impl.dart';
import 'package:okoshki/data/repository/services/calendar_repository_impl.dart';
import 'package:okoshki/data/repository/services/geo_repository_impl.dart';
import 'package:okoshki/data/repository/services/local_data_repository_impl.dart';
import 'package:okoshki/data/repository/services/map_launcher_repository_imp.dart';
import 'package:okoshki/data/repository/services/permission_repository_impl.dart';
import 'package:okoshki/data/repository/services/share_repository_impl.dart';
import 'package:okoshki/data/repository/services/url_launcher_repository_impl.dart';
import 'package:okoshki/data/services/calendar_service.dart';
import 'package:okoshki/data/services/firebase_service.dart';
import 'package:okoshki/data/services/geolocation_service.dart';
import 'package:okoshki/data/services/map_launcher.dart';
import 'package:okoshki/data/services/permission_service.dart';
import 'package:okoshki/data/services/share_service.dart';
import 'package:okoshki/data/services/snackbar_service.dart';
import 'package:okoshki/data/services/storage_service.dart';
import 'package:okoshki/data/api/api_client.dart';
import 'package:okoshki/data/services/url_launcher.dart';
import 'package:okoshki/domain/entities/address.dart';
import 'package:okoshki/domain/entities/booking.dart';
import 'package:okoshki/domain/entities/comment.dart';
import 'package:okoshki/domain/entities/saloon_master.dart';
import 'package:okoshki/domain/entities/saloon_master_service.dart';
import 'package:okoshki/domain/entities/service_type.dart';
import 'package:okoshki/domain/entities/stock.dart';
import 'package:okoshki/domain/entities/window.dart';
import 'package:okoshki/domain/entities/window_service.dart';
import 'package:okoshki/domain/repository/api/address_repository.dart';
import 'package:okoshki/domain/repository/api/app_api_repository.dart';
import 'package:okoshki/domain/repository/api/auth_repository.dart';
import 'package:okoshki/domain/repository/api/booking_repository.dart';
import 'package:okoshki/domain/repository/services/calendar_repository.dart';
import 'package:okoshki/domain/repository/api/comment_repository.dart';
import 'package:okoshki/domain/repository/services/local_data_repository.dart';
import 'package:okoshki/domain/repository/services/geo_repository.dart';
import 'package:okoshki/domain/repository/services/map_launcher_repository.dart';
import 'package:okoshki/domain/repository/services/permission_repository.dart';
import 'package:okoshki/domain/repository/api/saloon_balance_repository.dart';
import 'package:okoshki/domain/repository/api/saloon_documents_repository.dart';
import 'package:okoshki/domain/repository/api/saloon_master_repository.dart';
import 'package:okoshki/domain/repository/api/saloon_master_services_repository.dart';
import 'package:okoshki/domain/repository/api/saloon_photo_repository.dart';
import 'package:okoshki/domain/repository/api/saloon_repository.dart';
import 'package:okoshki/domain/repository/api/saloon_schedule_repository.dart';
import 'package:okoshki/domain/repository/api/saloon_statistics_repository.dart';
import 'package:okoshki/domain/repository/api/services_repository.dart';
import 'package:okoshki/domain/repository/services/share_repository.dart';
import 'package:okoshki/domain/repository/api/social_networks_repository.dart';
import 'package:okoshki/domain/repository/api/stock_repository.dart';
import 'package:okoshki/domain/repository/api/tariffs_repository.dart';
import 'package:okoshki/domain/repository/services/url_launcher_repository.dart';
import 'package:okoshki/domain/repository/api/user_profile_repository.dart';
import 'package:okoshki/domain/repository/api/window_repository.dart';
import 'package:okoshki/domain/repository/api/window_service_repository.dart';
import 'package:okoshki/domain/state/app/addresses_store.dart';
import 'package:okoshki/domain/state/app/app_documents_store.dart';
import 'package:okoshki/domain/state/app/app_setting_store.dart';
import 'package:okoshki/domain/state/app/app_store.dart';
import 'package:okoshki/domain/state/app/services_store.dart';
import 'package:okoshki/domain/state/customer/auth_store.dart';
import 'package:okoshki/domain/state/customer/map_launcher_store.dart';
import 'package:okoshki/domain/state/customer/my_comments_store.dart';
import 'package:okoshki/domain/state/customer/windows_list_store.dart';
import 'package:okoshki/domain/state/customer/customer_store.dart';
import 'package:okoshki/domain/state/customer/favorite_saloons_store.dart';
import 'package:okoshki/domain/state/customer/my_bookings_store.dart';
import 'package:okoshki/domain/state/customer/saloon_details_store.dart';
import 'package:okoshki/domain/state/customer/saloons_list_store.dart';
import 'package:okoshki/domain/state/saloon/auth_store.dart';
import 'package:okoshki/domain/state/saloon/balance_store.dart';
import 'package:okoshki/domain/state/saloon/comments_store.dart';
import 'package:okoshki/domain/state/saloon/documents_store.dart';
import 'package:okoshki/domain/state/saloon/history_statistics_store.dart';
import 'package:okoshki/domain/state/saloon/master_store.dart';
import 'package:okoshki/domain/state/saloon/photo_store.dart';
import 'package:okoshki/domain/state/saloon/shedule_store.dart';
import 'package:okoshki/domain/state/saloon/stock_store.dart';
import 'package:okoshki/domain/state/saloon/saloon_store.dart';
import 'package:okoshki/domain/state/saloon/tariffs_store.dart';
import 'package:okoshki/domain/state/saloon/window_store.dart';
import 'package:okoshki/domain/state/saloon/social_networks_store.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/bottomsheets/contact_us/contact_us_controller.dart';
import 'package:okoshki/presentation/app/screens/privacy_policy/privacy_policy_controller.dart';
import 'package:okoshki/presentation/app/screens/rules_contracts/rules_contracts_controller.dart';
import 'package:okoshki/presentation/app/screens/terms_of_service/terms_of_service_controller.dart';
import 'package:okoshki/presentation/app/screens/view_pdf/view_pdf_controller.dart';
import 'package:okoshki/presentation/app/widgets/dialogs/client_blocking/client_blocking_controller.dart';
import 'package:okoshki/presentation/customer/bottomsheets/booking_form/booking_form_controller.dart';
import 'package:okoshki/presentation/customer/bottomsheets/booking_info_status/booking_info_status_controller.dart';
import 'package:okoshki/presentation/customer/bottomsheets/code_confirmation/code_confirmation_controller.dart';
import 'package:okoshki/presentation/customer/bottomsheets/create_comment/create_comment_controller.dart';
import 'package:okoshki/presentation/customer/bottomsheets/edit_comment/edit_comment_controller.dart';
import 'package:okoshki/presentation/customer/bottomsheets/filters_my_booking/filters_my_booking_controller.dart';
import 'package:okoshki/presentation/customer/bottomsheets/filters_sorting_saloons/filters_sorting_saloons_controller.dart';
import 'package:okoshki/presentation/customer/bottomsheets/map_launcher/map_launcher_controller.dart';
import 'package:okoshki/presentation/customer/bottomsheets/rename_profile_customer/rename_profile_customer_controller.dart';
import 'package:okoshki/presentation/customer/bottomsheets/selection_city_customer/selection_city_customer_controller.dart';
import 'package:okoshki/presentation/customer/screens/auth/auth_controller.dart';
import 'package:okoshki/presentation/customer/screens/booking_info/booking_info_controller.dart';
import 'package:okoshki/presentation/customer/screens/favorite_saloons/favorite_saloons_controller.dart';
import 'package:okoshki/presentation/customer/screens/help_tip/help_tip_controller.dart';
import 'package:okoshki/presentation/customer/screens/home/home_controller.dart';
import 'package:okoshki/presentation/customer/screens/intro/intro_controller.dart';
import 'package:okoshki/presentation/customer/screens/my_bookings/my_booking_controller.dart';
import 'package:okoshki/presentation/customer/screens/my_comments/my_comments_controller.dart';
import 'package:okoshki/presentation/customer/screens/profile/profile_controller.dart';
import 'package:okoshki/presentation/customer/screens/saloon_details/saloon_details_controller.dart';
import 'package:okoshki/presentation/customer/screens/search_saloons/search_saloons_controller.dart';
import 'package:okoshki/presentation/customer/screens/settings/settings_controller.dart';
import 'package:okoshki/presentation/customer/widgets/map/map_widget_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/add_service_to_window/add_service_to_window_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/balance_top_up/balance_top_up_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/booking_window_qr/booking_window_qr_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/create_stock/create_stock_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/create_window/create_windows_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_service_to_window/edit_service_to_window_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_stock/edit_stock_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_window/edit_window_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/filters_history_stat/filters_history_stat_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/history_balance/history_balance_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/premium_connect/premium_connect_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/window_detail/window_detail_controller.dart';
import 'package:okoshki/presentation/saloon/screens/auth/auth_controller.dart';
import 'package:okoshki/presentation/saloon/screens/comments_customer/comments_customer_controller.dart';
import 'package:okoshki/presentation/saloon/screens/documents/documents_controller.dart';
import 'package:okoshki/presentation/saloon/screens/help_tip/help_tip_controller.dart';
import 'package:okoshki/presentation/saloon/screens/history_stat/history_stat_controller.dart';
import 'package:okoshki/presentation/saloon/screens/home/home_controller.dart';
import 'package:okoshki/presentation/saloon/screens/intro/intro_controller.dart';
import 'package:okoshki/presentation/saloon/screens/primary_settings/primary_settings_controller.dart';
import 'package:okoshki/presentation/saloon/screens/masters/masters_controller.dart';
import 'package:okoshki/presentation/saloon/screens/profile/profile_controller.dart';
import 'package:okoshki/presentation/saloon/screens/basic_data/basic_data_controller.dart';
import 'package:okoshki/presentation/saloon/screens/services/services_controller.dart';
import 'package:okoshki/presentation/saloon/screens/settings/settings_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/add_service_master/add_service_master_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/add_service_saloon/add_service_saloon_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/create_master/create_master_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_master/edit_master_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_service/edit_service_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_social_network/edit_social_network_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_work_shedule/edit_work_shedule_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/password_recovery/password_recovery_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/registration_saloon.dart/registration_saloon_controller.dart';
import 'package:okoshki/presentation/saloon/screens/scanning_qr/scanning_qr_controller.dart';
import 'package:okoshki/presentation/saloon/screens/stocks/stocks_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/window/select_day_time_window/select_day_time_window_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/window/select_window_service/select_window_service_controller.dart';

Future<void> setupDependencies() async {
  await _setupDependenciesApi();
  await _setupDependenciesRouter();
  await _setupDependenciesService();
  await _setupDependenciesRepositoryApi();
  await _setupDependenciesRepositoryService();
  await _setupDependenciesStoreApp();
  await _setupDependenciesControllerApp();
  await _setupDependenciesStoreCustomer();
  await _setupDependenciesControllerCustomer();
  await _setupDependenciesStoreSaloon();
  await _setupDependenciesControllerSaloon();
}

Future<void> _setupDependenciesApi() async {
  sl.registerLazySingleton<Dio>(
    () => Dio(),
  );

  sl.registerLazySingleton<ApiClient>(
    () => ApiClient(
      dio: sl(),
      storageService: sl(),
    )..initDio(),
  );

  sl.registerLazySingleton<RestClientApi>(
    () => RestClientApi(
      sl<ApiClient>().dio,
    ),
  );
}

Future<void> _setupDependenciesRouter() async {
  sl.registerLazySingleton<AppRouter>(
    () => AppRouter(),
  );
}

Future<void> _setupDependenciesService() async {
  sl.registerLazySingleton<FirebaseService>(
    () => FirebaseService(),
  );
  sl.registerLazySingleton<GeolocationService>(
    () => GeolocationService()..initService(),
  );
  sl.registerLazySingleton<PermissionService>(
    () => PermissionService(),
  );
  sl.registerLazySingleton<SnackbarService>(
    () => SnackbarService(),
  );
  sl.registerLazySingleton<StorageService>(
    () => StorageService(),
  );
  sl.registerLazySingleton<MapLauncherService>(
    () => MapLauncherService(),
  );
  sl.registerLazySingleton<ShareService>(
    () => ShareService(),
  );
  sl.registerLazySingleton<CalendarService>(
    () => CalendarService(),
  );
  sl.registerLazySingleton<UrlLauncherService>(
    () => UrlLauncherService(),
  );
}

Future<void> _setupDependenciesRepositoryApi() async {
  sl.registerLazySingleton<AddressRepository>(
    () => AddressRepositoryImpl(
      restClientApi: sl(),
      geolocationService: sl(),
    ),
  );
  sl.registerLazySingleton<AppApiRepository>(
    () => AppApiRepositoryImpl(
      restClientApi: sl(),
    ),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      restClientApi: sl(),
    ),
  );
  sl.registerLazySingleton<CommentRepository>(
    () => CommentRepositoryImpl(
      restClientApi: sl(),
    ),
  );

  sl.registerLazySingleton<SaloonBalanceRepository>(
    () => SaloonBalanceRepositoryImpl(
      restClientApi: sl(),
    ),
  );
  sl.registerLazySingleton<SaloonDocumentsRepository>(
    () => SaloonDocumentsRepositoryImpl(
      restClientApi: sl(),
    ),
  );
  sl.registerLazySingleton<SaloonMasterRepository>(
    () => SaloonMasterRepositoryImpl(
      restClientApi: sl(),
    ),
  );
  sl.registerLazySingleton<SaloonMasterServiceRepository>(
    () => SaloonMasterServiceRepositoryImpl(
      restClientApi: sl(),
    ),
  );
  sl.registerLazySingleton<SaloonPhotoRepository>(
    () => SaloonPhotoRepositoryImpl(
      restClientApi: sl(),
    ),
  );
  sl.registerLazySingleton<SaloonRepository>(
    () => SaloonRepositoryImpl(
      restClientApi: sl(),
    ),
  );
  sl.registerLazySingleton<SaloonScheduleRepository>(
    () => SaloonScheduleRepositoryImpl(
      restClientApi: sl(),
    ),
  );
  sl.registerLazySingleton<SaloonStatisticsRepository>(
    () => SaloonStatisticsRepositoryImpl(
      restClientApi: sl(),
    ),
  );
  sl.registerLazySingleton<ServicesRepository>(
    () => ServicesRepositoryImpl(
      restClientApi: sl(),
    ),
  );
  sl.registerLazySingleton<SocialNetworkRepository>(
    () => SocialNetworkRepositoryImpl(
      restClientApi: sl(),
    ),
  );
  sl.registerLazySingleton<StockRepository>(
    () => StockRepositoryImpl(
      restClientApi: sl(),
    ),
  );
  sl.registerLazySingleton<UserProfileRepository>(
    () => UserProfileRepositoryImpl(
      restClientApi: sl(),
    ),
  );
  sl.registerLazySingleton<WindowRepository>(
    () => WindowRepositoryImpl(
      restClientApi: sl(),
    ),
  );
  sl.registerLazySingleton<WindowServiceRepository>(
    () => WindowServiceRepositoryImpl(
      restClientApi: sl(),
    ),
  );
  sl.registerLazySingleton<BookingRepository>(
    () => BookingRepositoryImpl(
      restClientApi: sl(),
    ),
  );
  sl.registerLazySingleton<TariffsRepository>(
    () => TariffsRepositoryImpl(
      restClientApi: sl(),
    ),
  );
}

Future<void> _setupDependenciesRepositoryService() async {
  sl.registerLazySingleton<GeoRepository>(
    () => GeoRepositoryImpl(
      geolocationService: sl(),
    ),
  );
  sl.registerLazySingleton<LocalDataRepository>(
    () => LocalDataRepositoryImpl(
      storageService: sl(),
    ),
  );
  sl.registerLazySingleton<PermissionRepository>(
    () => PermissionRepositoryImpl(
      permissionService: sl(),
    ),
  );
  sl.registerLazySingleton<MapLauncherRepository>(
    () => MapLauncherRepositoryImpl(
      mapLauncherService: sl(),
    ),
  );
  sl.registerLazySingleton<ShareRepository>(
    () => ShareRepositoryImpl(
      shareService: sl(),
    ),
  );

  sl.registerLazySingleton<CalendarRepository>(
    () => CalendarRepositoryImpl(
      calendarService: sl(),
    ),
  );
  sl.registerLazySingleton<UrlLauncherRepository>(
    () => UrlLauncherRepositoryImpl(
      urlLauncherService: sl(),
    ),
  );
}

Future<void> _setupDependenciesStoreApp() async {
  sl.registerLazySingleton<AppStore>(
    () => AppStore(
      appApiRepository: sl(),
    )..init(),
  );
  sl.registerLazySingleton<AppSettingStore>(
    () => AppSettingStore(
      appApiRepository: sl(),
    )..init(),
  );
  sl.registerLazySingleton<AppDocumentsStore>(
    () => AppDocumentsStore(
      appApiRepository: sl(),
    )..init(),
  );
}

Future<void> _setupDependenciesControllerApp() async {
  sl.registerLazySingleton<RulesContractsController>(
    () => RulesContractsController(
      appDocumentsStore: sl(),
    ),
  );
  sl.registerLazySingleton<ContactUsController>(
    () => ContactUsController(
      appSettingStore: sl(),
      urlLauncherRepository: sl(),
    ),
  );
  sl.registerLazySingleton<ViewPDFController>(
    () => ViewPDFController(
      urlLauncherRepository: sl(),
    ),
  );
  sl.registerLazySingleton<PrivacyPolicyController>(
    () => PrivacyPolicyController(
      appDocumentsStore: sl(),
    ),
  );
  sl.registerLazySingleton<TermsOfServiceController>(
    () => TermsOfServiceController(
      appDocumentsStore: sl(),
    ),
  );
}

Future<void> _setupDependenciesStoreCustomer() async {
  sl.registerFactoryParam<SaloonDetailsCustomerStore, int, void>(
    (saloonId, _) => SaloonDetailsCustomerStore(
      saloonId: saloonId,
      geoRepository: sl(),
      localDataRepository: sl(),
      saloonRepository: sl(),
      saloonPhotoRepository: sl(),
      socialNetworkRepository: sl(),
      saloonScheduleRepository: sl(),
      saloonMasterRepository: sl(),
      windowRepository: sl(),
      favoriteSaloonsCustomerStore: sl(),
      stockRepository: sl(),
      commentRepository: sl(),
    )..init(),
  );
  sl.registerFactoryParam<WindowsListCustomerStore, int, int>(
    (saloonId, windowId) => WindowsListCustomerStore(
      saloonId: saloonId,
      windowId: windowId,
      windowRepository: sl(),
    )..init(),
  );
  sl.registerLazySingleton<AuthCustomerStore>(
    () => AuthCustomerStore(authRepository: sl()),
  );
  sl.registerLazySingleton<CustomerStore>(
    () => CustomerStore(
      addressRepository: sl(),
      userProfileRepository: sl(),
      localDataRepository: sl(),
    )..init(),
  );
  sl.registerLazySingleton<SaloonsListCustomerStore>(
    () => SaloonsListCustomerStore(
      geoRepository: sl(),
      saloonRepository: sl(),
      customerStore: sl(),
    )..init(),
  );
  sl.registerLazySingleton<MyBookingsCustomerStore>(
    () => MyBookingsCustomerStore(
      bookingRepository: sl(),
      localDataRepository: sl(),
    )..init(),
  );
  sl.registerLazySingleton<FavoriteSaloonsCustomerStore>(
    () => FavoriteSaloonsCustomerStore(
      saloonRepository: sl(),
      userProfileRepository: sl(),
    )..init(),
  );
  sl.registerLazySingleton<MyCommentsCustomerStore>(
    () => MyCommentsCustomerStore(
      commentRepository: sl(),
      localDataRepository: sl(),
      customerStore: sl(),
    )..init(),
  );
  sl.registerLazySingleton<MapLauncherCustomerStore>(
    () => MapLauncherCustomerStore(
      mapLauncherRepository: sl(),
    )..init(),
  );
}

Future<void> _setupDependenciesControllerCustomer() async {
  sl.registerFactory<AuthCustomerController>(
    () => AuthCustomerController(
      localDataRepository: sl(),
      authCustomerStore: sl(),
    ),
  );
  sl.registerFactoryParam<CodeConfirmationController, String, void>(
    (phoneNumber, _) => CodeConfirmationController(
      localDataRepository: sl(),
      authCustomerStore: sl(),
      phoneNumber: phoneNumber,
    ),
  );
  sl.registerFactory<RenameProfileCustomerController>(
    () => RenameProfileCustomerController(
      customerStore: sl(),
    ),
  );
  sl.registerFactoryParam<BookingFormController, int, int>(
    (saloonId, windowId) => BookingFormController(
      localDataRepository: sl(),
      windowsListCustomerStore: sl(
        param1: saloonId,
        param2: windowId,
      ),
      myBookingsCustomerStore: sl(),
    )..init(),
  );
  sl.registerFactoryParam<BookingInfoCustomerController, Booking, void>(
    (booking, param2) => BookingInfoCustomerController(
        booking: booking,
        myBookingsCustomerStore: sl(),
        shareRepository: sl(),
        calendarRepository: sl()),
  );
  sl.registerFactoryParam<ClientBlockingController, int, void>(
    (saloonId, _) => ClientBlockingController(
      saloonsListCustomerStore: sl(),
      saloonId: saloonId,
    )..init(),
  );
  sl.registerFactoryParam<CreateCommentController, int, void>(
    (saloonId, _) => CreateCommentController(
      myCommentsCustomerStore: sl(),
      saloonId: saloonId,
    ),
  );
  sl.registerFactoryParam<EditCommentController, Comment, void>(
    (comment, _) => EditCommentController(
      myCommentsCustomerStore: sl(),
      comment: comment,
    )..init(),
  );
  sl.registerFactoryParam<BookingInfoStatusController, Booking, void>(
    (booking, _) => BookingInfoStatusController(
      commentsCustomerStore: sl(),
      booking: booking,
    ),
  );
  sl.registerFactoryParam<MapLauncherCustomerController,
      ({String title, Address address}), void>(
    (saloonRecords, _) => MapLauncherCustomerController(
      saloonRecords: saloonRecords,
      mapLauncherCustomerStore: sl(),
    ),
  );
  sl.registerFactoryParam<SaloonDetailsCustomerController, int, void>(
    (saloonId, _) => SaloonDetailsCustomerController(
      saloonDetailsCustomerStore: sl(param1: saloonId),
      shareRepository: sl(),
      urlLauncherRepository: sl(),
    )..init(),
  );
  sl.registerLazySingleton<IntroCustomerController>(
    () => IntroCustomerController(
      localDataRepository: sl(),
      appStore: sl(),
    ),
  );
  sl.registerLazySingleton<HomeCustomerController>(
    () => HomeCustomerController(
      localDataRepository: sl(),
      saloonListCustomerStore: sl(),
    )..init(),
  );
  sl.registerLazySingleton<HelpTipCustomerController>(
    () => HelpTipCustomerController(
      appStore: sl(),
    ),
  );
  sl.registerLazySingleton<ProfileCustomerController>(
    () => ProfileCustomerController(
      localDataRepository: sl(),
      customerStore: sl(),
      authCustomerStore: sl(),
      myBookingsCustomerStore: sl(),
      favoriteSaloonsCustomerStore: sl(),
      myCommentCustomerStore: sl(),
    ),
  );
  sl.registerLazySingleton<SettingsCustomerController>(
    () => SettingsCustomerController(
      customerStore: sl(),
      authCustomerStore: sl(),
    ),
  );
  sl.registerLazySingleton<SelectionCityCustomerController>(
    () => SelectionCityCustomerController(
      customerStore: sl(),
      saloonsListCustomerStore: sl(),
    ),
  );
  sl.registerLazySingleton<FiltersSortingSaloonsController>(
    () => FiltersSortingSaloonsController(
      servicesAppStore: sl(),
      saloonListCustomerStore: sl(),
    )..init(),
  );
  sl.registerLazySingleton<FiltersMyBookingController>(
    () => FiltersMyBookingController(
      myBookingsCustomerStore: sl(),
    )..init(),
  );
  sl.registerLazySingleton<SearchSaloonController>(
    () => SearchSaloonController(
      homeCustomerStore: sl(),
    ),
  );
  sl.registerLazySingleton<FavoriteSaloonsCustomerController>(
    () => FavoriteSaloonsCustomerController(
      favoriteSaloonsCustomerStore: sl(),
    ),
  );
  sl.registerLazySingleton<MyBookingsCustomerController>(
    () => MyBookingsCustomerController(
      myBookingsCustomerStore: sl(),
    ),
  );
  sl.registerLazySingleton<MyCommentsCustomerController>(
    () => MyCommentsCustomerController(
      myCommentsCustomerStore: sl(),
    ),
  );
  sl.registerLazySingleton<MapWidgetController>(
    () => MapWidgetController(
      geoRepository: sl(),
      homeCustomerStore: sl(),
    ),
  );
}

Future<void> _setupDependenciesStoreSaloon() async {
  sl.registerLazySingleton<HistoryStatisticsSaloonStore>(
    () => HistoryStatisticsSaloonStore(
      saloonStore: sl(),
      saloonStatisticsRepository: sl(),
      windowRepository: sl(),
    )..init(),
  );
  sl.registerLazySingleton<AddressesAppStore>(
    () => AddressesAppStore(
      addressRepository: sl(),
    )..init(),
  );
  sl.registerLazySingleton<AuthSaloonStore>(
    () => AuthSaloonStore(authRepository: sl()),
  );
  sl.registerLazySingleton<ServicesAppStore>(
    () => ServicesAppStore(
      servicesRepository: sl(),
    )..init(),
  );
  sl.registerLazySingleton<SaloonStore>(
    () => SaloonStore(
      saloonRepository: sl(),
    )..init(),
  );
  sl.registerLazySingleton<MasterSaloonStore>(
    () => MasterSaloonStore(
      saloonMasterRepository: sl(),
      saloonMasterServiceRepository: sl(),
      saloonStore: sl(),
    )..init(),
  );
  sl.registerLazySingleton<PhotoSaloonStore>(
    () => PhotoSaloonStore(
      saloonPhotoRepository: sl(),
      saloonStore: sl(),
    )..init(),
  );
  sl.registerLazySingleton<SheduleSaloonStore>(
    () => SheduleSaloonStore(
      saloonScheduleRepository: sl(),
      saloonStore: sl(),
    )..init(),
  );
  sl.registerLazySingleton<DocumentsSaloonStore>(
    () => DocumentsSaloonStore(
      documentsRepository: sl(),
      saloonStore: sl(),
    )..init(),
  );
  sl.registerLazySingleton<SocialNetworksSaloonStore>(
    () => SocialNetworksSaloonStore(
      saloonStore: sl(),
      socialNetworkRepository: sl(),
    )..init(),
  );
  sl.registerLazySingleton(
    () => WindowSaloonStore(
      saloonStore: sl(),
      windowRepository: sl(),
      bookingRepository: sl(),
    )..init(),
  );
  sl.registerLazySingleton<TariffsSaloonStore>(
    () => TariffsSaloonStore(
      tariffsRepository: sl(),
      saloonStore: sl(),
    )..init(),
  );

  sl.registerLazySingleton<BalanceSaloonStore>(
    () => BalanceSaloonStore(
      saloonBalanceRepository: sl(),
      saloonStore: sl(),
    )..init(),
  );
  sl.registerLazySingleton<StockSaloonStore>(
    () => StockSaloonStore(
      saloonStore: sl(),
      stockRepository: sl(),
    )..init(),
  );
  sl.registerLazySingleton<CommentsSaloonStore>(
    () => CommentsSaloonStore(
      saloonStore: sl(),
      commentRepository: sl(),
    )..init(),
  );
}

Future<void> _setupDependenciesControllerSaloon() async {
  sl.registerFactory<AuthSaloonController>(
    () => AuthSaloonController(
      localDataRepository: sl(),
      authSaloonStore: sl(),
    ),
  );
  sl.registerFactory<PasswordRecoveryController>(
    () => PasswordRecoveryController(
      authSaloonStore: sl(),
    ),
  );
  sl.registerFactory<RegistrationSaloonController>(
    () => RegistrationSaloonController(
      authSaloonStore: sl(),
      servicesAppStore: sl(),
    ),
  );
  sl.registerFactory<CreateMasterController>(
    () => CreateMasterController(
      masterSaloonStore: sl(),
    ),
  );
  sl.registerFactoryParam<EditMasterController, SaloonMaster, void>(
    (master, _) => EditMasterController(
      saloonMaster: master,
      masterSaloonStore: sl(),
    )..init(),
  );
  sl.registerFactoryParam<WindowDetailController, Window, void>(
    (window, _) => WindowDetailController(
      windowSaloonStore: sl(),
      window: window,
      urlLauncherRepository: sl(),
    ),
  );
  sl.registerFactoryParam<BookingWindowQrController, Window, void>(
    (window, _) => BookingWindowQrController(
      window: window,
      windowSaloonStore: sl(),
    )..init(),
  );
  sl.registerFactory<AddServiceSaloonController>(
    () => AddServiceSaloonController(
      servicesAppStore: sl(),
      saloonStore: sl(),
    ),
  );
  sl.registerFactory<AddServiceToWindowController>(
    () => AddServiceToWindowController(
      saloonStore: sl(),
      masterSaloonStore: sl(),
    )..init(),
  );
  sl.registerFactoryParam<EditServiceToWindowController, List<WindowService>,
      void>(
    (list, _) => EditServiceToWindowController(
      saloonStore: sl(),
      masterSaloonStore: sl(),
      editWindowService: list,
    )..init(),
  );
  sl.registerFactoryParam<EditServiceController, ServiceType, void>(
    (serviceTypeEdit, _) => EditServiceController(
      serviceTypeEdit: serviceTypeEdit,
      servicesAppStore: sl(),
      saloonStore: sl(),
    ),
  );
  sl.registerFactoryParam<AddServiceMasterController, List<SaloonMasterService>,
      void>(
    (saloonMasterServices, _) => AddServiceMasterController(
      saloonStore: sl(),
      saloonMasterServicesList: saloonMasterServices,
    ),
  );
  sl.registerFactory<EditWorkSheduleController>(
    () => EditWorkSheduleController(
      sheduleSaloonStore: sl(),
    )..init(),
  );
  sl.registerFactory<EditSocialNetworkController>(
    () => EditSocialNetworkController(
      socialNetworksSaloonStore: sl(),
    )..init(),
  );
  sl.registerFactory<CreateWindowController>(
    () => CreateWindowController(
      windowSaloonStore: sl(),
      selectDayTimeController: sl(),
      selectWindowServiceController: sl(),
    ),
  );
  sl.registerFactoryParam<EditWindowController, Window, void>(
    (window, param2) => EditWindowController(
      windowSaloonStore: sl(),
      window: window,
      selectDayTimeController: sl(),
      selectWindowServiceController: sl(),
    )..init(),
  );
  sl.registerFactory<SelectWindowServiceController>(
    () => SelectWindowServiceController(),
  );
  sl.registerFactory<SelectDayTimeWindowController>(
    () => SelectDayTimeWindowController()..init(),
  );

  sl.registerFactory<HistoryStatSaloonController>(
    () => HistoryStatSaloonController(
      historyStatisticsSaloonStore: sl(),
    )..init(),
  );
  sl.registerFactoryParam<EditStockController, Stock, void>(
    (stock, _) => EditStockController(
      stockSaloonStore: sl(),
      stock: stock,
    )..init(),
  );
  sl.registerLazySingleton<FiltersHistoryStatController>(
    () => FiltersHistoryStatController(
      historyStatisticsSaloonStore: sl(),
    )..init(),
  );
  sl.registerLazySingleton<HelpTipSaloonController>(
    () => HelpTipSaloonController(
      appStore: sl(),
    ),
  );
  sl.registerLazySingleton<IntroSaloonController>(
    () => IntroSaloonController(
      localDataRepository: sl(),
      appStore: sl(),
    ),
  );
  sl.registerLazySingleton<PrimarySettingsSaloonController>(
    () => PrimarySettingsSaloonController(
      localDataRepository: sl(),
      saloonStore: sl(),
      photoSaloonStore: sl(),
      sheduleSaloonStore: sl(),
      masterSaloonStore: sl(),
      addressesAppStore: sl(),
      socialNetworksSaloonStore: sl(),
    ),
  );
  sl.registerLazySingleton<ProfileSaloonController>(
    () => ProfileSaloonController(
      saloonStore: sl(),
      masterSaloonStore: sl(),
      photoSaloonStore: sl(),
      stockSaloonStore: sl(),
      commentsSaloonStore: sl(),
    ),
  );
  sl.registerLazySingleton<MastersSaloonController>(
    () => MastersSaloonController(
      masterSaloonStore: sl(),
    ),
  );
  sl.registerLazySingleton<BasicDataSaloonController>(
    () => BasicDataSaloonController(
      sheduleSaloonStore: sl(),
      photoSaloonStore: sl(),
      saloonStore: sl(),
      addressesAppStore: sl(),
      socialNetworksSaloonStore: sl(),
    ),
  );
  sl.registerLazySingleton<ServicesSaloonController>(
    () => ServicesSaloonController(
      saloonStore: sl(),
      servicesAppStore: sl(),
    ),
  );
  sl.registerLazySingleton<SettingsSaloonController>(
    () => SettingsSaloonController(
      authSaloonStore: sl(),
      tariffsSaloonStore: sl(),
    ),
  );

  sl.registerLazySingleton<DocumentsSaloonController>(
    () => DocumentsSaloonController(
      documentsSaloonStore: sl(),
    ),
  );

  sl.registerLazySingleton<HomeSaloonController>(
    () => HomeSaloonController(
      windowSaloonStore: sl(),
    ),
  );

  sl.registerLazySingleton<ScanningQrSaloonController>(
    () => ScanningQrSaloonController(
      windowSaloonStore: sl(),
    ),
  );
  sl.registerLazySingleton<PremiumConnectController>(
    () => PremiumConnectController(
      tariffsSaloonStore: sl(),
    )..init(),
  );

  sl.registerLazySingleton<BalanceTopUpController>(
    () => BalanceTopUpController(
      balanceSaloonStore: sl(),
    )..init(),
  );
  sl.registerLazySingleton<HistoryBalanceController>(
    () => HistoryBalanceController(
      balanceSaloonStore: sl(),
    )..init(),
  );
  sl.registerLazySingleton<StocksSaloonController>(
    () => StocksSaloonController(
      stockSaloonStore: sl(),
    ),
  );
  sl.registerLazySingleton<CreateStockController>(
    () => CreateStockController(
      stockSalonStore: sl(),
    ),
  );
  sl.registerLazySingleton<CommentsCustomerSaloonController>(
    () => CommentsCustomerSaloonController(
      commentsSaloonStore: sl(),
    ),
  );
}
