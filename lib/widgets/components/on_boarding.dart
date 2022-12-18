import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/data_onborad/onboard_data.dart';
import 'package:flutter_application_1/models/model_onboarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            height: size.height * 0.60,
            width: size.width,
          ),
          Column(
            children: [
              Text(
                model.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                model.subTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
          Text(
            model.counterText,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 80.0,
          )
        ],
      ),
    );
  }
}
