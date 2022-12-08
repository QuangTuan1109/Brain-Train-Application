import 'package:flutter/material.dart';

class Leader extends StatelessWidget {
  const Leader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('AppRoute.leaderboard');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 80,
              child: Stack(
                children: const [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/3629/3629625.png'),
                    radius: 25,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Thành Tích',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  'Xem điểm của bạn',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff767070)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
