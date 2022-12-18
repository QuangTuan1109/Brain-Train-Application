import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/components/on_boarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:flutter_application_1/models/model_onboarding.dart';

import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: "assets/images/game_languages_1-1.gif",
        title: "Đầu tiên nhấn vào ô trống 'Nhập từ ở đây'",
        subTitle: "bàn phím sẽ hiện lên ngày sau đó",
        counterText: "1/3",
        bgColor: Colors.white,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: "assets/images/game_languages_1-2.gif",
        title: "Tiếp theo nhập từ với từ đầu tiên cho trước",
        subTitle: "Chú ý không gõ lại từ đầu tiên",
        counterText: "2/3",
        bgColor: Color(0xfffddcdf),
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: "assets/images//game_languages_1-3.gif",
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
