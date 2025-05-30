import 'package:client_app/core/common/config/colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/injection/injection.dart';
import '../../../../core/common/local_storage/hive_services.dart';
import '../../../../profile/presentation/pages/my_profile.dart';
import '../../../department/presentation/department_screen.dart';
import '../../../home/data/model/params/change_fcm_token_params.dart';
import '../../../home/presentation/bloc/home_bloc.dart';
import '../../../home/presentation/screens/home_page.dart';
import '../../../payment/presentation/pages/booking_page.dart';
import '../widgets/item_bar.dart';

class RootPage extends StatefulWidget {
  RootPage({super.key});

  final List<Widget> pages = [
    // Page 1: A simple container
    HomePage(),
    DepartmentScreen(),
    BookingPage(),
    MyProfilePage(),
  ];

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
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
          ItemBar(text: "الأقسام",icon: Icons.dashboard_outlined,color: _page==1?AppColors.primaryColor:AppColors.grey ),
          ItemBar(text: "طلباتي",icon: Icons.shopping_bag_outlined,color: _page==2?AppColors.primaryColor:AppColors.grey ),
          ItemBar(text: "حساباتي",icon: Icons.person_2_outlined,color: _page==3?AppColors.primaryColor:AppColors.grey ),
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