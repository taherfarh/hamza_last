import 'package:dio/dio.dart';

import '../../../../core/common/constant/url.dart';
import '../../../../core/common/network/dio/dio.dart';
import '../model/all_notification.dart';
import '../../../home/data/model/params/change_fcm_token_params.dart';
import '../model/show_notification_model.dart';

class NotificationRemote {
  DioClient dioClient;

  NotificationRemote({required this.dioClient});

  Future<AllNotificationModel> allNotification() async {
    late final Response response;
    response = await dioClient.get(
      url: AppUrl.allNotification,
    );
    return AllNotificationModel.fromJson(response.data);
  }

  Future<Response> markAllAsRead() async {
    late final Response response;
    response = await dioClient.get(
      url: AppUrl.markAllAsRead,
    );
    return response;
  }

  Future<Response> markAsRead({ required String id}) async {
    late final Response response;
    response = await dioClient.get(
      url: "${AppUrl.markAsRead}/$id",
    );
    return response;
  }

  Future<ShowNotificationModel> showNotification({ required String id}) async {
    late final Response response;
    response = await dioClient.get(
      url: "${AppUrl.showNotification}/$id",
    );
    return ShowNotificationModel.fromJson(response.data);
  }
}
