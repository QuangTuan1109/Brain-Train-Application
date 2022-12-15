import 'package:flutter/material.dart';
import 'package:flutter_application_1/general/app_route.dart';
import 'package:flutter_application_1/provider/auth.dart';
import 'package:flutter_application_1/screens/setting/Divider_Custom.dart';
import 'package:flutter_application_1/screens/setting/Setting_Custom.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final auth = ref.watch(authProvider);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xE6FFCD4D)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.black,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 80),
                  child: Text(
                    'Cài đặt',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: ClipOval(
                        child: Image.network(auth.user.profilePicture)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          auth.user.name ?? '',
                          style: const TextStyle(
                              color: Color(0xfff3f3f3), fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          auth.user.email ?? '',
                          style: const TextStyle(
                              color: Color(0xff9B9898), fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  const CustomSetting(
                    title: 'Cài đặt chung',
                    icon: Icons.settings,
                    properti: 'Ngôn ngữ và cài đặt',
                    padding: 90,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomDivider(),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomSetting(
                      title: 'Bảo mật',
                      icon: Icons.privacy_tip_outlined,
                      properti: 'Cài đặt tài khoản mật khẩu',
                      padding: 30),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomDivider(),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomSetting(
                      title: 'Thông báo',
                      icon: Icons.notifications,
                      properti: 'Thông báo, cập nhật ',
                      padding: 80),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomDivider(),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomSetting(
                      title: 'Thông tin',
                      icon: Icons.info_outline,
                      properti: 'Thông tin về ứng dụng',
                      padding: 70),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomDivider(),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomSetting(
                      onTap: () async {
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(
                            context, RouteGenerator.signin);
                        await auth.logout();
                      },
                      title: 'Đăng xuất',
                      icon: Icons.logout_outlined,
                      properti: 'Đăng xuất ứng dụng',
                      padding: 90),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
