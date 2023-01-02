import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget scoreBoard(String title, String info) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 22),
      decoration: BoxDecoration(
        color: Color(0xfffcffe7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
          // Bảng trắng nhỏ 2 bên
          children: [
            AutoSizeText(
              title,
              maxLines: 1,
              // minFontSize: 20,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            AutoSizeText(
              info,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            )
          ]),
    ),
  );
}
