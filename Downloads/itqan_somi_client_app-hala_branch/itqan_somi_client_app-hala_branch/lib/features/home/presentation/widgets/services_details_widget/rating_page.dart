import 'package:client_app/core/common/constant/dimension.dart';
import 'package:client_app/features/home/data/model/params/add_rating_params.dart';
import 'package:client_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:client_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../core/common/config/colors.dart';
import '../../../../../core/common/config/styles.dart';
import '../../../../../core/common/constant/strings.dart';
import '../../../../../core/common/widgets/elevated_button_widget.dart';

class RatingPage extends StatefulWidget {
  HomeState state;

  RatingPage({super.key, required this.state});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  final TextEditingController _commentController = TextEditingController();
  double _rating = 1.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.state.detailsServicesStatue.model!.service!.reviews!.isNotEmpty
            ? Card(
                color: AppColors.scafold,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.state.detailsServicesStatue.model?.service
                        ?.reviews?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundImage: widget
                                                  .state
                                                  .detailsServicesStatue
                                                  .model
                                                  ?.service
                                                  ?.reviews?[index]
                                                  .user
                                                  ?.image ==
                                              null
                                          ? AssetImage(Assets.pngPerson)
                                          : NetworkImage(
                                              "${AppStrings.imageString}${widget.state.detailsServicesStatue.model?.service?.reviews?[index].user?.image}"),
                                    ),
                                    SizedBox(width: 4),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                            widget
                                                    .state
                                                    .detailsServicesStatue
                                                    .model
                                                    ?.service
                                                    ?.reviews?[index]
                                                    .user
                                                    ?.fullName ??
                                                "_",
                                            style: CustomTextStyle.titleSmall(
                                                context,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            DateTime.parse(widget
                                                        .state
                                                        .detailsServicesStatue
                                                        .model
                                                        ?.service
                                                        ?.reviews?[index]
                                                        .createdAt ??
                                                    "2024-11-26T10:11:43.000000Z")
                                                .toLocal()
                                                .toString(),
                                            style: CustomTextStyle.bodySmall(
                                                    context)
                                                ?.copyWith(fontSize: 10)),
                                      ],
                                    ),
                                  ],
                                ),
                                Center(
                                  child: RatingBar.builder(
                                    initialRating: double.parse(widget
                                            .state
                                            .detailsServicesStatue
                                            .model
                                            ?.service
                                            ?.reviews?[index]
                                            .rate ??
                                        "_"),
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 15.0,
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(widget.state.detailsServicesStatue.model
                                    ?.service?.reviews?[index].comment ??
                                ""),
                            SizedBox(
                              height: 10,
                            ),
                            Divider()
                          ],
                        ),
                      );
                    }),
              )
            : SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text(
                      "لا توجد تقييمات حاليًا",
                      style: CustomTextStyle.titleMedium(context,
                          color: Colors.grey),
                    ),
                  ),
                ),
              ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "إضافة تقييم",
                style: CustomTextStyle.bodySmall(context,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              RatingBar.builder(
                initialRating: _rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemSize: 40.0,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                  print("Rating: $_rating");
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _commentController,
                maxLines: 2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'أضف تعليق',
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: widget.state.addRatingStatue.isLoading() ? Center(child: CircularProgressIndicator()):ElevatedButtonWidget(
                  width: ScreenSizeUtil.width(context),
                  onPressed: () {
                    context.read<HomeBloc>().add(
                      AddReviews(AddRatingParams(serviceId:widget.state.detailsServicesStatue.model?.service?.id.toString(),rate:_rating.toString() ,comment: _commentController.text)),
                    );
                  },
                  text: "أضف تقييم",
                  color: AppColors.orange,
                  textColor: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
