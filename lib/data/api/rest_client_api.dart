import 'dart:io';

import 'package:dio/dio.dart';
import 'package:okoshki/data/api/endpoints.dart';
import 'package:okoshki/data/api/requests/change_number_confirm_code/change_number_confirm_code.dart';
import 'package:okoshki/data/api/requests/change_password/change_password.dart';
import 'package:okoshki/data/api/requests/create_address/create_address.dart';
import 'package:okoshki/data/api/requests/create_comment/create_comment.dart';
import 'package:okoshki/data/api/requests/create_saloon_master_service/create_saloon_master_service.dart';
import 'package:okoshki/data/api/requests/update_comment/update_comment.dart';
import 'package:okoshki/data/api/requests/update_saloon_master_service/update_saloon_master_service.dart';
import 'package:okoshki/data/api/requests/update_saloon_profile/update_saloon_profile.dart';
import 'package:okoshki/data/api/requests/update_saloon_schedule/update_saloon_schedule.dart';
import 'package:okoshki/data/api/requests/update_social_network/update_social_network.dart';
import 'package:okoshki/data/api/requests/update_user_profile/update_user_profile.dart';
import 'package:okoshki/data/api/requests/get_sms_code/get_sms_code.dart';
import 'package:okoshki/data/api/requests/get_token/get_token.dart';
import 'package:okoshki/data/api/requests/request_register/request_register.dart';
import 'package:okoshki/data/models/address/address.dart';
import 'package:okoshki/data/models/app_document/app_document.dart';
import 'package:okoshki/data/models/app_setting/app_setting.dart';
import 'package:okoshki/data/models/booking/booking.dart';
import 'package:okoshki/data/models/city/city.dart';
import 'package:okoshki/data/models/client_blocking/client_blocking.dart';
import 'package:okoshki/data/models/comment/comment.dart';
import 'package:okoshki/data/models/help_tip/help_tip.dart';
import 'package:okoshki/data/models/house_number/house_number.dart';
import 'package:okoshki/data/models/intro_slide/intro_slide.dart';
import 'package:okoshki/data/models/premium/premium.dart';
import 'package:okoshki/data/models/premium_tariff/premium_tariff.dart';
import 'package:okoshki/data/models/saloon/saloon.dart';
import 'package:okoshki/data/models/saloon_balance/saloon_balance.dart';
import 'package:okoshki/data/models/saloon_detail/saloon_detail.dart';
import 'package:okoshki/data/models/saloon_document/saloon_document.dart';
import 'package:okoshki/data/models/saloon_list_page/saloon_list_page.dart';
import 'package:okoshki/data/models/saloon_master/saloon_master.dart';
import 'package:okoshki/data/models/saloon_master_service/saloon_master_service.dart';
import 'package:okoshki/data/models/saloon_photo/saloon_photo.dart';
import 'package:okoshki/data/models/saloon_schedule/saloon_schedule.dart';
import 'package:okoshki/data/models/saloon_statistics/saloon_statistics.dart';
import 'package:okoshki/data/models/search_item/search_item.dart';
import 'package:okoshki/data/models/service/service.dart';
import 'package:okoshki/data/models/service_type/service_type.dart';
import 'package:okoshki/data/models/social_network/social_network.dart';
import 'package:okoshki/data/models/stock/stock.dart';
import 'package:okoshki/data/models/street/street.dart';
import 'package:okoshki/data/models/user_profile/user_profile.dart';
import 'package:okoshki/data/models/window/window.dart';
import 'package:okoshki/data/models/window_service/window_service.dart';
import 'package:okoshki/internal/constants/base_url.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class RestClientApi {
  factory RestClientApi(Dio dio, {String baseUrl}) = _RestClientApi;

  @GET('${EndPoints.checkToken}{token}/')
  Future<HttpResponse> checkToken(
    @Path() String token,
  );

  @POST(EndPoints.getSmsCode)
  Future<HttpResponse> getSmsCode(
    @Body() GetSmsCodeBody body,
  );

  @POST(EndPoints.authorize)
  Future<HttpResponse> confirmCode(
    @Body() GetTokenBody body,
  );

  @POST(EndPoints.requestRegisterSaloon)
  Future<HttpResponse> requestRegisterSaloon(
    @Body() RequestRegisterBody body,
  );

  @POST(EndPoints.changePassword)
  Future<HttpResponse> changePassword(
    @Body() ChangePasswordBody body,
  );

  @POST(EndPoints.logout)
  Future<HttpResponse> logout();

  @POST(EndPoints.changeNumberGetSmsCode)
  Future<HttpResponse> changeNumberGetSmsCode(
    @Body() GetSmsCodeBody body,
  );

  @POST(EndPoints.changeNumberGetSmsCode)
  Future<HttpResponse> changeNumberConfirmCode(
    @Body() ChangeNumberConfirmCodeBody body,
  );

  @GET(EndPoints.getUserProfile)
  Future<HttpResponse<UserProfileModel>> getUserProfile();

  @DELETE(EndPoints.deleteUserProfile)
  Future<HttpResponse> deleteUserProfile();

  @PUT(EndPoints.updateUserProfile)
  Future<HttpResponse<UserProfileModel>> updateUserProfile(
    @Body() UpdateUserProfileBody body,
  );

  @GET(EndPoints.getCities)
  Future<HttpResponse<List<CityModel>>> getCities();

  @GET(EndPoints.getAddresses)
  Future<HttpResponse<List<AddressModel>>> getAddresses(
    @Queries() Map<String, dynamic> queries,
  );

  @POST(EndPoints.createAddress)
  Future<HttpResponse<AddressModel>> createAddress(
    @Body() CreateAddressBody body,
  );

  @GET(EndPoints.searchStreet)
  Future<HttpResponse<List<StreetModel>>> searchStreet(
    @Queries() Map<String, dynamic> queries,
  );

  @GET(EndPoints.searchHouseNumber)
  Future<HttpResponse<List<HouseNumberModel>>> searchHouseNumber(
    @Queries() Map<String, dynamic> queries,
  );

  @GET(EndPoints.searchSaloon)
  Future<HttpResponse<List<SearchItemModel>>> searchSaloon(
    @Query('search') String search,
  );

  @GET(EndPoints.getFavoriteSaloons)
  Future<HttpResponse<List<SaloonModel>>> getFavoriteSaloons();

  @GET(EndPoints.getSaloonList)
  Future<HttpResponse<SaloonListPageModel>> getSaloonList(
    @Queries() Map<String, dynamic> queries,
  );

  @GET('${EndPoints.getSaloonDetail}{saloonId}/')
  Future<HttpResponse<SaloonDetailModel>> getSaloonDetail({
    @Path() required int saloonId,
    @Query('point') String? point,
  });

  @GET('${EndPoints.getClientBlocking}{saloonId}/')
  Future<HttpResponse<ClientBlockingModel>> getClientBlocking({
    @Path() required int saloonId,
  });

  @PUT('${EndPoints.updateSaloonData}{saloonId}/')
  Future<HttpResponse<SaloonDetailModel>> updateSaloonData({
    @Path() required int saloonId,
    @Body() UpdateSaloonProfileBody? body,
  });

  @PUT('${EndPoints.updateSaloonData}{saloonId}/')
  Future<HttpResponse<SaloonDetailModel>> updateSaloonLogo({
    @Path() required int saloonId,
    @Part() File? logo,
  });

  @PUT(
      '${EndPoints.deleteSaloonLogo_part1}{saloonId}/${EndPoints.deleteSaloonLogo_part2}')
  Future<HttpResponse<SaloonDetailModel>> deleteLogo(
    @Path() int saloonId,
  );

  @GET(EndPoints.getServicesTypes)
  Future<HttpResponse<List<ServiceTypeModel>>> getServicesTypes();

  @GET(EndPoints.getServicesList)
  Future<HttpResponse<List<ServiceModel>>> getServicesList(
    @Queries() Map<String, dynamic> queries,
  );

  @GET(EndPoints.getSocialNetworkList)
  Future<HttpResponse<List<SocialNetworkModel>>> getSocialNetworkList(
    @Query('salon') int salonId,
  );

  @PUT('${EndPoints.updateSocialNetwork}{socialId}/')
  Future<HttpResponse<SocialNetworkModel>> updateSocialNetwork({
    @Path() required int socialId,
    @Body() required UpdateSocialNetworkBody body,
  });

  @POST(EndPoints.createSaloonPhoto)
  Future<HttpResponse<SaloonPhotoModel>> createSaloonPhoto({
    @Part() int? salon,
    @Part() File? image,
  });

  @GET(EndPoints.getSaloonPhotoList)
  Future<HttpResponse<List<SaloonPhotoModel>>> getSaloonPhotoList(
    @Query('salon') int? salon,
  );

  @DELETE('${EndPoints.deleteSaloonPhoto}{photoId}/')
  Future<HttpResponse> deleteSaloonPhoto(
    @Path() int photoId,
  );

  //saloon balance
  @GET(EndPoints.getSaloonBalanceList)
  Future<HttpResponse<List<SaloonBalanceModel>>> getSaloonBalanceList({
    @Query('salon') required int saloonId,
    @Query('from') String? from,
    @Query('to') String? to,
  });

  @GET('${EndPoints.getSaloonPaymentPdf}{saloonId}/')
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> getSaloonPaymentPdf({
    @Path() required int saloonId,
    @Query('sum')required String sum,
    
  });

  //
  @GET(EndPoints.getSaloonMasterList)
  Future<HttpResponse<List<SaloonMasterModel>>> getSaloonMasterList(
    @Query('salon') int? salonId,
  );

  @POST(EndPoints.createSaloonMaster)
  Future<HttpResponse<SaloonMasterModel>> createSaloonMaster({
    @Part() required int salon,
    @Part() required String first_name,
    @Part() String? specialization,
    @Part() File? avatar, // no body class because of File part
  });

  @GET('${EndPoints.getSaloonMaster}{masterId}')
  Future<HttpResponse<SaloonMasterModel>> getSaloonMaster(
    @Path() int masterId,
  );

  @PUT('${EndPoints.updateSaloonMaster}{masterId}/')
  Future<HttpResponse<SaloonMasterModel>> updateSaloonMaster({
    @Path() required int masterId,
    @Part() required int salon,
    @Part() String? first_name,
    @Part() String? specialization,
    @Part() File? avatar, // no body class because of File part
  });

  @DELETE('${EndPoints.deleteSaloonMaster}{masterId}/')
  Future<HttpResponse> deleteSaloonMaster(
    @Path() int masterId,
  );

  @PUT(
      '${EndPoints.deleteSaloonMasterAvatar_part1}{masterId}/${EndPoints.deleteSaloonMasterAvatar_part2}')
  Future<HttpResponse> deleteSaloonMasterAvatar(
    @Path() int masterId,
  );

  @GET(EndPoints.getSaloonMasterServiceList)
  Future<HttpResponse<List<SaloonMasterServiceModel>>>
      getSaloonMasterServiceList(
    @Query('master') int masterId,
  );

  @POST(EndPoints.createSaloonMasterService)
  Future<HttpResponse<SaloonMasterServiceModel>> createSaloonMasterService(
    @Body() CreateSaloonMasterServiceBody body,
  );

  @PUT('${EndPoints.updateSaloonMasterService}{masterServiceId}/')
  Future<HttpResponse<SaloonMasterServiceModel>> updateSaloonMasterService({
    @Path() required int masterServiceId,
    @Body() required UpdateSaloonMasterServiceBody body,
  });

  @DELETE('${EndPoints.deleteSaloonMasterService}{masterServiceId}/')
  Future<HttpResponse> deleteSaloonMasterService(
    @Path() int masterServiceId,
  );

  @GET('${EndPoints.getSaloonScheduleList}{saloonId}')
  Future<HttpResponse<List<SaloonScheduleModel>>> getSaloonScheduleList(
    @Path() int saloonId,
  );

  @PUT('${EndPoints.updateSaloonSchedule}{sheduleId}/')
  Future<HttpResponse<SaloonScheduleModel>> updateSaloonSchedule(
    @Path() int sheduleId,
    @Body() UpdateSaloonScheduleBody body,
  );
  //app
  @GET(EndPoints.getHelpTipList)
  Future<HttpResponse<List<HelpTipModel>>> getHelpTipList(
    @Query('type') String type,
  );

  @GET(EndPoints.getIntroSlideList)
  Future<HttpResponse<List<IntroSlideModel>>> getIntroSlideList(
    @Query('type') String type,
  );

  @GET(EndPoints.getAppDocumentList)
  Future<HttpResponse<List<AppDocumentModel>>> getAppDocumentList(
    @Query('type') String type,
  );

  @GET(EndPoints.getAppSetting)
  Future<HttpResponse<AppSettingModel>> getAppSetting();

  @POST(EndPoints.createSaloonDocument)
  Future<HttpResponse<SaloonDocumentModel>> createSaloonDocument({
    @Part(name: 'salon') required int saloonId,
    @Part() required String title,
    @Part() String? description,
    @Part(name: 'document_file') File? document,
  });

  @GET(EndPoints.getSaloonDocumentList)
  Future<HttpResponse<List<SaloonDocumentModel>>> getSaloonDocumentList(
    @Query('salon') int saloonId,
  );

  @PUT('${EndPoints.updateSaloonDocument}{documentId}/')
  Future<HttpResponse<SaloonDocumentModel>> updateSaloonDocument({
    @Path() required int documentId,
    @Part() String? title,
    @Part() String? description,
    @Part(name: 'document_file') File? document,
  });

  @DELETE('${EndPoints.deleteSaloonDocument}{documentId}/')
  Future<HttpResponse> deleteSaloonDocument(
    @Path() int documentId,
  );

  //stocks
  @GET(EndPoints.getStockList)
  Future<HttpResponse<List<StockModel>>> getStockList({
    @Query('salons') required int saloonId,
  });

  @POST(EndPoints.createStock)
  Future<HttpResponse<StockModel>> createStock({
    @Part(name: 'salon') required int saloonId,
    @Part() required String title,
    @Part() required String duration,
    @Part() String? description,
    @Part() File? logo,
  });

  @PUT('${EndPoints.updateStock}{stockId}/')
  Future<HttpResponse<StockModel>> updateStock({
    @Path() required int stockId,
    @Part() String? title,
    @Part() String? duration,
    @Part() String? description,
    @Part() File? logo,
  });

  @PUT('${EndPoints.updateStock}{stockId}/')
  Future<HttpResponse<StockModel>> deleteLogoStock({
    @Path() required int stockId,
    @Part() String logo = '',
  });

  @DELETE('${EndPoints.deleteStock}{stockId}/')
  Future<HttpResponse> deleteStock({
    @Path() required int stockId,
  });

  //Comments
  @GET(EndPoints.getCommentList)
  Future<HttpResponse<List<CommentModel>>> getCommentList({
    @Query('client') int? clientId,
    @Query('salon') int? salonId,
  });

  @POST(EndPoints.createComment)
  Future<HttpResponse<CommentModel>> createComment(
    @Body() CreateCommentBody body,
  );

  @PUT('${EndPoints.updateComment}{commentId}/')
  Future<HttpResponse<CommentModel>> updateComment({
    @Path() required int commentId,
    @Body() required UpdateCommentBody body,
  });

  @DELETE('${EndPoints.deleteComment}{commentId}/')
  Future<HttpResponse> deleteComment(
    @Path() int commentId,
  );

  //statistics
  @GET('${EndPoints.getSaloonStatistics}{saloonId}/')
  Future<HttpResponse<SaloonStatisticsModel>> getSaloonStatistics({
    @Path() required int saloonId,
    @Query('from_dt') String? from,
    @Query('to_dt') String? to,
  });

  @GET(
      '${EndPoints.getSaloonStatisticsPdfPart1}{saloonId}${EndPoints.getSaloonStatisticsPdfPart2}')
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> getSaloonStatisticsPDF({
    @Path() required int saloonId,
    @Query('from_dt') String? from,
    @Query('to_dt') String? to,
  });

  //window
  @GET(EndPoints.getWindowList)
  Future<HttpResponse<List<WindowModel>>> getWindowList(
    @Queries() Map<String, dynamic> queries,
  );

  @GET('${EndPoints.getWindowDetail}{windowId}/')
  Future<HttpResponse<WindowModel>> getWindowDetail({
    @Path() required int windowId,
  });

  @POST(EndPoints.createWindow)
  Future<HttpResponse<WindowModel>> createWindow({
    @Part() required int salon,
    @Part(name: 'start_dt') required String startDt,
    @Part(name: 'end_dt') required String endDt,
    @Part() required String services,
  });

  @DELETE('${EndPoints.deleteWindow}{windowId}/')
  Future<HttpResponse> deleteWindow(
    @Path() int windowId,
  );

  @PUT('${EndPoints.updateWindow}{windowId}/')
  Future<HttpResponse<WindowModel>> updateWindow({
    @Path() required int windowId,
    @Part(name: 'start_dt') String? startDt,
    @Part(name: 'end_dt') String? endDt,
    @Part(name: 'update_services') String? updateServices,
    @Part() String? status,
  });

  //window service
  @GET('${EndPoints.getWindowServiceDetail}{windowServiceId}/')
  Future<HttpResponse<WindowServiceModel>> getWindowServiceDetail({
    @Path() required int windowServiceId,
  });

  @POST(EndPoints.createWindowService)
  Future<HttpResponse<WindowServiceModel>> createWindowService({
    @Part(name: 'window') required int windowId,
    @Part(name: 'master') required int masterId,
    @Part(name: 'service') required int serviceId,
    @Part() required double price,
  });

  @PUT('${EndPoints.updateWindowService}{windowServiceId}/')
  Future<HttpResponse<WindowServiceModel>> updateWindowService({
    @Path() required int windowServiceId,
    @Part(name: 'master') int? masterId,
    @Part() double? price,
  });

  @DELETE('${EndPoints.deleteWindowService}{windowServiceId}/')
  Future<HttpResponse> deleteWindowService({
    @Path() required int windowServiceId,
  });

  //booking
  @GET(EndPoints.getBookingList)
  Future<HttpResponse<List<BookingModel>>> getBookingList(
    @Queries() Map<String, dynamic> queries,
  );

  @POST(EndPoints.createBooking)
  Future<HttpResponse<BookingModel>> createBooking({
    @Part(name: 'window') required int windowId,
    @Part(name: 'service') required int windowServiceId,
  });

  @PUT('${EndPoints.updateBookingStatus}{bookingId}/')
  Future<HttpResponse<BookingModel>> updateBookingStatus({
    @Path() required int bookingId,
    @Part() required String status,
  });

  @PUT('${EndPoints.updateBookingQr}{bookingUid}/')
  Future<HttpResponse<WindowModel>> updateBookingQr({
    @Path() required String bookingUid,
  });

  //tariffs
  @GET(EndPoints.getPremiumTariffsList)
  Future<HttpResponse<List<PremiumTariffModel>>> getPremiumTariffsList();

  @POST(EndPoints.createSaloonPremiumTariff)
  Future<HttpResponse<PremiumModel>> createSaloonPremiumTariff({
    @Part(name: 'salon') required int saloonId,
    @Part(name: 'tariff') required int premiumTariffId,
  });

  @GET(EndPoints.getSaloonPremiumTariffsList)
  Future<HttpResponse<List<PremiumModel>>> getSaloonPremiumTariffsList({
    @Query('salon') required int saloonId,
  });
}
