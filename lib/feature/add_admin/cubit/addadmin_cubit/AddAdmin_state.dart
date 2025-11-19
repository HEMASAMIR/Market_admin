import 'package:flutter/material.dart';

@immutable
sealed class AddAdminState {}

class AddAdminInitial extends AddAdminState {}

class AddAdminLoading extends AddAdminState {}

class AddAdminSuccess extends AddAdminState {}

class AddAdminFailure extends AddAdminState {
  final String errorMessage;
  AddAdminFailure({required this.errorMessage});
}
