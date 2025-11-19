import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market_admin/core/api_services.dart';
import 'package:our_market_admin/feature/add_admin/cubit/addadmin_cubit/AddAdmin_state.dart';

class AddAdminCubit extends Cubit<AddAdminState> {
  AddAdminCubit() : super(AddAdminInitial());

  ApiServices _apiServices = ApiServices();

  Future<void> craeteAccout(Map<String, dynamic> data) async {
    try {
      emit(AddAdminLoading());
      Response res = await _apiServices.craeteAccount('signup', data);
      if (res.statusCode == 200) {
        emit(AddAdminSuccess());
      } else {
        emit(
          AddAdminFailure(
            errorMessage: 'Failed to create account, please try again',
          ),
        );
      }
    } catch (e) {
      emit(
        AddAdminFailure(
          errorMessage: 'Something went wrong , please try again',
        ),
      );
    }
  }
}
