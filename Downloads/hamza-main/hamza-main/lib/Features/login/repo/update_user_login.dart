// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';

class UpdateUserLogin {
   void  updatauser(String phone) async{
       Dio dio=Dio();

       try {
          var request= await dio.post("https://aliceblue-dolphin-854247.hostingersite.com/mo/updateuserlogin.php?phone=$phone&login=yes");

       } catch (e) {
              print(e);

       }
  }
}