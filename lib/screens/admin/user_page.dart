import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/theme_color/light_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_application_1/widgets/components/task_column.dart';
import 'package:flutter_application_1/widgets/components/active_project_card.dart';
import 'package:flutter_application_1/widgets/components/top_container.dart';
import 'package:flutter_application_1/screens/admin/card_info/languages_card.dart';
import 'package:flutter_application_1/screens/admin/card_info/memory_card.dart';
import 'package:flutter_application_1/screens/admin/card_info/math_card.dart';
import 'package:flutter_application_1/screens/admin/card_info/attention_card.dart';

class UserPage extends StatelessWidget {
  final User user;
  // late List<Person> person;

  const UserPage({
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

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kGreen,
      child: Icon(
        Icons.calendar_today,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  Future<void> _dialogBuilderTwo(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () async {
          // final back = await showMyDialog(context);
          return false;
        },
        child: Scaffold(
          body: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 50,
                right: 20,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:
                      const Text("Skip", style: TextStyle(color: Colors.grey)),
                ),
              ),
            ],
          ),
        ),
      ),
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
              height: 200,
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
                        new CircularPercentIndicator(
                          radius: 50.0,
                          lineWidth: 5.0,
                          animation: true,
                          animationDuration: 2000,
                          percent: 0.75,
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: LightColors.kRed,
                          backgroundColor: LightColors.kDarkYellow,
                          center: CircleAvatar(
                            backgroundColor: LightColors.kBlue,
                            radius: 35.0,
                            backgroundImage: NetworkImage(
                              user.urlImage,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text(
                                user.name,
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
                                user.dob,
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
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.alarm,
                            iconBackgroundColor: LightColors.kRed,
                            title: 'Số điện thoại:',
                            subtitle: user.sdt,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TaskColumn(
                            icon: Icons.blur_circular,
                            iconBackgroundColor: LightColors.kDarkYellow,
                            title: 'Email:',
                            subtitle: user.email,
                          ),
                          // SizedBox(height: 15.0),
                          // TaskColumn(
                          //   icon: Icons.check_circle_outline,
                          //   iconBackgroundColor: LightColors.kBlue,
                          //   title: 'Done',
                          //   subtitle: '18 tasks now. 13 started',
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          subheading('Trò chơi'),
                          SizedBox(height: 5.0),
                          Row(
                            children: <Widget>[
                              InkWell(
                                child: ActiveProjectsCard(
                                  cardColor: LightColors.kGreen,
                                  loadingPercent: 0.25,
                                  title: 'MEMORY',
                                  subtitle: '3 games',
                                ),
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MemoryCard(user: user),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20.0),
                              InkWell(
                                child: ActiveProjectsCard(
                                  cardColor: LightColors.kRed,
                                  loadingPercent: 0.6,
                                  title: 'ATTENTION',
                                  subtitle: '3 games',
                                ),
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AttentionCard(user: user),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              InkWell(
                                child: ActiveProjectsCard(
                                  cardColor: LightColors.kDarkYellow,
                                  loadingPercent: 0.48,
                                  title: 'LANGUAGE',
                                  subtitle: '4 games',
                                ),
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        LanguagesCard(user: user),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20.0),
                              InkWell(
                                child: ActiveProjectsCard(
                                  cardColor: LightColors.kBlue,
                                  loadingPercent: 0.9,
                                  title: 'MATH',
                                  subtitle: '2 games',
                                ),
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MathCard(user: user),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
