import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpaper_app_ui_homework/features/viewmodel/bloc/home_bloc/home_bloc.dart';
import 'package:wallpaper_app_ui_homework/shared/view/widgets/global_widget.dart';
import '../../viewmodel/bloc/home_bloc/home_events.dart';
import '../../viewmodel/bloc/home_bloc/home_state.dart';
import 'nature.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  Color hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) {
      hex = 'FF$hex'; // add opacity if not provided
    }
    return Color(int.parse('0x$hex'));
  }

  bool showResults = false;

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        showResults = searchController.text.trim().isNotEmpty;
      });
    });

    context.read<HomeBloc>().add(GetCuratedPhotosEvent());
    context.read<HomeBloc>().add(GetSearchByPhotosEvent(searchQuery: "nature"));
    // You can add any initialization code here if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color(0xffd7ebed),//Change this color to the gradient color

        body: DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffd7ebed), Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spacerH(20),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: searchController,
                  onChanged: (value){

                    context.read<HomeBloc>().add(GetSearchByPhotosEvent(searchQuery: value));
                  },

                  decoration: InputDecoration(
                    hintText: 'Find Wallpaper...',
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: Icon(Icons.search),
                    suffixIconColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                  ),
                ),
              ),
              if(showResults)
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
                      padding: const EdgeInsets.symmetric(horizontal: 10),
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
              )
            else ...[




            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Best of the month",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.isLoadingCuratedPhotos) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state.errorMessageGetCuratedDetails != null) {
                    return Center(child: Text("Error: ${state.errorMessageGetCuratedDetails}"));
                  }

                  return SizedBox(
                    height: 230,
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final c = state.curatedPhotos!.photos[index];
                        return Container(
                          width: 140,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 10),
                          // decoration: BoxDecoration(
                          //   image: DecorationImage(
                          //       image: NetworkImage(c.src.original), fit: BoxFit.cover),
                          //   borderRadius: BorderRadius.circular(20),
                          // ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              imageUrl: c.src.original,
                              errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red, size: 30,),
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(
                                color: Colors.white,
                              )),
                            ),
                          ),
                        );
                      },
                      itemCount: state.curatedPhotos?.photos.length ?? 0,
                    ),
                  );
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "The color tone",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.isLoadingCuratedPhotos) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state.errorMessageGetCuratedDetails != null) {
                      return Center(child: Text("Error: ${state.errorMessageGetCuratedDetails}"));
                    }

                    return SizedBox(
                    height: 70,
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final c= state.curatedPhotos!.photos[index];
                        return Container(
                          width: 50,
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            // color: Color.fromARGB(255, Random().nextInt(256),
                            //     Random().nextInt(256), Random().nextInt(256)),
                            color: hexToColor(c.avgColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      },
                      itemCount: state.curatedPhotos?.photos.length ?? 0,
                    ),
                  );
                }
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Categories",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                if (state.isLoadingCuratedPhotos) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.errorMessageGetCuratedDetails != null) {
                  return Center(child: Text("Error: ${state.errorMessageGetCuratedDetails}"));
                }

                return GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1.6),
                  itemBuilder: (context, index) {
                    var c = state.curatedPhotos!.photos[index];
                    return Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        // image: DecorationImage(
                        //     image: NetworkImage(c.src.original), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      // foregroundDecoration: BoxDecoration(
                      //   color: Colors.black.withValues(alpha: 0.2),
                      //   borderRadius: BorderRadius.circular(15),
                      // ),
                      child: Stack(
                        children: [
                          Positioned.fill(child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                              imageUrl: c.src.original,
                              errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red, size: 30,),
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(
                                color: Colors.white,
                              )
                            ),
                          ),),
                          ),



                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Center(
                                child: Text(
                              c.photographer,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                            )),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: state.curatedPhotos?.photos.length ?? 0,
                );
              })
          ]
        ]

          ),
        ),
      ),
    ));
  }
}

// List<Map<String,dynamic>> images= [
//   {
//     "url":
//     "https://i.pinimg.com/236x/ae/59/45/ae59450df379bbbcf3ab0024908e42a8.jpg",
//   },
//   {
//     "url":
//     "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQuI09xMzIDOWRAX2IlFPr_VBfmwRxMptrxVFefwnUIpZRRzx5s",
//   },
//   {
//     "url":
//     "https://wallpapers.com/images/high/pastel-ipad-watery-mixture-fwz5ogigbtxcegh8.webp",
//   },
// ];
//
// List<Map<String,String>> categories = [
//   {
//     "imgUrl":
//     "https://www.shutterstock.com/image-illustration/tie-dye-patchwork-ethnic-pattern-260nw-2451539801.jpg",
//     "name": "Abstrack"
//   },
//   {
//     "imgUrl":
//     "https://wallpapersmug.com/download/1366x768/ad7960/green-waves-aerial-view.jpg",
//     "name": "Nature"
//   },
//   {
//     "imgUrl":
//     "https://wallpapersmug.com/large/b1e6e0/space-musician-red-car-in-the-clouds-fantasy.jpg",
//     "name": "Space"
//   },
//   {
//     "imgUrl": "https://wallpapersmug.com/large/351449/teen-tiger-animal.jpg",
//     "name": "Animal"
//   }
// ];
//
