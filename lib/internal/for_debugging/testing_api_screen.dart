import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:okoshki/data/models/saloon_master_service/saloon_master_service.dart';
import 'package:okoshki/data/models/service/service.dart';
import 'package:okoshki/data/models/service_type/service_type.dart';
import 'package:okoshki/data/services/geolocation_service.dart';
import 'package:okoshki/data/services/permission_service.dart';
import 'package:okoshki/domain/entities/saloon_master.dart';
import 'package:okoshki/domain/entities/saloon_master_service.dart';
import 'package:okoshki/domain/entities/saloon_photo.dart';
import 'package:okoshki/domain/entities/saloon_schedule.dart';
import 'package:okoshki/domain/repository/api/address_repository.dart';
import 'package:okoshki/domain/repository/api/app_api_repository.dart';
import 'package:okoshki/domain/repository/api/auth_repository.dart';
import 'package:okoshki/domain/repository/api/comment_repository.dart';
import 'package:okoshki/domain/repository/services/local_data_repository.dart';
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
import 'package:okoshki/domain/repository/api/social_networks_repository.dart';
import 'package:okoshki/domain/repository/api/stock_repository.dart';
import 'package:okoshki/domain/repository/api/user_profile_repository.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/domain/entities/extensions/saloon_schedule.dart';
import 'package:okoshki/internal/for_debugging/test_api_store.dart';
import 'package:okoshki/internal/utils/logger.dart';
import 'package:okoshki/presentation/app/widgets/custom_button.dart';
import 'package:okoshki/presentation/saloon/widgets/add_logo.dart';
import 'package:okoshki/presentation/saloon/widgets/add_saloon_photo.dart';
import 'package:path_provider/path_provider.dart';

class TestingApiScreen extends StatelessWidget {
  TestingApiScreen({super.key});

  final testPng = 'assets/test.png';
  final test2Png = 'assets/test2.png';
  final mySalonId = 10;
  final phoneNumber = '89998887630';
  final email = 'r8.lebz@gmail.com';
  final passsword = '1234567890';
  final AddressRepository addressRepo = sl<AddressRepository>();
  final AppApiRepository appApiRepo = sl<AppApiRepository>();
  final AuthRepository authRepo = sl<AuthRepository>();
  final CommentRepository commentRepo = sl<CommentRepository>();
  final SaloonMasterRepository saloonMasterRepo =
      sl<SaloonMasterRepository>();
  final SaloonBalanceRepository balanceRepository =
      sl<SaloonBalanceRepository>();
  final SaloonDocumentsRepository saloonDocsRepo =
      sl<SaloonDocumentsRepository>();
  final SaloonMasterServiceRepository saloonMasterServiceRepo =
      sl<SaloonMasterServiceRepository>();
  final SaloonPhotoRepository saloonPhotoRepo =
      sl<SaloonPhotoRepository>();
  final SaloonRepository saloonRepo = sl<SaloonRepository>();
  final SaloonScheduleRepository saloonScheduleRepo =
      sl<SaloonScheduleRepository>();
  final SaloonStatisticsRepository saloonStatRepo =
      sl<SaloonStatisticsRepository>();
  final ServicesRepository servicesRepo = sl<ServicesRepository>();
  final SocialNetworkRepository socialNetworkRepo =
      sl<SocialNetworkRepository>();
  final UserProfileRepository userProfileRepo =
      sl<UserProfileRepository>();
  final StockRepository stockRepo = sl<StockRepository>();

  final GeolocationService geoService = sl<GeolocationService>();
  final permissionRepo = sl<PermissionRepository>();
  final localDataRepo = sl<LocalDataRepository>();

