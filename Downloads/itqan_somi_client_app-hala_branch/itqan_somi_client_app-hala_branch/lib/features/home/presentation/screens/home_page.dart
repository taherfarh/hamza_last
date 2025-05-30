import 'package:client_app/core/common/config/colors.dart';
import 'package:client_app/core/common/config/styles.dart';
import 'package:client_app/features/home/data/model/params/filter_params.dart';
import 'package:client_app/features/home/data/model/params/change_fcm_token_params.dart';
import 'package:client_app/features/notification/presentation/state/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/injection/injection.dart';
import '../../../../core/common/local_storage/hive_services.dart';
import '../../../../core/common/routes/app_routes.dart';
import '../../../../core/common/widgets/icon_widget.dart';
import '../../../../core/common/widgets/shimmer.dart';
import '../bloc/home_bloc.dart';
import '../widgets/home_body_widget.dart';

class HomePage extends StatelessWidget {
  Map<String, String> searchName = {};

  @override
  Widget build(BuildContext context) {
    print("object");
    print(getToken());
    return BlocProvider(
      create: (context)  {
        final bloc = locator.get<HomeBloc>()
          ..add(AllMainCategories())
          ..add(PopularServices())
          ..add(PopularServicesProvider())
          ..add(ServicesFormSetting())
          ..add(CategoriesFormSetting())
          ..add(Filter(FilterParams(search: "")));

        // Check if token is not null before adding CountCarts
        if (getToken() != null ) {
          bloc.add(CountCarts());
        }


            final fcmToken = getGeneral("fcmToken");
            final userId =   getGeneral("userId");

            if (fcmToken != null && userId != null) {
              bloc.add(
                ChangeNotificationEvent(
                  changeFcmTokenParams: ChangeFcmTokenParams(
                    token: fcmToken,
                    userId: userId,
                  ),
                ),
              );
            }


        return bloc;
      },
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
          if (state.filterStatue.isSuccess()) {
            for (int i = 0;
                i < state.filterStatue.model!.services!.data!.length;
                i++) {
              searchName[state.filterStatue.model?.services?.data![i].id
                          .toString() ??
                      "-"] =
                  state.filterStatue.model?.services?.data![i].name ?? "-";
            }
          }
        }, builder: (context, state) {
          return state.categoriesStatue.isSuccess() &&
                  state.popularServicesStatue.isSuccess() &&
                  state.servicesFormSettingStatue.isSuccess() &&
                  state.categoriesFormSettingStatue.isSuccess() &&
                  state.popularServicesProviderStatue.isSuccess() &&
                  (state.countCartsStatue.isSuccess() ||
                      state.countCartsStatue.isInitial())
              ? CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 160,
                      pinned: false,
                      floating: false,
                      actions: [
                        if (getToken() != null)
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                Routes.notification,
                              );
                            },
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: ActionWidget(
                                icon: Icons.notifications_none,
                              ),
                            ),
                          ),
                        if (getToken() != null) SizedBox(width: 10),
                        if (getToken() != null)
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      Routes.cartPage,
                                    );
                                  },
                                  child: ActionWidget(
                                    icon: Icons.shopping_bag_outlined,
                                  ),
                                ),
                              ),
                              state.countCartsStatue.model!.count == 0
                                  ? SizedBox()
                                  : Container(
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                        border: Border.all(
                                            width: 2, color: AppColors.white),
                                      ),
                                      child: Text(
                                        state.countCartsStatue.model!.count! >
                                                99
                                            ? "+99"
                                            : state
                                                .countCartsStatue.model!.count
                                                .toString(),
                                        textAlign: TextAlign.center,
                                        style: CustomTextStyle.bodySmall(
                                            context,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                            ],
                          ),
                      ],
                      flexibleSpace: FlexibleSpaceBar(
                        background: Image.network(
                          fit: BoxFit.cover,
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSscMQdSeh_fhd99Maw3ZS0xeNASHGS3Wuatg&s",
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: HomeBody(
                        state: state,
                        mapIdAndName: searchName,
                      ),
                    )
                  ],
                )
              : ShimmerWidget();
        }),
      ),
    );
  }
}
