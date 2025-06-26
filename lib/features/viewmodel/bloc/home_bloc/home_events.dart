

import 'package:equatable/equatable.dart';

class HomeEvents extends Equatable {
  const HomeEvents();

  @override
  List<Object?> get props => [];
}

class InitialHomeEvent extends HomeEvents {}

class LoadingHomeEvent extends HomeEvents {}

class ErrorHomeEvent extends HomeEvents {
  final String error;

  const ErrorHomeEvent(this.error);

  @override
  List<Object?> get props => [error];
}

class LoadedHomeEvent extends HomeEvents {}


///ApiCalls
class GetCuratedPhotosEvent extends HomeEvents {}
class GetSearchByPhotosEvent extends HomeEvents {
  final String searchQuery;
  const GetSearchByPhotosEvent({required this.searchQuery});

  @override
  List<Object?> get props => [searchQuery];
}
class GetPhotoDetailsEvent extends HomeEvents {
  final String photoId;
  const GetPhotoDetailsEvent({required this.photoId});
  // const GetPhotoDetailsEvent();

  @override
  List<Object?> get props => [photoId];
}





class ChangePhotoIndexEvent extends HomeEvents {
  final int index;
  const ChangePhotoIndexEvent({required this.index});

  @override
  List<Object?> get props => [index];
}