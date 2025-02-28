import 'package:flutter/material.dart';
import 'package:whatsappclone/core/theme/app_color.dart';
import 'package:whatsappclone/features/updates/presentation/models/channels_info.dart';
import 'package:whatsappclone/features/updates/presentation/models/follow_channel.dart';
import 'package:whatsappclone/features/updates/presentation/models/status_info.dart';
import 'package:whatsappclone/shared/presentation/widget/app_bar/reusable_app_bar.dart';
import 'package:whatsappclone/shared/presentation/widget/global_widget.dart';
import '../../../../core/theme/app_styles.dart';

class UpdatesPage extends StatelessWidget {
  const UpdatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ReusableAppBar(
        text: "Updates",
        isSearch: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spacerH(40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Status",
                  style: AppStyles.headingPrimary(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
              spacerH(),
              SizedBox(
                height: 145,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    StatusInfo info = index == 0
                        ? statusInfoList[index]
                        : statusInfoList[index - 1];
                    return index == 0
                        ? Container(
                            width: 85,
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Method :1
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 42,
                                        height: 42,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                info.circularImage),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 5,
                                        right: 0,
                                        child: Container(
                                          width: 22,
                                          height: 22,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                          ),
                                          child: Center(
                                              child: Icon(Icons.add,
                                                  size: 15,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                //Method :2
                                // Container(
                                //   width: 50,
                                //   height: 50,
                                //   decoration: BoxDecoration(
                                //     shape: BoxShape.circle,
                                //   ),
                                //   child: Align(
                                //     alignment: Alignment.center,
                                //     child: Container(
                                //       width: 42,
                                //       height: 42,
                                //       decoration: BoxDecoration(
                                //         shape: BoxShape.circle,
                                //         image: DecorationImage(
                                //           image: NetworkImage(info.circularImage),
                                //           fit: BoxFit.cover,
                                //         ),
                                //       ),
                                //       child: Align(
                                //         alignment: Alignment.bottomRight,
                                //         child: Container(
                                //           width: 20,
                                //           height: 20,
                                //           decoration: BoxDecoration(
                                //             color: Colors.green,
                                //             shape: BoxShape.circle,
                                //             border: Border.all(color: Colors.white, width: 2),
                                //           ),
                                //           child: Center(
                                //             child: Icon(Icons.add, size: 15, color: Colors.white),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),

                                Text(
                                  "Add\nStatus",
                                  style: AppStyles.headingPrimary(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ))
                        : Container(
                            width: 85,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(info.image),
                                  fit: BoxFit.cover),
                            ),
                            child: Container(
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 42,
                                    height: 42,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.green,
                                          width: 2,
                                          strokeAlign:
                                              BorderSide.strokeAlignCenter),
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(info.circularImage),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Text(
                                    info.name,
                                    style: AppStyles.headingPrimary(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          );
                  },
                  itemCount: statusInfoList.length + 1,
                ),
              ),
              spacerH(40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Channels",
                      style: AppStyles.headingPrimary(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Explore   >",
                      style: AppStyles.headingPrimary(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.green),
                    ),
                  ],
                ),
              ),
              spacerH(),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var info = channelInfoList[index];

                  return ListTile(
                    leading: Container(
                      width: 50, // ensures the container is square
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(info.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      info.name,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      info.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: ((info.time != null && info.message != null))
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                info.time!,
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w700),
                              ),
                              spacerH(6),
                              Container(
                                width: 25,
                                height: 25,
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                    child: Text(
                                  info.message!,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                              )
                            ],
                          )
                        : info.time != null
                            ? Text(info.time!)
                            : null,
                  );
                },
                itemCount: channelInfoList.length,
              ),
              spacerH(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Find channels to follow",
                  style: AppStyles.headingPrimary(
                      fontSize: 15,
                      color: Colors.black54,
                      fontWeight: FontWeight.w900),
                ),
              ),
              spacerH(30),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var info = followChannelInfoList[index];

                  return ListTile(
                    leading: Container(
                      width: 50, // ensures the container is square
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(info.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Row(
                      children: [
                        Flexible(
                          child: Text(
                            info.name,
                            style:
                                TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Image(image: NetworkImage(info.blueTick),width: 28,height: 28,)
                      ],
                    ),
                    subtitle: Text(
                      info.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: SizedBox(
                      height: 38,
                      child: TextButton(onPressed: (){},
                          style :TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            backgroundColor: Color(0xffdbf3d6),
                          ),child: Text("Follow",style: TextStyle(color: AppColor.themeColor,fontWeight: FontWeight.w600,fontSize: 15),)),
                    ),
                  );
                },
                itemCount: followChannelInfoList.length,
              ),
              spacerH(),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                      side: BorderSide(color: Colors.grey.shade400, width: 1),
                    ),
                    child: Text(
                      "Explore more",
                      style: AppStyles.headingPrimary(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.green),
                    )),
              ),
              spacerH(120),
            ],
          ),
        ),
      ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 45,
              width: 45,
              child: FloatingActionButton(onPressed: (){},
                mini: true,
                backgroundColor: Colors.grey.shade200,
                child: Center(child: Icon(Icons.edit)),
              ),
            ),

            spacerH(),
            FloatingActionButton(onPressed: (){},
              backgroundColor: AppColor.lightThemeColor,
              foregroundColor: Colors.white,
              child: Icon(Icons.camera_alt_sharp),
            ),
          ],
        )
    );
  }
}
