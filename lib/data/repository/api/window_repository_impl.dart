import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:okoshki/data/api/requests/create_window_service/create_window_service.dart';
import 'package:okoshki/data/api/requests/get_window_list/get_window_list.dart';
import 'package:okoshki/data/api/rest_client_api.dart';
import 'package:okoshki/data/models/window/window.dart';
import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/window.dart';
import 'package:okoshki/domain/entities/window_service.dart';
import 'package:okoshki/domain/repository/api/window_repository.dart';
import 'package:okoshki/internal/functions/safe_api_call.dart';

class WindowRepositoryImpl extends WindowRepository {
  final RestClientApi _restClientApi;

  WindowRepositoryImpl({
    required RestClientApi restClientApi,
  })  : _restClientApi = restClientApi;

  @override
  Future<ApiResource<List<WindowModel>>> getWindowList({
    required int saloonId,
    String? status,
    DateTime? from,
    DateTime? to,
  }) async {
    final body = GetWindowListBody(
      salon: saloonId,
      status: status,
      from: from != null ? DateFormat('yyyy-MM-dd').format(from) : null,
      to: to != null ? DateFormat('yyyy-MM-dd').format(to) : null,
    );
    final apiToBeCalled = _restClientApi.getWindowList(
      body.toJson(),
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<WindowModel>> createWindow({
    required int saloonId,
    required Window window,
  }) async {
    //list services window
    final createWindowServices = window.services
        .map((e) => CreateWindowServiceBody(
              sId: e.service.id,
              mId: e.master.id,
              price: double.tryParse(e.price)!,
            ))
        .toList();
    //json to string
    final services = jsonEncode(
      createWindowServices.map((e) => e.toJson()).toList(),
    );
    final apiToBeCalled = _restClientApi.createWindow(
      salon: saloonId,
      startDt: window.startDt,
      endDt: window.endDt,
      services: services,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<Window>> getWindowDetails({
    required int windowId,
  }) async {
    final apiToBeCalled = _restClientApi.getWindowDetail(
      windowId: windowId,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource> deleteWindow({
    required int windowId,
  }) async {
    final apiToBeCalled = _restClientApi.deleteWindow(
      windowId,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<Window>> updateWindow({
    required int windowId,
    String? startDt,
    String? endDt,
    required List<WindowService> delete,
    required List<WindowService> update,
    required List<WindowService> create,
  }) async {
    //create
    final createList = create
        .map((e) => CreateWindowServiceBody(
              sId: e.service.id,
              mId: e.master.id,
              price: double.parse(e.price),
            ))
        .toList();
    //update
    final updateList = update
        .map((e) => CreateWindowServiceBody(
              id: e.id,
              sId: e.service.id,
              mId: e.master.id,
              price: double.parse(e.price),
            ))
        .toList();
    final updateCreateList = createList + updateList;
    final updateCreateJsonString = jsonEncode(updateCreateList
        .map(
          (e) => e.toJson(),
        )
        .toList());
    //delete
    final deletList = delete
        .map(
          (windowService) => windowService.id,
        )
        .toList();
    // {"update":[{"id": 371, "s_id": 1, "m_id": 29, "price": 580}, {"id": 373, "s_id": 1, "m_id": 47, "price": 94}, {"s_id": 1, "m_id": 68, "price": 900}],"delete":[372]}
    final updateService =
        '{"update": $updateCreateJsonString,"delete" : $deletList}';

    final apiToBeCalled = _restClientApi.updateWindow(
      windowId: windowId,
      startDt: startDt,
      endDt: endDt,
      updateServices: updateService,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<Window>> updateStatusWindow({
    required int windowId,
    required String status,
  }) async {
    final apiToBeCalled = _restClientApi.updateWindow(
      windowId: windowId,
      status: status,
    );
    return await safeApiCall(apiToBeCalled);
  }
}
