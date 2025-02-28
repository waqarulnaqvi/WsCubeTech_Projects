import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsappclone/core/theme/app_color.dart';
import 'package:whatsappclone/features/calls/models/calls_info.dart';
import 'package:whatsappclone/shared/presentation/widget/app_bar/reusable_app_bar.dart';
import 'package:whatsappclone/shared/presentation/widget/global_widget.dart';

class CallsPage extends StatelessWidget {
  const CallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ReusableAppBar(
        text: "Calls",
        isSearch: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spacerH(5),
                  Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xffdbf3d6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.videocam_outlined,
                          color: Colors.green,
                          size: 30,
                        ),
                        spacerW(15),
                        Flexible(
                          child: RichText(
                              text: TextSpan(
                                  text:
                                      "Get more done with calling\nSchedule meetings, call from desktop and share your screen. ",
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 15),
                                  children: [
                                TextSpan(
                                  text: "Learn more",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                )
                              ])),
                        ),
                        spacerW(2),
                        Icon(Icons.close,size: 23,color: Colors.black87,)
                      ],
                    ),
                  ),
                  spacerH(15),
                  Text(
                    "Favorites",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  spacerH(),
                  Row(children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                            child: Icon(
                          FontAwesomeIcons.solidHeart,
                          color: Colors.white,
                          size: 22,
                        )),
                      ),
                    ),
                    spacerW(),
                    Text(
                      "Add favorite",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )
                  ]),
                  spacerH(),
                  Text(
                    "Recent",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  spacerH(15),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      CallsInfo info = callsInfoList[index];
                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 2),
                        leading: CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(info.image),
                        ),
                        title: Text(
                          info.name,
                          style: TextStyle(
                              color: info.isMissed?Colors.red: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Row(
                          children: [
                            Icon(
                              info.isMissed?Icons.call_received :Icons.call_made,
                              color: info.isMissed?Colors.red: Colors.green,
                              size: 20,
                            ),
                            spacerW(5),
                            Text(
                              info.callsDetails,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            )

                          ],
                        ),
                        trailing: Icon(info.isVideoCall?  Icons.videocam_outlined :Icons.call_outlined,color: Colors.black ,size: 25,)
                      );
                    },
                    itemCount: callsInfoList.length,
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey.shade300,
            ),
            spacerH(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.lock_outline,size: 15,color: Colors.black54,),
                  spacerW(5),
                  RichText(text: TextSpan(text: "Your personal calls are ",
                  style: TextStyle(color: Colors.black54,fontSize: 15),
                  children: [
                    TextSpan(text: "end-to-end encrypted",style: TextStyle(color: AppColor.themeColor,fontWeight: FontWeight.bold))
                  ]))

                ],
              )
            ),
            spacerH(40),

          ],
        ),
      ),

      floatingActionButton: SizedBox(
        width: 60,
        height: 60, // Adjust height as needed
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          child: Icon(
            Icons.add_ic_call,
            color: Colors.white,
            size: 26,
          ),
        ),
      ),

    );
  }
}
