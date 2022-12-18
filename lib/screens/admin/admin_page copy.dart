import 'package:flutter/material.dart';
import 'package:animator/animator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/general/app_route.dart';
import 'package:flutter_application_1/provider/auth.dart';
import 'package:flutter_application_1/screens/home/leader.dart';
import 'package:flutter_application_1/screens/home/stack_custom.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/screens/admin/admin_page.dart';

class Homepage2 extends ConsumerWidget {
  const Homepage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final auth = ref.watch(authProvider);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: 900,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.white,
                Color(0xE6FFCD4D),
              ])),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xE6FFCD4D),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 21,
                            backgroundColor: const Color(0xff37EBBC),
                            child: CircleAvatar(
                              radius: 18,
                              backgroundImage: NetworkImage(
                                auth.user.profilePicture,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${auth.user.name}',
                            style: const TextStyle(
                              color: Color(0xff001663),
                            ),
                          ),
                          const SizedBox(width: 5),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('AppRoute.settings');
                      },
                      icon: const Icon(Icons.settings),
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              // const Padding(
              //   padding: EdgeInsets.only(top: 10),
              //   child: Text(
              //     'CHỌN TRÒ CHƠI',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //         color: Colors.black, fontSize: 25, letterSpacing: 1),
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              // SizedBox(
              //   width: double.infinity,
              //   height: 30,
              //   child: Animator<double>(
              //     duration: const Duration(milliseconds: 500),
              //     cycles: 0,
              //     curve: Curves.easeInOut,
              //     tween: Tween<double>(begin: 15.0, end: 20.0),
              //     builder: (context, animatorState, child) => Icon(
              //       Icons.keyboard_arrow_down,
              //       size: animatorState.value * 3.5,
              //       color: Colors.black,
              //     ),
              //   ),
              // ),
              // FilterLocalListPage(),
              Container(
                // Add the line below
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                // padding: const EdgeInsets.all(16),
                clipBehavior: Clip.hardEdge,
                height: size.height * 0.80,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 252, 252, 252),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                ),
                child: FilterLocalListPage(),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
