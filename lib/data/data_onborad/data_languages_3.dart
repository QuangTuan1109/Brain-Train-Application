import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/walkthrough/on_boarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:flutter_application_1/models/model_onboarding.dart';

import 'package:get/get.dart';

class OnBoardingLanguageThree extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: "assets/gif/game_languages_3-1.gif",
        title: "Đầu tiên nhấn vào ô trống 'Nhập từ'",
        subTitle: "bàn phím sẽ hiện lên ngày sau đó",
        counterText: "1/3",
        bgColor: Colors.white,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: "assets/gif/game_languages_3-2.gif",
        title: "Tiếp theo nhập từ vào ô trống",
        subTitle: "để tạo thành từ có nghĩa",
        counterText: "2/3",
        bgColor: Color(0xfffddcdf),
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: "assets/gif/game_languages_3-3.gif",
        title: "Sau khi đã nhập xong nhấn nút Gửi",
        subTitle: "và đợi Thông báo cộng điểm",
        counterText: "3/3",
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
