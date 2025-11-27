part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class GetProductsLoading extends ProductsState {}

final class GetProductsSuccess extends ProductsState {}

final class GetProductsError extends ProductsState {}

final class UploadImageLoading extends ProductsState {}

final class UploadImageSuccess extends ProductsState {}

final class UploadImageError extends ProductsState {}

final class EditProductLoading extends ProductsState {}

final class EditProductSuccess extends ProductsState {}

final class EditProductError extends ProductsState {}

final class DeleteProductLoading extends ProductsState {}

final class DeleteProductSuccess extends ProductsState {}

final class DeleteProductError extends ProductsState {}

final class AddProductLoading extends ProductsState {}

final class AddProductSuccess extends ProductsState {}

final class AddProductError extends ProductsState {}
