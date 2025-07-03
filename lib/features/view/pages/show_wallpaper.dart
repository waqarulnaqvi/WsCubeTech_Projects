import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app_ui_homework/features/viewmodel/bloc/home_bloc/home_events.dart';
import 'package:wallpaper_app_ui_homework/shared/view/widgets/global_widget.dart';

import '../../viewmodel/bloc/home_bloc/home_bloc.dart';
import '../../viewmodel/bloc/home_bloc/home_state.dart';

class ShowWallpaper extends StatefulWidget {
  const ShowWallpaper({super.key});

  @override
  State<ShowWallpaper> createState() => _ShowWallpaperState();
}


class _ShowWallpaperState extends State<ShowWallpaper> {

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetPhotoDetailsEvent(photoId: "300"));
    // context.read<HomeBloc>().add(ChangePhotoIndexEvent(index: 300));
  }


  int indexP=300;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.isLoadingGetPhotoDetails) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.errorMessageGetPhotoDetails != null) {
            return Center(child: Text("Error: ${state.errorMessageGetPhotoDetails}"));
          }

          String photo = state.getPhotoDetails?.src.portrait??'';

          return Stack(


            children: [
              Positioned.fill(child:
              CachedNetworkImage(
                imageUrl: photo,
                errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red, size: 30,),
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    )
                ),
              ),
              ),


              Align(alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  spacerW(),
                  InkWell(
                      onTap : (){
                        indexP = (indexP - 1).clamp(300, 450);
                        setState(() {

                        });
                        context.read<HomeBloc>().add(GetPhotoDetailsEvent(photoId: indexP.toString()));
                      } ,
                      child: Icon(Icons.arrow_back_ios_new, color:indexP>300? Colors.white: Colors.grey, size: 30,)),
                  Spacer(),
                  InkWell(
                      onTap:(){
                        indexP = (indexP + 1).clamp(300, 450);

                        setState(() {
                        });
                        // context.read<HomeBloc>().add(ChangePhotoIndexEvent(index:newIndex));
                        // print("Change Photo Index: ${state.changePhotoIndex}");
                        context.read<HomeBloc>().add(GetPhotoDetailsEvent(photoId: indexP.toString()));
                      } ,
                      child: Icon(Icons.arrow_forward_ios, color:indexP<450? Colors.white: Colors.grey, size: 30,)),
                  spacerW(),
                ],
              ),),

              Align(alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    reusableButton(),
                    spacerW(30),
                    reusableButton(icon: Icons.download, text: "Save"),
                    spacerW(30),
                    reusableButton(icon: Icons.brush_sharp,
                        text: "Apply",
                        color: Colors.blueAccent),
                  ],
                ),),
            ],
          );
        },
      ),

    );
  }

  Widget reusableButton({IconData icon = Icons
      .info_outline, String text = "Info", Color? color}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        OutlinedButton(onPressed: () {},
            style: OutlinedButton.styleFrom(
              backgroundColor: color ?? Colors.white.withAlpha(60),
              minimumSize: const Size(55, 55),
              maximumSize: const Size(55, 55),
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: const BorderSide(color: Colors.white, width: 0),
            ),
            child: Icon(icon, color: Colors.white, size: 24,)),
        spacerH(6),
        Text(text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        spacerH(),
      ],
    );
  }
}
