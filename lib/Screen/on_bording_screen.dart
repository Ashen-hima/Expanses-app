import 'package:expence_tracker/Screen/front_page.dart';
import 'package:expence_tracker/Screen/onbording/shared_onbordin_screnn.dart';
import 'package:expence_tracker/Screen/user_data_screean.dart';
import 'package:expence_tracker/constant/colors.dart';
import 'package:expence_tracker/data/onbording_data.dart';
import 'package:expence_tracker/widget/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  final PageController _Controller = PageController();
  bool showDetailsPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                //onbord scree
                PageView(
                  controller: _Controller,
                  onPageChanged: (index) {
                    setState(() {
                      showDetailsPage = index == 3;
                    });
                  },
                  children: [
                    FrontPage(),
                    SharedOnbordinScrenn(
                      tile: OnbordingData.onbordingDataList[0].title,
                      image: OnbordingData.onbordingDataList[0].imagePath,
                      des: OnbordingData.onbordingDataList[0].description,
                    ),

                    SharedOnbordinScrenn(
                      tile: OnbordingData.onbordingDataList[1].title,
                      image: OnbordingData.onbordingDataList[1].imagePath,
                      des: OnbordingData.onbordingDataList[1].description,
                    ),

                    SharedOnbordinScrenn(
                      tile: OnbordingData.onbordingDataList[2].title,
                      image: OnbordingData.onbordingDataList[2].imagePath,
                      des: OnbordingData.onbordingDataList[2].description,
                    ),
                  ],
                ),
                //page indicator
                Container(
                  alignment: Alignment(0, 0.55),
                  child: SmoothPageIndicator(
                    controller: _Controller,
                    count: 4,
                    effect: WormEffect(
                      activeDotColor: kMainColor,
                      dotColor: kLightGrey,
                    ),
                  ),
                ),

                // button
                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child:
                        !showDetailsPage
                            ? GestureDetector(
                              onTap: () {
                                _Controller.animateToPage(
                                  _Controller.page!.toInt() + 1,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                );
                              },

                              child: CustomButtom(
                                buttonName:
                                    showDetailsPage ? "Get starterd" : "Next",
                                buttonColor: kMainColor,
                              ),
                            )
                            : GestureDetector(
                              onTap: () {
                                //userdara
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UserDataScreean(),
                                  ),
                                );
                              },

                              child: CustomButtom(
                                buttonName:
                                    showDetailsPage ? "Get starterd" : "Next",
                                buttonColor: kMainColor,
                              ),
                            ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
