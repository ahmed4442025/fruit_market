import 'package:flutter/material.dart';
import 'package:fruit_market/presentation/resources/color_manager.dart';

import '../../../all_styles.dart';

class Code6 extends StatelessWidget {
  final String text;

  Code6({Key? key, required this.text}) : super(key: key);

  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (int i = 0; i < 6; i++)
          oneCell(i < text.length ? text.substring(i, i + 1) : null)
      ],
    );
  }

  Widget oneCell(String? txt) =>
      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.amber, width: .3),
          borderRadius: BorderRadius.circular(10),
          // color: ColorManager.lightLightGreen,
        ),
        child: Center(
            child: Text(txt ?? '_',
                style: txt != null ? AllStyles
                    .text(_context)
                    .bodyLarge
                    ?.copyWith(fontSize: 22) : AllStyles
                    .text(_context)
                    .bodyLarge
                    ?.copyWith(fontSize: 18, color: ColorManager.lightGrey))

        ,

      )

  );
}
