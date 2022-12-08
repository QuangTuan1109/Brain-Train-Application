import 'package:flutter/material.dart';

class DividerCustom extends StatelessWidget {
  const DividerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: const [
        Expanded(
            child: Divider(
          thickness: 3,
        )),
        SizedBox(width: 10),
        SizedBox(width: 10),
        Expanded(child: Divider(thickness: 3))
      ]),
    );
  }
}
