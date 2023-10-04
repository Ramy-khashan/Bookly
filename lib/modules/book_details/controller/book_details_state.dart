part of 'book_details_cubit.dart';

abstract class BookDetailsState {}

class BookDetailsInitial extends BookDetailsState {}

class LoadingSimillerBookState extends BookDetailsState {}

class FailureSimillerBookState extends BookDetailsState {}

class SuccessGetSimillerBookState extends BookDetailsState {}

class LoadingBookDetailsState extends BookDetailsState {}

class FailureBookDetailsState extends BookDetailsState {}

class SuccessGetBookDetailsState extends BookDetailsState {}
