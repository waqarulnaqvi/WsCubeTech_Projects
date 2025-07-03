import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpaper_app_ui_homework/features/viewmodel/bloc/home_bloc/home_events.dart';
import 'package:wallpaper_app_ui_homework/shared/view/widgets/global_widget.dart';

import '../../viewmodel/bloc/home_bloc/home_bloc.dart';
import '../../viewmodel/bloc/home_bloc/home_state.dart';

class Nature extends StatefulWidget {
  const Nature({super.key});

  @override
  State<Nature> createState() => _NatureState();
}

class _NatureState extends State<Nature> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetSearchByPhotosEvent(searchQuery: "nature"));
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffd7ebed),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffd7ebed),
              Colors.white
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),child:  SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spacerH(20),
                  const Text(
                    "Nature",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  spacerH(5),
                  const Text(
                    "36 wallpapers available",
                    style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.w300),
                  ),
                  spacerH(25),
                  BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state.isLoadingSearchByPhotos) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        if (state.errorMessageGetSearchDetails != null) {
                          return Center(child: Text("Error: ${state.errorMessageGetSearchDetails}"));
                        }


                        return MasonryGridView.builder(
                        shrinkWrap: true,
                        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: state.searchByPhotos.length,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        itemBuilder: (context, index) {
                          final s = state.searchByPhotos[index];
                          return WallpaperTile(imageUrl: s!.src.portrait,index: index,isLastIndex: index==state.searchByPhotos.length-1);
                        },
                      );
                    }
                  ),
                   spacerH(40)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WallpaperTile extends StatelessWidget {
  final String imageUrl;
  final int index;
  final bool isLastIndex;
  const WallpaperTile({super.key, required this.imageUrl, required this.index, this.isLastIndex=false});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        height: ( index==0 || isLastIndex )?220: 280,
        width: double.infinity,
        // decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: NetworkImage(imageUrl),
          //   fit: BoxFit.cover,
          // ),
        child: CachedNetworkImage(imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red, size: 30,),
        ),
      )
    );
  }
}



// List<String> imageUrls = [
//   "https://wallpapersmug.com/large/b1e6e0/space-musician-red-car-in-the-clouds-fantasy.jpg",
//   "https://wallpapersmug.com/download/1366x768/ad7960/green-waves-aerial-view.jpg",
//   "https://wallpapersmug.com/large/351449/teen-tiger-animal.jpg",
//   "https://i.pinimg.com/236x/ae/59/45/ae59450df379bbbcf3ab0024908e42a8.jpg",
//   "https://www.shutterstock.com/image-illustration/tie-dye-patchwork-ethnic-pattern-260nw-2451539801.jpg",
//   "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQuI09xMzIDOWRAX2IlFPr_VBfmwRxMptrxVFefwnUIpZRRzx5s",
//   "https://wallpapersmug.com/large/b1e6e0/space-musician-red-car-in-the-clouds-fantasy.jpg",
//   "https://wallpapersmug.com/large/351449/teen-tiger-animal.jpg",
//
// ];
