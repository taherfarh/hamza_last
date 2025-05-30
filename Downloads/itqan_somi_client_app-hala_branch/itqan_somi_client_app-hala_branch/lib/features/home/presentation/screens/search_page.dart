import 'package:client_app/core/common/config/colors.dart';
import 'package:client_app/core/common/constant/dimension.dart';
import 'package:client_app/core/common/widgets/app_bar_widget.dart';
import 'package:client_app/core/common/widgets/text_field_widget.dart';
import 'package:client_app/features/home/data/model/params/filter_params.dart';
import 'package:client_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/common/injection/injection.dart';
import '../../../../core/common/routes/app_routes.dart';
import '../../../../generated/assets.dart';
import '../state/home_provider.dart';
import '../widgets/search_widget/result_item_search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isSearch = false;
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<HomeBloc>()
        ..add(
          Filter(
            FilterParams(
                serviceProviderId:
                    context.read<HomeProvider>().provideServicesId,
                categoryId: context.read<HomeProvider>().categoriesId,
                minPrice: "1",
                maxPrice: context.read<HomeProvider>().price,
                rate: context.read<HomeProvider>().rate,
                search: ""),
          ),
        ),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.filterStatue.isSuccess()) {
            isSearch =
                state.filterStatue.model?.services?.data?.isNotEmpty ?? false;
            print("isSearch");
            print(isSearch);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: appBar(context, "ما الذي تبحث عنه"),
            body: state.filterStatue.isSuccess()
                ? Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFieldWidget(
                                textInputAction: TextInputAction.done,
                                controller: textEditingController,
                                onTap: () {},
                                onEditingComplete: () {
                                  context.read<HomeBloc>().add(
                                        Filter(
                                          FilterParams(
                                              serviceProviderId: context
                                                  .read<HomeProvider>()
                                                  .provideServicesId,
                                              categoryId: context
                                                  .read<HomeProvider>()
                                                  .categoriesId,
                                              minPrice: "1",
                                              maxPrice: context
                                                  .read<HomeProvider>()
                                                  .price,
                                              rate: context
                                                  .read<HomeProvider>()
                                                  .rate,
                                              search:
                                                  textEditingController.text),
                                        ),
                                      );
                                },
                                icon: Icons.search,
                                hintText: "بحث",
                                label: "",
                                obscureText: false,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(
                                    15), // Rounded corners
                              ),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacementNamed(
                                      Routes.filterPage,
                                    );
                                  },
                                  icon: Icon(Icons.tune),
                                  color: Colors.white,
                                ), // own color
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        isSearch
                            ? Container(
                                height: ScreenSizeUtil.height(context) / 1.50,
                                child: ListView.builder(
                                  itemCount: state.filterStatue.model?.services
                                      ?.data?.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pushNamed(
                                              Routes.detailsPage,
                                              arguments: {
                                                'id': state.filterStatue.model
                                                    ?.services?.data?[index].id
                                              });
                                        },
                                        child: ResultItemSearch(
                                          homeState: state,
                                          index: index,
                                        ));
                                  },
                                ),
                              )
                            : Column(
                                children: [
                                  SvgPicture.asset(
                                    Assets.svgSearch,
                                  ),
                                  Text("ابدا بالبحث عن خدمتك")
                                ],
                              ),
                      ],
                    ),
                  )
                : Center(
                    child: Lottie.asset(
                      Assets.lottieTimer,
                      fit: BoxFit.fill,
                      repeat: true,
                      height: 150,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
