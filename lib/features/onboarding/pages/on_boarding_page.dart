import 'package:expense_app_bloc/core/constants/static_assets.dart';
import 'package:expense_app_bloc/core/theme/app_styles.dart';
import 'package:expense_app_bloc/features/authentication/pages/login_page.dart';
import 'package:expense_app_bloc/features/onboarding/data/onboarding_contents.dart';
import 'package:expense_app_bloc/shared/widget/global.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              section1(),
              spacerH(),
              section2(),
              spacerH(),
            ],
          ),
        ),
      ),
    );
  }

  Widget section1() {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          staticImage(StaticAssets.onboarding3, width: 20, height: 20),
          spacerW(5),
          Text(
            "Monety",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 2),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }


  Widget section2(){
    return Expanded(
      child: Stack(
        children: [
          PageView.builder(
              controller: pageController,
              itemCount: onboardingContents.length,
              onPageChanged: (int index) {
                currentIndex = index;
                setState(() {});
              },
              itemBuilder: (_, i) {

                var content = onboardingContents[i];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        staticImage(content.imagePath),
                        spacerH(),
                        Text(
                          content.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2),
                          textAlign: TextAlign.center,
                        ),
                        spacerH(),
                        Text(
                          content.description,
                          style: AppStyles.descriptionPrimary(
                              context: context, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                        spacerH(40),
                      ],
                    ),
                  ),
                );
              }),

          Positioned(
            left: 30,
            bottom: 40,
            child:                                 Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(onboardingContents.length, (index)=> Container(
                height: 11,
                width:  11,
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: currentIndex == index ? Colors.pink.shade200 : Colors.grey,
                ),
              )),

            ),),


          Positioned(
            bottom: 10,
            right: 10,
            child: IconButton(
                onPressed: () {
                  if(currentIndex == onboardingContents.length - 1) {
                    // Navigate to the next page or perform an action
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> LoginPage())); // Example route
                    return;
                  }
                  
                  // currentIndex = (currentIndex + 1).clamp(0, onboardingContents.length - 1);
                  setState(() {
                    currentIndex = (currentIndex + 1).clamp(0, onboardingContents.length - 1);
                    pageController.animateToPage(currentIndex,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn);
                  });
                },
                style: IconButton.styleFrom(
                  backgroundColor: Colors.pink.shade200,
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 30,
                )),
          )
        ],
      ),
    );
  }
}
