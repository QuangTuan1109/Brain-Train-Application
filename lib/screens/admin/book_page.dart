import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/book.dart';

class BookPage extends StatelessWidget {
  final Book book;

  const BookPage({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(book.title),
        ),
        body: ListView(
                        children: [
                         
                          ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 100 - 3,
                            itemBuilder: (BuildContext context, int index) {
                              int newIndex = index + 3;
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                          spreadRadius: 0,
                                          blurRadius: 4,
                                          color: Color.fromARGB(54, 0, 0, 0)),
                                    ]),
                                child: Row(
                                  children: [
                                    Text(
                                      '#${newIndex + 1}',
                                      style: const TextStyle(
                                        color: Color(0xff6948FE),
                                        fontSize: 23,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    ClipOval(
                                      child: Image.network(
                                        leaderboard[newIndex].profilePicture,
                                        width: 50,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Flexible(
                                      child: Text(
                                        leaderboard[newIndex].name ?? '',
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Color(0xff1F1147),
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Image.asset(
                                      'assets/images/award${leaderboard[newIndex].division}.png',
                                      width: 40,
                                    ),
                                    Text(
                                      leaderboard[newIndex].points.toString(),
                                      style: const TextStyle(
                                        color: Color(0xff1F1147),
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
      );

  // @override
  // Widget build(BuildContext context) {
  //   final leaderboardFuture = ref.watch(futureLeaderboardProvider);
  //   final leaderboard = ref.watch(leaderboardProvider);

  //   return SafeArea(
  //     child: Scaffold(
  //       backgroundColor: const Color(0xffF5F5F5),
  //       body: Column(
  //         children: [
  //           Container(
  //             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //             color: const Color(0xff1F1147),
  //             child: Row(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 IconButton(
  //                     onPressed: () {
  //                       Navigator.of(context).pop();
  //                     },
  //                     icon: const Icon(Icons.arrow_back_ios)),
  //                 const SizedBox(width: 10),
  //                 const Text(
  //                   'Leaderboard',
  //                   style: TextStyle(fontSize: 23),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           Expanded(
  //             child: leaderboardFuture.when(
  //                 data: (data) => ListView(
  //                       children: [
  //                         // Container(
  //                         //   padding: const EdgeInsets.fromLTRB(5, 40, 5, 20),
  //                         //   color: const Color(0xff1F1147),
  //                         //   // child: Row(
  //                         //   //   children: [
  //                         //   //     BoxLeaderBoard(
  //                         //   //       rank: 2,
  //                         //   //       image: leaderboard[2].profilePicture,
  //                         //   //       name: leaderboard[2].name ?? '',
  //                         //   //       points: leaderboard[2].points,
  //                         //   //       padding: 0,
  //                         //   //     ),
  //                         //   //     BoxLeaderBoard(
  //                         //   //       rank: 1,
  //                         //   //       image: leaderboard[1].profilePicture,
  //                         //   //       name: leaderboard[1].name ?? '',
  //                         //   //       points: leaderboard[1].points,
  //                         //   //       padding: 60,
  //                         //   //     ),
  //                         //   //     BoxLeaderBoard(
  //                         //   //       rank: 3,
  //                         //   //       image: leaderboard[3].profilePicture,
  //                         //   //       name: leaderboard[3].name ?? '',
  //                         //   //       points: leaderboard[3].points,
  //                         //   //       padding: 0,
  //                         //   //     ),
  //                         //   //   ],
  //                         //   // ),
  //                         // ),
  //                         ListView.builder(
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 10, vertical: 20),
  //                           shrinkWrap: true,
  //                           physics: const NeverScrollableScrollPhysics(),
  //                           itemCount: leaderboard.length - 3,
  //                           itemBuilder: (BuildContext context, int index) {
  //                             int newIndex = index + 3;
  //                             return Container(
  //                               margin: const EdgeInsets.symmetric(
  //                                   horizontal: 20, vertical: 10),
  //                               padding: const EdgeInsets.symmetric(
  //                                   horizontal: 15, vertical: 10),
  //                               decoration: BoxDecoration(
  //                                   borderRadius: BorderRadius.circular(10),
  //                                   color: Colors.white,
  //                                   boxShadow: const [
  //                                     BoxShadow(
  //                                         spreadRadius: 0,
  //                                         blurRadius: 4,
  //                                         color: Color.fromARGB(54, 0, 0, 0)),
  //                                   ]),
  //                               child: Row(
  //                                 children: [
  //                                   Text(
  //                                     '#${newIndex + 1}',
  //                                     style: const TextStyle(
  //                                       color: Color(0xff6948FE),
  //                                       fontSize: 23,
  //                                     ),
  //                                   ),
  //                                   const SizedBox(width: 10),
  //                                   ClipOval(
  //                                     child: Image.network(
  //                                       leaderboard[newIndex].profilePicture,
  //                                       width: 50,
  //                                     ),
  //                                   ),
  //                                   const SizedBox(width: 10),
  //                                   Flexible(
  //                                     child: Text(
  //                                       leaderboard[newIndex].name ?? '',
  //                                       overflow: TextOverflow.ellipsis,
  //                                       style: const TextStyle(
  //                                         color: Color(0xff1F1147),
  //                                         fontSize: 20,
  //                                       ),
  //                                     ),
  //                                   ),
  //                                   const Spacer(),
  //                                   Image.asset(
  //                                     'assets/images/award${leaderboard[newIndex].division}.png',
  //                                     width: 40,
  //                                   ),
  //                                   Text(
  //                                     leaderboard[newIndex].points.toString(),
  //                                     style: const TextStyle(
  //                                       color: Color(0xff1F1147),
  //                                       fontSize: 20,
  //                                     ),
  //                                   ),
  //                                 ],
  //                               ),
  //                             );
  //                           },
  //                         ),
  //                       ],
  //                     ),
  //                 error: (e, st) => Text(e.toString()),
  //                 loading: () =>
  //                     const Center(child: CircularProgressIndicator())),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
