import 'package:firstuiassignment/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // double h=MediaQuery.of(context).size.height;
    // double w=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Spacer(),

        Expanded(
            flex: 2,
            child:  leftWidget()),
          Expanded(
            flex: 2,
            child: Image(image: AssetImage('assets/images/img1.png',),width: 300,
              height: 350,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget leftWidget()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: double.infinity,
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.only(bottom: 5),
              decoration: reusableDecoration(),
            child: Text(Constants.heading,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
            ),

        Container(
          width: double.infinity,
              margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
              padding: EdgeInsets.all(5),
              decoration: reusableDecoration(),
            child: Text(Constants.description,style: reusableTextStyle(),
            textAlign: TextAlign.center),
            ),

        Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: 15,right: 15,bottom: 25),
          padding: EdgeInsets.all(5),
          decoration: reusableDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  for(int i=0;i<5;i++)
                    Icon(Icons.star,color: Colors.grey,),
                ],
              ),

              Text('170 Reviews',style: reusableTextStyle(),)
            ],
          )
        ),

        Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
          padding: EdgeInsets.all(5),
          decoration: reusableDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             reusable(),
              reusable(
                icon: Icons.timer,
                text: 'COOK',
                time: '1 hr'
              ),
              reusable(
                icon: Icons.restaurant,
                text: 'FEEDS',
                time: '4-6'
              ),
            ],
          )
        ),
      ],
    );
  }

  Widget reusable({IconData icon=Icons.book_outlined,String text='PREP',String time='25 min'})
  {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,color: Colors.green,),
        Text(text,style: reusableTextStyle(),),
        const SizedBox(height: 5,),
        Text(time,style: reusableTextStyle(12),),
      ],
    );
  }
}



TextStyle reusableTextStyle([double fontSize=15]) => TextStyle(fontSize: fontSize,fontWeight: FontWeight.w300);

Decoration reusableDecoration(){
  return BoxDecoration(
    color: Colors.lightBlueAccent.shade100.withValues(alpha: 0.4),
    border: Border.all(color: Colors.black,
    width: 2),
  );
}
