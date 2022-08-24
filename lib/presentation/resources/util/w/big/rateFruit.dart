import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../color_manager.dart';

class RateFruit extends StatelessWidget {
  final double rate;

  final bool active;

  const RateFruit({Key? key, required this.rate, required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // main rate
        RatingBar.builder(
          initialRating: rate,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: ColorManager.orange,
          ),
          onRatingUpdate: (rating) {
            // print(rating);
          },
          itemSize: 15,
        ),
        // disable
        if (!active)
          InkWell(
            onTap: null,
            child: Container(
              height: 15,
            ),
          )
      ],
    );
  }
}
