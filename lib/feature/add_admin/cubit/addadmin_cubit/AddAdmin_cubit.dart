import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market_admin/core/api_services.dart';
import 'package:our_market_admin/feature/add_admin/cubit/addadmin_cubit/AddAdmin_state.dart';

class AddAdminCubit extends Cubit<AddAdminState> {
  AddAdminCubit() : super(AddAdminInitial());

  final _apiServices = ApiServices();

  Future<void> craeteAccount(Map<String, dynamic> data) async {
    try {
      emit(AddAdminLoading());
      Response res = await _apiServices.createAccount('signup', data);
      if (res.statusCode == 200) {
        log("Account created successfully : ${res.data}");
        emit(AddAdminSuccess());
      } else {
        log('Failed to create account: $res.data["msg"]');
        emit(
          AddAdminFailure(
            errorMessage: 'Failed to create account, please try again',
          ),
        );
      }
    } catch (e) {
      log('Error in craeteAccout: $e');
      emit(
        AddAdminFailure(
          errorMessage: 'Something went wrong , please try again',
        ),
      );
    }
  }
}
