import 'package:client_app/core/common/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common/config/colors.dart';
import '../../../../../core/common/config/styles.dart';
import '../../../../../core/common/constant/dimension.dart';
import '../../../../../core/common/injection/injection.dart';
import '../../../../../core/common/local_storage/hive_services.dart';
import '../../../../../core/common/routes/app_routes.dart';
import '../../../../../generated/assets.dart';
import '../../data/model/params/change_fcm_token_dashBoard_params.dart';
import '../../data/model/params/filter_order_params.dart';
import '../state/dash_borard_bloc.dart';
import '../widget/order_count.dart';
import '../widget/select_content.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  // Track selected filter
  String selectedFilter = "الكل";

  // Filters list
  List<String> filters = [
    "الكل",
    "المقبولة",
    "الجارية",
    "ملغاة",
  ];
  String title = "";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return locator.get<DashBorardBloc>()
          ..add(
            AllOrder(
              filterOrderParams: FilterOrderServicesProviderParams(status: ""),
            ),
          )
          ..add(
            OrderCountEvent(),
          )
          ..add(
            ChangeNotificationEvent(
              changeFcmTokenParams: ChangeFcmTokenDashBaordParams(
                token:  getGeneral("fcmToken"),
                userId: getGeneral("userId"),
              ),
            ),
          );
      },
      child: BlocConsumer<DashBorardBloc, DashBorardState>(
        listener: (context, state) {
          if (state.allOrderStatus.isSuccess()) {
            if (state.allOrderStatus.model!.orders!.data!.isNotEmpty) {
              title = state.allOrderStatus.model?.orders?.data?[0]
                      .orderItems?[0].service?.user?.fullName ??
                  "_";
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                actions: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        Routes.notification,
                      );
                    },
                    child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.white),
                        child: Icon(Icons.notifications_none)),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
                title: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                        border: Border.all(color: AppColors.primaryColor),
                        image: DecorationImage(
                          image: AssetImage(Assets.pngMen),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "مرحبا",
                          style: CustomTextStyle.titleSmall(context,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          title ?? "",
                          style: CustomTextStyle.titleSmall(context,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
                backgroundColor: AppColors.primaryColor,
              ),
              body: state.orderCountStatus.isSuccess() &&
                      state.allOrderStatus.isSuccess()
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: OrderCount(
                                    text: 'الطلبات المعلقة',
                                    count: state.orderCountStatus.model
                                            ?.ordersCount?.pendingOrders
                                            .toString() ??
                                        "_",
                                    color: AppColors.blue,
                                  ),
                                ),
                                Expanded(
                                  child: OrderCount(
                                      text: "الطلبات المرفوضة",
                                      count: state.orderCountStatus.model
                                              ?.ordersCount?.rejectedOrders
                                              .toString() ??
                                          "_",
                                      color: AppColors.orange),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: OrderCount(
                                      text: 'الطلبات المقبولة',
                                      count: state.orderCountStatus.model
                                              ?.ordersCount?.acceptedOrders
                                              .toString() ??
                                          "_",
                                      color: AppColors.green),
                                ),
                                Expanded(
                                  child: OrderCount(
                                      text: 'الطلبات المكتملة',
                                      count: state.orderCountStatus.model
                                              ?.ordersCount?.deliveredOrders
                                              .toString() ??
                                          "_",
                                      color: AppColors.pink),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: ScreenSizeUtil.height(context) / 15,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedFilter = filters[index];
                                        if (selectedFilter == "الجارية") {
                                          context.read<DashBorardBloc>().add(
                                                AllOrder(
                                                  filterOrderParams:
                                                      FilterOrderServicesProviderParams(
                                                          status: "pending"),
                                                ),
                                              );
                                        } else if (selectedFilter ==
                                            "المقبولة") {
                                          context.read<DashBorardBloc>().add(
                                              AllOrder(
                                                  filterOrderParams:
                                                      FilterOrderServicesProviderParams(
                                                          status: "accepted")));
                                        } else if (selectedFilter == "ملغاة") {
                                          context.read<DashBorardBloc>().add(
                                                AllOrder(
                                                  filterOrderParams:
                                                      FilterOrderServicesProviderParams(
                                                          status: "canceled"),
                                                ),
                                              );
                                        } else if (selectedFilter == "الكل") {
                                          context.read<DashBorardBloc>().add(
                                                AllOrder(
                                                  filterOrderParams:
                                                      FilterOrderServicesProviderParams(
                                                          status: ""),
                                                ),
                                              );
                                        }
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: selectedFilter == filters[index]
                                            ? AppColors.orange
                                            : AppColors.scafold,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      padding: EdgeInsets.all(5),
                                      margin: EdgeInsets.all(5),
                                      height: 10,
                                      width: ScreenSizeUtil.width(context) / 3,
                                      child: Center(
                                        child: Text(
                                          filters[index],
                                          style: TextStyle(
                                            color:
                                                selectedFilter == filters[index]
                                                    ? AppColors.white
                                                    : AppColors.black,
                                            fontWeight:
                                                selectedFilter == filters[index]
                                                    ? FontWeight.bold
                                                    : FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SelectContent(
                              selectedFilter: selectedFilter,
                            )
                          ],
                        ),
                      ),
                    )
                  : ShimmerWidget());
        },
      ),
    );
  }
}
