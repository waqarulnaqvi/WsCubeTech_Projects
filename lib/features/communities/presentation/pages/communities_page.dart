import 'package:flutter/material.dart';
import 'package:whatsappclone/constants/static_images.dart';
import 'package:whatsappclone/core/theme/app_color.dart';
import 'package:whatsappclone/shared/presentation/widget/app_bar/reusable_app_bar.dart';
import 'package:whatsappclone/shared/presentation/widget/global_widget.dart';

class CommunitiesPage extends StatelessWidget {
  const CommunitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ReusableAppBar(
        isCommunities: true,
        text: "Communities",
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            spacerH(30),
            Image(image: AssetImage(StaticImage.communitiesImage),height: 150,fit: BoxFit.cover,),
            spacerH(25),
            Text("Stay connected with a community",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w500),),
            spacerH(5),
            Text('Communities bring members together in topic-based groups, and make it easy to get admin announcements. Any community you\'re added to will appear here.',style: TextStyle(fontSize: 15,),
            textAlign: TextAlign.center,),
            spacerH(4),
            Text("See example communities >",style: TextStyle(fontSize:15,color: Colors.blueAccent,fontWeight: FontWeight.w600),),
           spacerH(28),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 40,
              decoration: BoxDecoration(
                color: AppColor.lightThemeColor,
                borderRadius: BorderRadius.circular(30),
              ), 
              child: Center(child: Text('Start your community',style: TextStyle(color: Colors.white),)),
            )
            
          ],
        ),
      ),
    );
  }
}
