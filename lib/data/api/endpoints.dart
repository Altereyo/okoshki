class EndPoints {
  static const withoutToken = [
    EndPoints.checkToken,
    EndPoints.getSmsCode,
    EndPoints.authorize,
    EndPoints.requestRegisterSaloon,
    EndPoints.changePassword,
  ];

  //auth
  static const String checkToken = 'auth/check_token/';
  static const String getSmsCode = 'auth/auth_code/create/';
  static const String authorize = 'auth/token/login/';
  static const String requestRegisterSaloon = 'auth/registration/request/';
  static const String changePassword = 'auth/change/password/request/';
  static const String logout = 'auth/token/logout/';

  //user
  static const String getUserProfile = 'v1/users/user/profile/';
  static const String updateUserProfile = 'v1/users/user/profile/';
  static const String deleteUserProfile = 'v1/users/user/profile/';
  static const String changeNumberGetSmsCode = 'v1/users/user/change_request/phone_number/';
  static const String changeNumberConfirmCode = 'v1/users/user/change/phone_number/';

  //geo
  static const String getCities = 'v1/addresses/city/list/';
  static const String getAddresses = 'v1/addresses/address/list/';
  static const String createAddress = 'v1/addresses/address/create/';
  static const String searchStreet = 'v1/addresses/street/list/'; // + ?city=Москва&street=бат as cityTitle and as streetInput
  static const String searchHouseNumber = 'v1/addresses/house_number/list/'; // + ?city=Москва&street=бат as cityTitle and as streetInput

  // search saloon
  static const String searchSaloon = 'v1/salons/search/autocomplete';

  //favorite saloons
  static const String getFavoriteSaloons = 'v1/salons/salon/favorite/';

  //saloon
  static const String getSaloonList = 'v1/salons/salon/list/';
  static const String getSaloonDetail = 'v1/salons/salon/'; // + 6/ as saloonId
  static const String updateSaloonData = 'v1/salons/salon/'; // + 6/ as saloonId
  static const String getClientBlocking = 'v1/salons/client_blocking/'; // + saloonId

  //saloon services
  static const String getServicesTypes = 'v1/services/servicetype/list/';
  static const String getServicesList = 'v1/services/service/list/';

  //saloon socials
  static const String getSocialNetworkList = 'v1/salons/salon/social_network/list/'; // + ?salon=3 as saloonId
  static const String updateSocialNetwork = 'v1/salons/salon/social_network/'; // + 1/ as socialId

  //saloon photo
  static const String deleteSaloonLogo_part1 = 'v1/salons/salon/';
  static const String deleteSaloonLogo_part2 = 'remove_logo/';
  static const String getSaloonPhotoList = 'v1/salons/salon/photo/list/'; // + ?salon=3 as saloonId
  static const String createSaloonPhoto = 'v1/salons/salon/photo/';
  static const String deleteSaloonPhoto = 'v1/salons/salon/photo/'; // + 1/ as photoId

  //saloon master services
  static const String getSaloonMasterServiceList = 'v1/services/master_service/list'; // + ?master=47 as masterId
  static const String createSaloonMasterService = 'v1/services/master_service/create/';
  static const String updateSaloonMasterService = 'v1/services/master_service/'; // + 2/ as masterServiceId
  static const String deleteSaloonMasterService = 'v1/services/master_service/'; // + 2/ as masterServiceId

  //saloon masters
  static const String getSaloonMasterList = 'v1/salons/master/list/';
  static const String createSaloonMaster = 'v1/salons/master/create/';
  static const String getSaloonMaster = 'v1/salons/master/'; // + 2/ as masterId
  static const String updateSaloonMaster = 'v1/salons/master/'; // + 2/ as masterId
  static const String deleteSaloonMaster = 'v1/salons/master/'; // + 2/ as masterId
  static const String deleteSaloonMasterAvatar_part1 = 'v1/salons/master/'; // + 2/ as masterId
  static const String deleteSaloonMasterAvatar_part2 = 'remove_avatar/';

  //saloon work day shedule
  static const String getSaloonScheduleList = 'v1/salons/work_days/'; // + 6/ as saloonId
  static const String updateSaloonSchedule = 'v1/salons/work_day/'; // + 8/ as sheduleId

  //saloon balance
  static const String getSaloonPaymentPdf = 'v1/office/payment_request/'; // + 3/?sum=100
  static const String getSaloonBalanceList = 'v1/salons/balance_management/list/'; // + ?salon=3&from=2023-12-14&to=2024-02-16
  // static const String getSaloonBalanceDetail = 'v1/salons/balance_management/'; // + 9/ as balanceManagementId

  //saloon documents
  static const String createSaloonDocument = 'v1/salons/salon/documents/';
  static const String getSaloonDocumentList = 'v1/salons/salon/documents/list/'; // + ?salon=6 as saloonId
  static const String updateSaloonDocument = 'v1/salons/salon/document/'; // + 4/ as documentId
  static const String deleteSaloonDocument = 'v1/salons/salon/document/'; // + 4/ as documentId

  //app api
  static const String getHelpTipList = 'v1/app/help_tips/list/'; // + ?type=c/s as Customer or Saloon
  static const String getIntroSlideList = 'v1/app/learn_slide/list/'; // + ?type=c/s as Customer or Saloon
  static const String getAppDocumentList = 'v1/app/documents/';
  static const String getAppSetting = 'v1/app/settings/';

  //windows
  static const String getWindowList = 'v1/bookings/window/list/'; // + ?salon=3&from=2023-11-8&status=DONE as saloonId, date, status enum
  static const String createWindow = 'v1/bookings/window/create/';
  static const String updateWindow = 'v1/bookings/window/'; // + 2/ as windowId //
  static const String getWindowDetail = 'v1/bookings/window/'; // + 2/ as windowId
  static const String deleteWindow = 'v1/bookings/window/'; //as windowId

  //window service
  static const String getWindowServiceDetail = 'v1/bookings/window/service/'; //+ windowServiceId
  static const String createWindowService = 'v1/bookings/window/service/create/'; 
  static const String updateWindowService = 'v1/bookings/window/service/'; //+ windowServiceId
  static const String deleteWindowService = 'v1/bookings/window/service/'; // + windowServiceId

  //bookings
  static const String getBookingList = 'v1/bookings/booking/list/'; 
  static const String createBooking = 'v1/bookings/booking/create/';
  static const String updateBookingStatus = 'v1/bookings/booking/'; // + 2/ as bookingId
  static const String updateBookingQr = 'v1/bookings/apply_qr/'; // + bookingUid

  //tariffs
  static const String getPremiumTariffsList = 'v1/tariffs/premium_tariffs/list/';
  static const String createSaloonPremiumTariff = 'v1/tariffs/premium/salon/';
  static const String getSaloonPremiumTariffsList = 'v1/tariffs/premium_salon/list/'; // + ?salon=3 as saloonId
  //static const String getTariffsList = 'v1/tariffs/tariff/list/';
  //static const String getTariffDetail = 'v1/tariffs/tariff/'; // + 1/ as tariffId

  //statistics
  static const String getSaloonStatistics = 'v1/stats/salon/'; // + 6/?from_dt=2023-11-9&to_dt= as saloonId/dateFrom&dateTo
  static const String getSaloonStatisticsPdfPart1 = 'v1/stats/salon/'; // + 6/ as saloonId
  static const String getSaloonStatisticsPdfPart2 = '/pdf/';  // + ?from_dt=2023-11-9&to_dt= as dateFrom and dateTo

  //documents
  static const String getAppDocumentsList = 'v1/app/documents/';
  static const String getAppDocumentDetail = 'v1/app/documents/'; // + 1/ as documentId

   //comments
  static const String getCommentList = 'v1/office/salon_comment/list/';
  static const String createComment = 'v1/office/salon_comment/create/';
  static const String updateComment = 'v1/office/salon_comment/'; // + 3/ as commentId
  static const String deleteComment = 'v1/office/salon_comment/'; // + 3/ as commentId

  //stocks
  static const String getStockList = 'v1/office/stock/list/';
  static const String createStock = 'v1/office/stock/create/';
  static const String updateStock = 'v1/office/stock/'; // + 1/ as stockId
  static const String deleteStock = 'v1/office/stock/'; // + 1/ as stockId
}
