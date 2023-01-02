import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/theme_color/light_colors.dart';
import 'package:flutter_application_1/widgets/components/top_container.dart';
import 'package:flutter_application_1/screens/admin/card_info/SizeConfig.dart';

class LanguagesCard extends StatelessWidget {
  final User user;
  // late List<Person> person;

  const LanguagesCard({
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
                                "Language Game",
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
                                "4 games",
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
                                    "Danh sách từ:",
                                    "${user.list_Languages1}",
                                    "Điểm: ${user.score_Languages1}",
                                    0xffF7DFB9,
                                    0XffFAF0DA),
                                SizedBox(
                                  height: 2 * SizeConfig.heightMultiplier,
                                ),
                                GestureDetector(
                                  child: _buildFruitCard(
                                      "Game 2",
                                      "Danh sách từ:",
                                      "${user.list_Languages2}",
                                      "Điểm: ${user.score_Languages2}",
                                      0xffC4D4A3,
                                      0XffE0E8CF),
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
                                    "Game 3",
                                    "Danh sách từ:",
                                    "${user.list_Languages3}",
                                    "Điểm: ${user.score_Languages3}",
                                    0xffFFC498,
                                    0XffFDDCC1),
                                SizedBox(
                                  height: 2 * SizeConfig.heightMultiplier,
                                ),
                                _buildFruitCard(
                                    "Game 4",
                                    "",
                                    "",
                                    "Level: ${user.level_Languages4} ",
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
