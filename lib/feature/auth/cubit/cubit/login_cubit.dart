import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:our_market_admin/core/api_services.dart';
import 'package:our_market_admin/core/functions/shared_pref.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final ApiServices _apiServices = ApiServices();

  Future<void> login(Map<String, dynamic> data) async {
    emit(LoginLoading());
    try {
      Response response = await _apiServices.login('token', data);

      // لو كل حاجة تمام
      if (response.statusCode == 200 && response.data["access_token"] != null) {
        log("Login Success: ${response.data["access_token"]}");
        await SharedPref.saveToken(response.data["access_token"]);
        emit(LoginSuccess());
      } else {
        // بدل ما تقول أي واحد غلط، رسالة عامة
        emit(LoginError(msgError: "Email or password is incorrect"));
      }
    } catch (e) {
      log("Login Error: $e");
      emit(LoginError(msgError: "Email or password is incorrect"));
    }
  }
}
