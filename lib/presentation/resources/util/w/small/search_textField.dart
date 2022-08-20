import 'package:flutter/material.dart';
import 'package:fruit_market/presentation/resources/color_manager.dart';
import 'package:fruit_market/presentation/resources/values_manager.dart';

class SearchTextField extends StatelessWidget {
  final double appBarHeight;

  const SearchTextField({Key? key, required this.appBarHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double scrW = MediaQuery.of(context).size.width;
    double searchTFWidth = scrW - 60;

    return Positioned(
      top: appBarHeight,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s10),
          boxShadow: const [
            BoxShadow(
                color: ColorManager.lightLightGrey,
                spreadRadius: 1,
                blurRadius: 20,
                offset: Offset(0, 3))
          ],
          color: Colors.white,
        ),
        width: searchTFWidth,
        child: const TextField(
          decoration: InputDecoration(
            // Border
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorManager.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorManager.transparent),
              ),

              // search icon
              prefixIcon: Icon(
                Icons.search,
                size: AppSize.s30,
              ),
              // hint help
              hintText: "Search",
              hintStyle: TextStyle(color: ColorManager.lightLightGrey)
              // todo
              ),
        ),
      ),
    );
  }
}
