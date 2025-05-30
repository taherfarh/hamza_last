import 'package:client_app/core/common/config/colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../profile/presentation/pages/my_profile.dart';
import '../../core/common/injection/injection.dart';
import '../../core/common/local_storage/hive_services.dart';
import '../home/data/model/params/change_fcm_token_params.dart';
import '../home/presentation/bloc/home_bloc.dart';
import '../root/presentation/widgets/item_bar.dart';
import 'order/presentation/pages/dash_board_page.dart';

class RootServicesPage extends StatefulWidget {
  RootServicesPage({super.key});

  final List<Widget> pages = [
    // Page 1: A simple container
    DashBoard(),
    MyProfilePage(),
  ];

  @override
  State<RootServicesPage> createState() => _RootServicesPageState();
}

class _RootServicesPageState extends State<RootServicesPage> {
  int _page = 0;
  int indexx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: AppColors.scafold,
        color:AppColors.scafold,
        animationDuration: const Duration(milliseconds: 300),
        items:  <Widget>[
          ItemBar(text: "الرئيسية",icon:Icons.home_outlined,color: _page==0?AppColors.primaryColor:AppColors.grey, ),
          ItemBar(text: "حساباتي",icon: Icons.person_2_outlined,color: _page==1?AppColors.primaryColor:AppColors.grey ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body:widget.pages[_page],
    );
  }
}
