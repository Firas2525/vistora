import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../core/utils/shared_prefs_helper.dart';
import '../main.dart';

class AuthMiddlewar extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route){
    if(SharedPrefsHelper.getString("token")!=null) return const RouteSettings(name: "/home");
    return null;
  }
}