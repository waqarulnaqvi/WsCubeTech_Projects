import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight), child: Container(
      //   child: Container(
      //     padding: EdgeInsets.symmetric(horizontal: 20),
      //     decoration: BoxDecoration(
      //       color: Colors.white
      //     ),
      //     child: SafeArea(
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           CircleAvatar(
      //             backgroundColor: Colors.grey.withValues(alpha: 0.2),
      //             radius: 20,
      //             child: Icon(Icons.menu),
      //           ),
      //
      //           CircleAvatar(
      //             backgroundColor: Colors.grey.withValues(alpha: 0.2),
      //             radius: 20,
      //             child: Icon(Icons.notifications),
      //           ),
      //
      //
      //
      //         ],
      //       ),
      //     ),
      //   ),
      // )),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey.withValues(alpha: 0.2),
            radius: 20,
            child: Icon(Icons.menu),
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey.withValues(alpha: 0.2),
            radius: 20,
            child: Icon(Icons.notifications),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
