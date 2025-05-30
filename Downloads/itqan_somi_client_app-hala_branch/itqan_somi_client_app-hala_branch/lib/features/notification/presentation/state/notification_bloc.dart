import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/common/bloc_status/bloc_status.dart';
import '../../data/model/all_notification.dart';
import '../../../home/data/model/params/change_fcm_token_params.dart';
import '../../data/model/show_notification_model.dart';
import '../../data/repo_imp/repo_imp.dart';

part 'notification_event.dart';

part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationImpl notificationImpl;

  NotificationBloc(this.notificationImpl) : super(NotificationState()) {
    on<NotificationEvent>((event, emit) async {
      if (event is AllNotification) {
        emit(state.copyWith(
          allNotification: BlocStatus.loading(),
          markAllAsRead: BlocStatus.initial(),
          markAsRead: BlocStatus.initial(),
        ));
        final result = await notificationImpl.allNotification();
        result.fold(
          (fail) {
            print(fail);
            emit(
              state.copyWith(
                allNotification: BlocStatus.fail(
                  error: fail.message,
                ),
              ),
            );
          },
          (model) {
            emit(state.copyWith(
              allNotification: BlocStatus.success(
                model: model,
              ),
            ));
          },
        );
      }
      if (event is MarkAllAsRead) {
        emit(state.copyWith(markAllAsRead: BlocStatus.loading()));
        final result = await notificationImpl.markAllAsRead();
        result.fold(
          (fail) {
            print(fail);
            emit(
              state.copyWith(
                markAllAsRead: BlocStatus.fail(
                  error: fail.message,
                ),
              ),
            );
          },
          (model) {
            emit(state.copyWith(
              markAllAsRead: BlocStatus.success(
                model: null,
              ),
            ));
          },
        );
      }
      if (event is MarkAsRead) {
        emit(state.copyWith(markAsRead: BlocStatus.loading()));
        final result = await notificationImpl.markAsRead(id: event.id);
        result.fold(
          (fail) {
            print(fail);
            emit(
              state.copyWith(
                markAsRead: BlocStatus.fail(
                  error: fail.message,
                ),
              ),
            );
          },
          (model) {
            emit(state.copyWith(
              markAsRead: BlocStatus.success(
                model: null,
              ),
            ));
          },
        );
      }
      if (event is ShowNotification) {
        emit(state.copyWith(showNotification: BlocStatus.loading()));
        final result = await notificationImpl.showNotification(id: event.id);
        result.fold(
          (fail) {
            print(fail);
            emit(
              state.copyWith(
                showNotification: BlocStatus.fail(
                  error: fail.message,
                ),
              ),
            );
          },
          (model) {
            emit(state.copyWith(
              showNotification: BlocStatus.success(
                model: model,
              ),
            ));
          },
        );
      }
    });
  }
}
