import 'package:equatable/equatable.dart';
import 'package:wallpaper_app_ui_homework/features/model/curated_photos.dart';
import 'package:wallpaper_app_ui_homework/features/model/search_by_photos.dart';

import '../../../model/photo.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final Photo? getPhotoDetails;
  final CuratedPhotos? curatedPhotos;
  final List<SearchByPhotos?> searchByPhotos;
  final int changePhotoIndex;

  const HomeState({
    this.isLoading = false,
    this.errorMessage,
    this.getPhotoDetails,
    this.curatedPhotos ,
    this.changePhotoIndex = 300,
    this.searchByPhotos = const [],
  });

  HomeState copyWith({
    bool isLoading = false,
    String? errorMessage,
    Photo? getPhotoDetails,
    CuratedPhotos? curatedPhotos,
    List<SearchByPhotos?>? searchByPhotos,
    int changePhotoIndex = 300,
  }) {
    return HomeState(
      isLoading: isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      getPhotoDetails: getPhotoDetails ?? this.getPhotoDetails,
      curatedPhotos: curatedPhotos ?? this.curatedPhotos,
      searchByPhotos: searchByPhotos ?? this.searchByPhotos,
      changePhotoIndex: changePhotoIndex?? this.changePhotoIndex,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [isLoading,errorMessage, getPhotoDetails, curatedPhotos, searchByPhotos];
}
