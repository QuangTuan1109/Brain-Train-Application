import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/walkthrough/on_boarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:flutter_application_1/models/model_onboarding.dart';

import 'package:get/get.dart';

class OnBoardingLanguageFour extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: "assets/gif/game_languages_4-1.gif",
        title: "Nhấn vào các ô chữ bên dưới",
        subTitle: "sau đó chữ sẽ hiện lên các ô ở trên",
        counterText: "1/6",
        bgColor: Colors.white,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: "assets/gif/game_languages_4-2.gif",
        title: "Nếu ấn sai có thể nhấn vào chữ bên trên",
        subTitle: "để chữ có thể trở về vị trí cũ",
        counterText: "2/6",
        bgColor: Color(0xfffddcdf),
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: "assets/gif/game_languages_4-3.gif",
        title: "Sau khi lấp đầy ô chữ,nếu sai các ô sẽ hiện màu đỏ",
        subTitle: "Có thể bấm vào biểu tượng 2 mũi tên để rest nhanh",
        counterText: "3/6",
        bgColor: Color(0xffffdcbd),
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: "assets/gif/game_languages_4-4.gif",
        title: "Nếu quá khó, có thể nhấn vào biểu tượng bóng đèn",
        subTitle: "các chữ cái được gợi ý sẽ có màu xanh",
        counterText: "4/6",
        bgColor: Colors.white,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: "assets/gif/game_languages_4-5.gif",
        title: "Sau khi hoàn thành đúng chữ cái",
        subTitle: "các ô sẽ hiện màu xanh và tự sang màn",
        counterText: "5/6",
        bgColor: Color(0xfffddcdf),
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: "assets/gif/game_languages_4-6.gif",
        title: "Nếu muốn chơi lại các câu trước",
        subTitle: "có thể bấm vào nút '<' để trở lại câu trước",
        counterText: "6/6",
        bgColor: Color(0xffffdcbd),
      ),
    ),
  ];

  skip() => controller.jumpToPage(page: 2);
  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }

  onPageChangedCallback(int activePageIndex) =>
      currentPage.value = activePageIndex;
}
