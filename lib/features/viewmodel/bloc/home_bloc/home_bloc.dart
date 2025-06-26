

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app_ui_homework/core/network/api_services.dart';
import 'package:wallpaper_app_ui_homework/features/model/curated_photos.dart';
import 'package:wallpaper_app_ui_homework/features/model/search_by_photos.dart';
import 'package:wallpaper_app_ui_homework/features/viewmodel/bloc/home_bloc/home_state.dart';
import '../../../model/photo.dart';
import 'home_events.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  HomeBloc({required this.apiServices} ) : super(HomeState()) {
    on<GetCuratedPhotosEvent>(_getCuratedPhotosEvent);
    on<GetSearchByPhotosEvent>(_getSearchByPhotosEvent);
    on<GetPhotoDetailsEvent>(_getPhotoDetailsEvent);
    // on<ChangePhotoIndexEvent>(_onchangeIndexEvent);
  }

  ApiServices apiServices;

    Future<void> _getCuratedPhotosEvent(
        GetCuratedPhotosEvent event, Emitter<HomeState> emit) async {
      try {
        emit(state.copyWith(
            isLoading: true));
        final CuratedPhotos? getCuratedPhotos = await apiServices.getCuratedPhoto();
        if(getCuratedPhotos!=null)
          {
            emit(state.copyWith(curatedPhotos: getCuratedPhotos));
          }else
          {
            emit(state.copyWith(errorMessage: "No curated photos found"));
          }
      } catch (e) {
        emit(state.copyWith(errorMessage: e.toString()));
      }
    }

    Future<void> _getSearchByPhotosEvent(
        GetSearchByPhotosEvent event, Emitter<HomeState> emit) async {
      try {
        emit(state.copyWith(isLoading: true));
        final List<SearchByPhotos> searchByPhotos =
            await apiServices.searchByPhotos(searchQuery: event.searchQuery);

        print("Search by photos result: $searchByPhotos");
        if (searchByPhotos.isNotEmpty) {
          emit(state.copyWith(searchByPhotos: searchByPhotos));
        } else {
          emit(state.copyWith(errorMessage: "No photos found for the search query"));
        }
      }
      catch (e) {
        emit(state.copyWith(errorMessage: e.toString()));
      }
    }

    Future<void> _getPhotoDetailsEvent(
        GetPhotoDetailsEvent event, Emitter<HomeState> emit) async {
      try {
        emit(state.copyWith(isLoading: true,changePhotoIndex: int.parse(event.photoId)));
        final Photo? photoDetails = await apiServices.getPhotoDetails(photoId: event.photoId.toString());
       // print("Get a Photo");
       // print(photoDetails);
        if (photoDetails != null) {

          emit(state.copyWith(getPhotoDetails: photoDetails));
        } else {
          emit(state.copyWith(errorMessage: "No photo details found for the given ID"));
        }
      } catch (e) {
        emit(state.copyWith(errorMessage: e.toString()));
      }
    }

    // void _onchangeIndexEvent(
    //     ChangePhotoIndexEvent event, Emitter<HomeState> emit) {
    //   emit(state.copyWith(changePhotoIndex: event.index));
    // }

}