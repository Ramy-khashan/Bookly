part of 'home_page_cubit.dart';

abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class LoadingNewBookState extends HomePageState {}

class FaildGetNewBookState extends HomePageState {
  final String errorMessage;
  FaildGetNewBookState({required this.errorMessage});
}

class SuccessGetNewBookState extends HomePageState {}

class LoadingBestSellerBookState extends HomePageState {}

class FailureBestSellerBookState extends HomePageState {}

class SuccessLoadingBestSellerBookState extends HomePageState {}