  Future<File> getFile(String assetPath) async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    File tempFile = File('$tempPath/${assetPath.split('/').last}');
    ByteData bd = await rootBundle.load(assetPath);
    await tempFile.writeAsBytes(bd.buffer.asUint8List(), flush: true);
    return tempFile;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 20),
            children: [
              // ...buttonsLoader(),

              ...permissionsApi(),
              // ...commentsApi(),
              // ...stockApi(),
              // ...saloonStatisticsApi(),
              // ...saloonDocsApi(),
              // ...appApi(),
              // ...socialNetworksApi(),
              // ...saloonBalanceApi(),
              // ...localDataApi(),
              // ...addressApi(),
              // ...scheduleApi(),
              // ...masterApi(),
              // ...masterServicesApi(),
              // ...logoPhotoApi(),
              // ...geoApi(),
              // ...authApi(),
              // ...customerApi(),
              // ...saloonApi(),
              // ...saloonListApi(),
            ],
          ),
        ),
      ),
    );
  }

  // region unnnecessary APIs
  List<Widget> geoApi() {
    return [
      const Text('Geo API'),
      ElevatedButton(
        child: const Text('1. init service'),
        onPressed: () async {
          await geoService.initService();
          print('aboba');
        },
      ),
      ElevatedButton(
        child: const Text('2. Get nearest city'),
        onPressed: () async {
          final cities = await addressRepo.getCities();
          final res = addressRepo.getNearestCity(cities.data!);
          logger.i(res);
        },
      ),
    ];
  }

  List<Widget> customerApi() {
    return [
      const Text('Customer API'),
      ElevatedButton(
        child: const Text('1. Get cities'),
        onPressed: () async {
          final res = await addressRepo.getCities();
          if (!res.success) {
            logger.e(res.message);
          }
          logger.i(res.data);
        },
      ),
      ElevatedButton(
        child: const Text('2. Get addresses'),
        onPressed: () async {
          final res = await addressRepo.getAddresses();
          if (!res.success) {
            logger.e(res.message);
          }
          logger.i(res.data?[0]);
        },
      ),
      ElevatedButton(
        child: const Text('3. Get user profile'),
        onPressed: () async {
          final res = await userProfileRepo.getUserProfile();
          if (!res.success) {
            logger.e(res.message);
          }
          logger.i(res.data.toString());
          logger.i('salonsOwner - ${res.data!.salonsOwner}');
        },
      ),
      ElevatedButton(
        child: const Text('4. Update user profile'),
        onPressed: () async {
          const firstName = 'firstname';
          const lastName = 'lastname';
          const username = 'username';
          final favoriteSalons = [1, 5];
          const targetCity = 2;
          final res = await userProfileRepo.updateUserProfile(
            firstName: firstName,
            lastName: lastName,
            username: username,
            favoriteSalons: favoriteSalons,
            targetCity: targetCity,
          );
          if (!res.success) {
            logger.e(res.message);
          }
          logger.i(res.data.toString());
        },
      ),
      ElevatedButton(
        child: const Text('5. DELETE user profile'),
        onPressed: () async {
          final res = await userProfileRepo.deleteUserProfile();
          if (!res.success) {
            logger.e(res.message);
          }
          logger.i(res.data.toString());
        },
      ),
    ];
  }

  List<Widget> saloonListApi() {
    return [
      ElevatedButton(
        child: const Text('1. Get all saloons'),
        onPressed: () async {
          final res = await saloonRepo.getSaloonList();
          if (!res.success) {
            logger.e(res.message);
          }
          res.data!.results.forEach((element) {
            logger.i(element.toString());
          });
        },
      ),
      ElevatedButton(
        child: const Text('2. Get saloon detail'),
        onPressed: () async {
          final res = await saloonRepo.getSaloonDetail(saloonId: 6);
          if (!res.success) {
            logger.e(res.message);
          }
          logger.i(res.data);
        },
      ),
      ElevatedButton(
        child: const Text('3. Search saloon'),
        onPressed: () async {
          final res = await saloonRepo.getSaloonList(search: 'gre');
          if (!res.success) {
            logger.e(res.message);
          }
          logger.i(res.data?.results[0]);
        },
      ),
    ];
  }

  List<Widget> authApi() {
    return [
      const Text('Auth API'),
      ElevatedButton(
        child: const Text('1. send SMS'),
        onPressed: () async {
          final res = await authRepo.getSmsCode(phoneNumber: phoneNumber);
          if (!res.success) {
            logger.e(res.message);
            logger.e(res.message);
          }
          logger.i(res.data);
        },
      ),
      ElevatedButton(
        child: const Text('2. authorize with 0000'),
        onPressed: () async {
          final res = await authRepo.authorizeCustomer(
            phoneNumber: phoneNumber,
            code: '0000',
          );
          if (!res.success) {
            logger.e(res.message);
          }
          logger.i(res.data);
        },
      ),
      ElevatedButton(
        child: const Text('3. authorize as saloon'),
        onPressed: () async {
          final res =
              await authRepo.authorizeSaloon(email: email, password: passsword);
          if (!res.success) {
            logger.e(res.message);
          }
        },
      ),
      ElevatedButton(
        child: const Text('4. logout'),
        onPressed: () async {
          final res = await authRepo.logout();
          if (!res.success) {
            logger.e(res.message);
          }
        },
      ),
    ];
  }

  List<Widget> saloonApi() {
    return [
      const Text('Saloon API'),
      ElevatedButton(
        child: const Text('1. Get services types'),
        onPressed: () async {
          final res = await servicesRepo.getServicesTypes();
          if (!res.success) {
            logger.e(res.message);
          }
          res.data!.forEach((serviceType) {
            logger.i('${serviceType.id}-${serviceType.title}');
          });
        },
      ),
      ElevatedButton(
        child: const Text('1.1 Get services'),
        onPressed: () async {
          final res = await servicesRepo.getServicesList(
            serviceTypeId: 1,
            saloonId: 6,
            masterId: 43,
            exclude: false,
          );
          if (!res.success) {
            logger.e(res.message);
          }
          res.data!.forEach((service) {
            logger.i(
                '${service.id}-${service.title}---${service.serviceType.id}-${service.serviceType.title}');
          });
        },
      ),
      ElevatedButton(
        child: const Text('2. Register saloon'),
        onPressed: () async {
          final res = await authRepo.requestRegisterSaloon(
              phoneNumber: '89998887760',
              email: 'example@mail.ru',
              salonTitle: 'Example saloon',
              servicesIds: [1, 2]);
          if (!res.success) {
            logger.e(res.message);
          }
          logger.i(res.data);
        },
      ),
      ElevatedButton(
        child: const Text('3. Get my saloon'),
        onPressed: () async {
          final res = await saloonRepo.getMySaloon();
          if (!res.success) {
            logger.e(res.message);
          }
          logger.i(res.data!.results[0]);
        },
      ),
      ElevatedButton(
        child: const Text('4. Get my saloon details'),
        onPressed: () async {
          final mySaloonId = (await saloonRepo.getMySaloon()).data!.results[0].id;
          final res = await saloonRepo.getSaloonDetail(saloonId: mySaloonId);
          print('SITE ---- ${res.data?.site}');
          if (!res.success) {
            logger.e(res.message);
          }
          logger.i(res.data);
        },
      ),
      ElevatedButton(
        child: const Text('5. Update my saloon'),
        onPressed: () async {
          final mySaloonId = (await saloonRepo.getMySaloon()).data!.results[0].id;
          final res = await sl
              .get<SaloonRepository>()
              .updateSaloonProfile(saloonId: mySaloonId, site: 'https://ya.ru');
          if (!res.success) {
            logger.e(res.message);
          }
          logger.i(res.data);
        },
      ),
      ElevatedButton(
        child: const Text('6. Update logo'),
        onPressed: () async {
          final mySaloonId = (await saloonRepo.getMySaloon()).data!.results[0].id;
          final File file = File('/sdcard/Download/logo.jpg');
          final res = await saloonPhotoRepo.createLogo(
            saloonId: mySaloonId,
            logo: file,
          );
          if (!res.success) {
            logger.e(res.message);
          }
          logger.i(res.data);
        },
      ),
      ElevatedButton(
        child: const Text('7. Search saloon'),
        onPressed: () async {
          final res = await saloonRepo.searchSaloon('нов');
          if (!res.success) {
            logger.e(res.message);
          }
          logger.i(res.data);
        },
      ),
    ];
  }

  List<Widget> scheduleApi() {
    return [
      Text('Schedules API'),
      ElevatedButton(
        child: Text('1. get schedules'),
        onPressed: () async {
          var res = await saloonScheduleRepo.getSaloonScheduleList(saloonId: 6);
          res.data!.forEach((element) {
            logger.i(
                'schedule ${element.id}: ${element.weekDay} --- ${element.startTime} ::: ${element.endTime}');
            // logger.i('weekend ${element.isWorkday}');
          });
        },
      ),
      ElevatedButton(
        child: Text('2. set Schedule'),
        onPressed: () async {
          var res = await saloonScheduleRepo.getSaloonScheduleList(saloonId: 6);
          var saloonScheduleBefore = res.data![3];
          logger.i('saloonScheduleBefore.id === ${saloonScheduleBefore.id}');
          logger.i(
              'saloonScheduleBefore.starttime === ${saloonScheduleBefore.startTime}');

          final res2 = await saloonScheduleRepo.updateSaloonSchedule(
              sheduleId: saloonScheduleBefore.id, weekend: false
              // startTime: saloonScheduleBefore.startDateTime,
              // endTime: saloonScheduleBefore.endDateTime,
              );
          var saloonScheduleAfter = res.data!.first;
          logger.i(
              'saloonScheduleAfter.starttime === ${saloonScheduleAfter.startTime}');
        },
      ),
      ElevatedButton(
        child: Text('3. update local Schedule'),
        onPressed: () async {
          var res = await saloonScheduleRepo.getSaloonScheduleList(saloonId: 6);
          var saloonSchedule0 = res.data!.first;
          logger.i(saloonSchedule0.startTime);
          logger.i(saloonSchedule0.startDateTime);
          logger.i('------');
          saloonSchedule0.startDateTime = DateTime.now();
          logger.i(saloonSchedule0.startTime);
          logger.i(saloonSchedule0.startDateTime);
        },
      ),
    ];
  }

  List<Widget> logoPhotoApi() {
    return [
      Text('Logo&Photo API'),
      Text('1. Add logo'),
      AddLogo(
        onCreateLogo: (File? value) async {
          final res = await saloonPhotoRepo.createLogo(
            saloonId: 6,
            logo: value!,
          );
          logger.i('added logo: ${res.data!.logo}');
        },
        onRemoveLogo: () async {
          final res = await saloonPhotoRepo.deleteLogo(
            saloonId: 6,
          );
          logger.i('deleted: ${res}');
          logger.i('deleted: ${res.data}');
        },
      ),
      ElevatedButton(
        child: Text('Check logo'),
        onPressed: () async {
          final res = await saloonRepo.getMySaloon();
          logger.i('Logo: ${res.data!.results.first.logo}');
        },
      ),
      Text('2. Add photo'),
      AddSaloonPhoto(
        saloonPhotosList: [],
        onCreatePhoto: (File value) {},
        onRemovePhoto: (SaloonPhoto value) {},
      ),
      ElevatedButton(
        child: Text('get photos'),
        onPressed: () async {
          final res = await saloonPhotoRepo.getPhotoList(saloonId: 6);
          res.data!.forEach((element) {
            logger.i('${element.id}: ${element.image}');
          });
        },
      ),
      ElevatedButton(
        child: Text('delete photo id 7'),
        onPressed: () async {
          final res = await saloonPhotoRepo.deleteSaloonPhoto(photoId: 7);
          logger.i(res.data);
        },
      ),
    ];
  }

  List<Widget> masterApi() {
    const master = SaloonMaster(
      id: 999999,
      salon: 6,
      name: 'Сан Саныч',
      specialization: 'Программист',
    );

    return [
      Text('Master API'),
      ElevatedButton(
        child: Text('1. get masters'),
        onPressed: () async {
          final res = await saloonMasterRepo.getMasterList();
          res.data!.forEach((element) {
            logger
                .i('${element.id}: ${element.name}, ${element.specialization}');
          });
        },
      ),
      ElevatedButton(
        child: Text('2. create master'),
        onPressed: () async {
          final res = await saloonMasterRepo.createMaster(
            salonId: 6,
            name: master.name,
            specialization: master.specialization,
          );
          logger.i(
              '${res.data!.id}: ${res.data!.name}, ${res.data!.specialization}');
        },
      ),
      ElevatedButton(
        child: Text('3. get master detail'),
        onPressed: () async {
          final res = await saloonMasterRepo.getSaloonMaster(masterId: 35);
          logger.i(
              '${res.data!.id}: ${res.data!.name}, ${res.data!.specialization}');
          res.data!.services?.forEach((element) {
            logger.i(
                'Услуга - id ${element.service.id}: ${element.service.title} (тип ${element.service.serviceType.title})');
          });
        },
      ),
      ElevatedButton(
        child: Text('4. update master'),
        onPressed: () async {
          final res = await saloonMasterRepo.updateSaloonMaster(
            masterId: 14,
            salonId: 6,
            specialization: 'Разработчик',
            name: 'Клим Саныч',
          );
          logger.i(
              '${res.data!.id}: ${res.data!.name}, ${res.data!.specialization}, ${res.data!.services}');
        },
      ),
      ElevatedButton(
        child: Text('5. delete master'),
        onPressed: () async {
          final res = await saloonMasterRepo.deleteSaloonMaster(masterId: 13);
          logger.i(res);
          logger.i(res.data);
          logger.i(res.success);
        },
      ),
      ElevatedButton(
        child: Text('6. delete master avatar'),
        onPressed: () async {
          final res =
              await saloonMasterRepo.deleteSaloonMasterAvatar(masterId: 48);
          logger.i(res);
          logger.i(res.data);
          logger.i(res.success);
        },
      ),
    ];
  }

  List<Widget> buttonsLoader() {
    final c = TestApiStore();
    return [
      Observer(builder: (_) {
        return Column(
          children: [
            CustomButton(
              title: 'large customer btn',
              onPressed: c.func,
              isLoading: c.isLoading,
              isSmall: false,
            ),
            Row(
              children: [
                CustomButton(
                  title: 'outlined btn',
                  onPressed: c.func,
                  isOutlined: true,
                  isSmall: true,
                ),
                Spacer(),
                CustomButton(
                  title: 'saloon btn',
                  onPressed: c.func,
                  isLoading: c.isLoading,
                  isSmall: true,
                  isSaloonColor: true,
                )
              ],
            ),
          ],
        );
      }),
    ];
  }

  List<Widget> addressApi() {
    return [
      ElevatedButton(
        child: Text('1. get addresses'),
        onPressed: () async {
          final res = await addressRepo.getAddresses();
          logger.i(res.data);
        },
      ),
      ElevatedButton(
        child: Text('2. search street'),
        onPressed: () async {
          final res = await addressRepo.searchStreet(
            cityName: 'Москва',
            streetInput: 'нов',
          );
          logger.i(res.data);
        },
      ),
      ElevatedButton(
        child: Text('3. search house number'),
        onPressed: () async {
          final res = await addressRepo.searchHouseNumber(
            cityName: 'Москва',
            streetTitle: 'Батайский проезд',
            houseNumber: '3',
          );
          logger.i(res.data);
        },
      ),
      ElevatedButton(
        child: Text('4. get cities'),
        onPressed: () async {
          final res = await addressRepo.getCities();
          logger.i(res.data);
        },
      ),
      ElevatedButton(
        child: Text('5. get nearest city'),
        onPressed: () async {
          final res1 = await addressRepo.getCities();
          final res2 = await addressRepo.getNearestCity(res1.data!);
          logger.i(res2.title);
        },
      ),
      ElevatedButton(
        child: Text('6. create address'),
        onPressed: () async {
          final res = await addressRepo.createAddress(
            cityId: 2,
            streetTitle: 'ул Батюнинская',
            houseNumber: '1',
            lat: 55.657499,
            lon: 37.708293,
          );
          logger.i(res.data);
        },
      ),
    ];
  }

  List<Widget> masterServicesApi() {
    final masterId = 43;
    return [
      ElevatedButton(
        child: Text('1. models test'),
        onPressed: () {
          // final test = SaloonMasterServiceModel(
          //   id: 1,
          //   isActive: false,
          //   master: 2,
          //   price: '800',
          //   service: ServiceModel(
          //     id: 9,
          //     title: 'service_title',
          //     serviceType: ServiceTypeModel(
          //       title: 'service_type_title',
          //       id: 8,
          //     ),
          //   ),
          // );
          // print(test.id);
          // print(test.isActive);
          // print(test.master);
          // print(test.price);
          // print(test.service);
          // print(test.service.title);
          // print(test.service.serviceType.title);
        },
      ),
      ElevatedButton(
        child: Text('2. get master services'),
        onPressed: () async {
          final res =
              await saloonMasterServiceRepo.getMasterServiceList(masterId);
          res.data!.forEach((el) {
            logger.i(el);
          });
        },
      ),
      ElevatedButton(
        child: Text('3. create master service'),
        onPressed: () async {
          final res = await saloonMasterServiceRepo.createMasterService(
            masterId: masterId,
            price: 1000.toString(),
            serviceId: 13,
            isActive: true,
          );
          logger.i(res.data);
        },
      ),
      ElevatedButton(
        child: Text('4. delete master service'),
        onPressed: () async {
          final res = await saloonMasterServiceRepo.deleteMasterService(9);
          logger.i(res.data);
          logger.i(res.success);
          logger.i(res.message);
          logger.i(res.message);
        },
      ),
      ElevatedButton(
        child: Text('5. update master service'),
        onPressed: () async {
          final res = await saloonMasterServiceRepo.updateMasterService(
            masterServiceId: 9,
            isActive: true,
            price: 2000.toString(),
          );
          logger.i(res.data);
        },
      ),
    ];
  }

  List<Widget> localDataApi() {
    return [
      ElevatedButton(
        child: Text('1. get token'),
        onPressed: () {
          final res = localDataRepo.getToken();
          logger.i(res);
        },
      ),
      ElevatedButton(
        child: Text('2. set token'),
        onPressed: () async {
          final res = await localDataRepo.setToken('asd');
          logger.i(res);
        },
      ),
    ];
  }

  List<Widget> socialNetworksApi() {
    return [
      ElevatedButton(
        child: Text('1. get socials'),
        onPressed: () async {
          final res = await socialNetworkRepo.getSocialNetworkList(mySalonId);
          res.data?.forEach((el) {
            logger.i(
                '${el.id}: ${el.title} - ${el.url} - ${el.isActive} - ${el.salon}');
          });
        },
      ),
      ElevatedButton(
        child: Text('2. update social'),
        onPressed: () async {
          final res = await socialNetworkRepo.updateSocialNetwork(
            socialId: 10,
            url: 'https://vk.com/asdasd//',
            isActive: false,
          );
          logger.i(
              '${res.data?.id}: ${res.data?.title} - ${res.data?.url} - ${res.data?.isActive} - ${res.data?.salon}');
        },
      ),
    ];
  }

  // List<Widget> saloonBalanceApi() {
  //   return [
  //     ElevatedButton(
  //       child: Text('1. get balance list'),
  //       onPressed: () async {
  //         final res = await balanceRepository.getSaloonBalanceList(mySalonId);
  //         res.data?.forEach((el) {
  //           logger.i(
  //               '${el?.id}: ${el?.amount} - ${el?.comment} - ${el?.transactionType} - ${el?.created}');
  //         });
  //       },
  //     ),
  //     ElevatedButton(
  //       child: Text('2. get balance detail'),
  //       onPressed: () async {
  //         final balanceId = 35;
  //         final res = await balanceRepository.getSaloonBalanceDetail(balanceId);
  //         logger.i(
  //             '${res.data?.id}: ${res.data?.creator} - ${res.data?.comment} - ${res.data?.transactionType} - ${res.data?.created}');
  //       },
  //     ),
  //   ];
  // }

  List<Widget> appApi() {
    return [
      ElevatedButton(
        child: Text('1. get help tips customer'),
        onPressed: () async {
          final res = await appApiRepo.getHelpTipList('c');
          res.data?.forEach((el) {
            logger.i(el);
          });
        },
      ),
      ElevatedButton(
        child: Text('2. get help tips saloon'),
        onPressed: () async {
          final res = await appApiRepo.getHelpTipList('s');
          res.data?.forEach((el) {
            logger.i(el);
          });
        },
      ),
      ElevatedButton(
        child: Text('3. get intro customer'),
        onPressed: () async {
          final res = await appApiRepo.getIntroSlideList('c');
          res.data?.forEach((el) {
            logger.i(el);
          });
        },
      ),
      ElevatedButton(
        child: Text('4. get intro saloon'),
        onPressed: () async {
          final res = await appApiRepo.getIntroSlideList('s');
          res.data?.forEach((el) {
            logger.i(el);
          });
        },
      ),
      // ElevatedButton(
      //   child: Text('5. get app docs'),
      //   onPressed: () async {
      //     final res = await appApiRepo.getAppDocumentList();
      //     res.data?.forEach((el) {
      //       logger.i(el);
      //     });
      //   },
      // ),
    ];
  }

  List<Widget> saloonDocsApi() {
    int docId = 7;
    return [
      ElevatedButton(
        child: Text('1. create saloon doc'),
        onPressed: () async {


          final file = await getFile('assets/test.pdf');

          final res = await saloonDocsRepo.createSaloonDocument(
            saloonId: mySalonId,
            title: 'title',
            description: 'description',
            document: file,
          );
          logger.i(res.data);
        },
      ),
      ElevatedButton(
        child: Text('2. get saloon doc list'),
        onPressed: () async {
          final res = await saloonDocsRepo.getSaloonDocumentList(mySalonId);
          res.data?.forEach((el) {
            logger.i(el);
          });
        },
      ),
      ElevatedButton(
        child: Text('3. update saloon doc'),
        onPressed: () async {
          final res = await saloonDocsRepo.updateSaloonDocument(
            documentId: docId,
            title: 'another title',
            description: 'another description',
          );
          logger.i(res.data);
        },
      ),
      ElevatedButton(
        child: Text('4. delete saloon doc'),
        onPressed: () async {
          final res = await saloonDocsRepo.deleteSaloonDocument(
            docId,
          );
          logger.i('success: ${res.success}');
        },
      ),
    ];
  }

  List<Widget> saloonStatisticsApi() {
    return [
      ElevatedButton(
        child: Text('1. get stats'),
        onPressed: () async {
          logger.w(DateTime.now().toIso8601String());
          final res = await saloonStatRepo.getSaloonStatistics(
            saloonId: mySalonId,
            from: DateTime.now().subtract(Duration(days: 365 * 2)),
            to: DateTime.now().add(Duration(days: 10)),
          );
          logger.i(res.data);
        },
      ),
      // ElevatedButton(
      //   child: Text('2. get PDF stats'),
      //   onPressed: () async {
      //     final res = await saloonStatRepo.getSaloonStatisticsPdfLink(
      //         saloonId: mySalonId);
      //     logger.i(res);
      //   },
      // ),
    ];
  }

  // List<Widget> stockApi() {
  //   return [
  //     ElevatedButton(
  //       child: Text('1. get stock list'),
  //       onPressed: () async {
  //         final res = await stockRepo.getStockList([10]);
  //         logger.i(res.data);
  //       },
  //     ),
  //     ElevatedButton(
  //       child: Text('2. create stock'),
  //       onPressed: () async {
  //         final file = await getFile(testPng);
  //         final res = await stockRepo.createStock(
  //           salon: 10,
  //           title: 'test stock',
  //           startDate: DateTime.now().subtract(Duration(days: 365)),
  //           endDate: DateTime.now().add(Duration(days: 365)),
  //           logo: file
  //         );
  //         logger.i(res.data);
  //       },
  //     ),
  //     ElevatedButton(
  //       child: Text('3. update stock'),
  //       onPressed: () async {
  //         final file = await getFile(test2Png);
  //         final res = await stockRepo.updateStock(
  //           stockId: 9,
  //           title: 'another title',
  //           description: 'another description',
  //           logo: file,
  //           startDate: DateTime.now().add(Duration(days: 365)),
  //           endDate: DateTime.now().add(Duration(days: 365*2)),
  //         );
  //         logger.i(res.data);
  //       },
  //     ),
  //     ElevatedButton(
  //       child: Text('4. delete stock'),
  //       onPressed: () async {
  //         final res = await stockRepo.deleteStock(10);
  //         logger.i(res.data);
  //       },
  //     ),
  //   ];
  // }

  List<Widget> commentsApi () {
    return [
      ElevatedButton(
        child: Text('1. get comment list'),
        onPressed: () async {
          final res = await commentRepo.getCommentList(saloonId: 14);
          logger.i(res.data);
        },
      ),
      ElevatedButton(
        child: Text('2. create comment'),
        onPressed: () async {
          final res = await commentRepo.createComment(
              salonId: 14,
              rating: 1,
              text: "test1",
          );
          logger.i(res.data);
        },
      ),
      ElevatedButton(
        child: Text('3. update comment'),
        onPressed: () async {
          final res = await commentRepo.updateComment(
            commentId: 9,
            text: 'test2',
            rating: 2,
          );
          logger.i(res.data);
        },
      ),
      ElevatedButton(
        child: Text('4. delete comment'),
        onPressed: () async {
          final res = await commentRepo.deleteComment(9);
          logger.i(res.data);
        },
      ),
    ];
  }
// endregion apis

  List<Widget> permissionsApi() {
    return [
      ElevatedButton(
        child: Text('1. photo or storage'),
        onPressed: () async {
          final res = await permissionRepo.requestPhotoOrStorage();
          logger.i(res);
        },
      ),
      ElevatedButton(
        child: Text('2. geolocation'),
        onPressed: () async {
          final res = await permissionRepo.requestGeo();
          logger.i(res);
        },
      ),
      ElevatedButton(
        child: Text('3. camera'),
        onPressed: () async {
          final res = await permissionRepo.requestCamera();
          logger.i(res);
        },
      ),
    ];
  }
}
