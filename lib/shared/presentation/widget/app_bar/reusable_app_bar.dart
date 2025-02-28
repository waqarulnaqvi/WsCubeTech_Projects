import 'package:flutter/material.dart';
import '../../../../core/theme/app_styles.dart';
import '../global_widget.dart';

class ReusableAppBar extends StatelessWidget implements PreferredSizeWidget{
  final bool isChat;
  final String text;
  final bool isSearch;
  final bool isCommunities;
  const ReusableAppBar({super.key, this.isChat=false, this.text="Updates",this.isSearch=false, this.isCommunities=false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: isChat? Text("WhatsApp",style: AppStyles.headingPrimary(fontSize: 25),) :Text(text,style: AppStyles.headingPrimary(fontSize: 22,color: Colors.black.withAlpha(180)),),
      actions: [
        Icon(Icons.qr_code_scanner),
        if(!isCommunities)
        spacerW(10),
        if(!isCommunities)
        Icon(isSearch?Icons.search_rounded :Icons.camera_alt_outlined),
        spacerW(10),
        Icon(Icons.more_vert_outlined),
        spacerW(10),
      ],
    );
  }


  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}
