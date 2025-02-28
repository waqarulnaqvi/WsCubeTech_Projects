import 'package:flutter/material.dart';
import 'package:whatsappclone/constants/static_images.dart';
import 'package:whatsappclone/core/theme/app_color.dart';
import 'package:whatsappclone/features/chats/presentation/widgets/text_field/reusable_text_field.dart';
import 'package:whatsappclone/shared/presentation/widget/app_bar/reusable_app_bar.dart';
import 'package:whatsappclone/shared/presentation/widget/global_widget.dart';

import '../../models/chats_info.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: ReusableAppBar(
          isChat: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ReusableTextField(controller: TextEditingController()),
            ),
            spacerH(15),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                var info = chatInfoList[index];

                return ListTile(
                  leading: Container(
                    width: 50, // ensures the container is square
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: index % 4 == 0
                          ? Border.all(
                              width: 2.0,
                              color: Colors.green,
                            )
                          : null,
                      image: DecorationImage(
                        image: NetworkImage(info.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(info.name),
                  subtitle: Text(
                    info.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: index < 3
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              info.time,
                              style: TextStyle(
                                  color: info.message != null
                                      ? Colors.green
                                      : Colors.grey),
                            ),
                            spacerH(6),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.notifications_off,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                spacerW(5),
                                Icon(
                                  Icons.push_pin,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                if(info.message != null)
                                spacerW(5),

                                if(info.message != null)
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.green,
                                  child: Center(child: Text(info.message!,style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),)),
                                )

                              ],
                            )
                          ],
                        )
                      : Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                          info.time,
                          style: TextStyle(
                              color: info.message != null
                                  ? Colors.green
                                  : Colors.grey),),
                      spacerH(5),
                      if(info.message != null)
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.green,
                          child: Center(child: Text(info.message!,style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),)),
                        )
                    ],
                  ),
                );
              },
              itemCount: chatInfoList.length,
            ))
          ],
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              elevation: 4,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(StaticImage.aiLogo),
                        fit: BoxFit.contain),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            spacerH(),
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: AppColor.lightThemeColor,
              foregroundColor: Colors.white,
              child: Icon(Icons.add),
            ),
          ],
        ));
  }
}
