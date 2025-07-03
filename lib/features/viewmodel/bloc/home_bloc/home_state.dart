import 'package:equatable/equatable.dart';
import 'package:wallpaper_app_ui_homework/features/model/curated_photos.dart';
import 'package:wallpaper_app_ui_homework/features/model/search_by_photos.dart';

import '../../../model/photo.dart';

class HomeState extends Equatable {
  final bool isLoadingGetPhotoDetails;
  final bool isLoadingCuratedPhotos;
  final bool isLoadingSearchByPhotos;
  final String? errorMessageGetPhotoDetails;
  final String? errorMessageGetCuratedDetails;
  final String? errorMessageGetSearchDetails;
  final Photo? getPhotoDetails;
  final CuratedPhotos? curatedPhotos;
  final List<SearchByPhotos?> searchByPhotos;
  final int changePhotoIndex;

  const HomeState({
    this.isLoadingGetPhotoDetails = false,
    this.isLoadingCuratedPhotos = false,
    this.isLoadingSearchByPhotos = false,
    this.errorMessageGetPhotoDetails,
    this.errorMessageGetCuratedDetails,
    this.errorMessageGetSearchDetails,
    this.getPhotoDetails,
    this.curatedPhotos,
    this.changePhotoIndex = 300,
    this.searchByPhotos = const [],
  });

  HomeState copyWith({
    bool? isLoadingGetPhotoDetails = false,
    bool? isLoadingCuratedPhotos = false,
    bool? isLoadingSearchByPhotos = false,
    String? errorMessageGetPhotoDetails,
    String? errorMessageGetCuratedDetails,
    String? errorMessageGetSearchDetails,
    Photo? getPhotoDetails,
    CuratedPhotos? curatedPhotos,
    List<SearchByPhotos?>? searchByPhotos,
    int? changePhotoIndex = 300,
  }) {
    return HomeState(
      isLoadingGetPhotoDetails:
          isLoadingGetPhotoDetails ?? this.isLoadingGetPhotoDetails,
      isLoadingCuratedPhotos:
          isLoadingCuratedPhotos ?? this.isLoadingCuratedPhotos,
      isLoadingSearchByPhotos:
          isLoadingSearchByPhotos ?? this.isLoadingSearchByPhotos,
      errorMessageGetPhotoDetails:
          errorMessageGetPhotoDetails ?? this.errorMessageGetPhotoDetails,
      errorMessageGetCuratedDetails:
          errorMessageGetCuratedDetails ?? this.errorMessageGetCuratedDetails,
      errorMessageGetSearchDetails:
          errorMessageGetSearchDetails ?? this.errorMessageGetSearchDetails,
      getPhotoDetails: getPhotoDetails ?? this.getPhotoDetails,
      curatedPhotos: curatedPhotos ?? this.curatedPhotos,
      searchByPhotos: searchByPhotos ?? this.searchByPhotos,
      changePhotoIndex: changePhotoIndex ?? this.changePhotoIndex,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        errorMessageGetCuratedDetails,
        errorMessageGetPhotoDetails,
        errorMessageGetSearchDetails,
        getPhotoDetails,
        curatedPhotos,
        searchByPhotos,
        isLoadingCuratedPhotos,
        isLoadingSearchByPhotos,
        isLoadingGetPhotoDetails,
        changePhotoIndex
      ];
}
