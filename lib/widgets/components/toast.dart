import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';


void showToastErrorMatch() => Fluttertoast.showToast(
    msg: "Từ này bạn đã dùng trước đó",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 3,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0
);

void showToastError() => Fluttertoast.showToast(
    msg: "Từ này không đúng rồi",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 3,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0
);