import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/screens/admin/card_info/SizeConfig.dart';
import 'package:flutter_application_1/theme_color/light_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_application_1/widgets/components/top_container.dart';

class MathCard extends StatelessWidget {
  final User user;

  const MathCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: 100,
              width: width,
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_circle_left_outlined,
                              size: 50)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 0.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Math Game",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 22.0,
                                  color: LightColors.kDarkBlue,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "2 games",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 100.0),
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                _buildFruitCard(
                                    "Game 1",
                                    "Level cao nhất: ",
                                    "Level: ${user.level_Math1}",
                                    "Điểm: ${user.score_Math1}",
                                    0xffF7DFB9,
                                    0XffFAF0DA),
                                SizedBox(
                                  height: 2 * SizeConfig.heightMultiplier,
                                ),
                                GestureDetector(
                                  child: _buildFruitCard(" ", " ", " ", " ",
                                      0xffC4D4A3, 0XffE0E8CF),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: <Widget>[
                                const SizedBox(height: 30),
                                SizedBox(
                                  height: 2 * SizeConfig.heightMultiplier,
                                ),
                                _buildFruitCard(
                                    " ", " ", " ", " ", 0xffFFC498, 0XffFDDCC1),
                                SizedBox(
                                  height: 2 * SizeConfig.heightMultiplier,
                                ),
                                _buildFruitCard(
                                    "Game 2",
                                    "Level cao nhất: ",
                                    "Level: ${user.level_Math2}",
                                    "Điểm: ${user.score_Math2}",
                                    0xffF0AEAF,
                                    0XffF8C6CA),
                                SizedBox(
                                  height: 2 * SizeConfig.heightMultiplier,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildFruitCard(String name, String note, String title, String rate,
      int color, int color2) {
    return Container(
      width: 42.5 * SizeConfig.widthMultiplier,
      decoration: BoxDecoration(
        color: Color(color),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                  color: Color(color2),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.add,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 5.0),
            child: Text(
              name,
              style: TextStyle(
                  // fontFamily: 'OpenSans-Bold',
                  fontWeight: FontWeight.bold,
                  fontSize: 2.5 * SizeConfig.textMultiplier),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      rate,
                      style: TextStyle(
                          // fontFamily: 'OpenSans',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 2.5 * SizeConfig.textMultiplier),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              note,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 1.5 * SizeConfig.textMultiplier),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 1.5 * SizeConfig.textMultiplier),
            ),
          ),
          SizedBox(
            height: 2 * SizeConfig.heightMultiplier,
          )
        ],
      ),
    );
  }
}
