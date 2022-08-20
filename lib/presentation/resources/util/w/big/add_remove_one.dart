import 'package:flutter/material.dart';
import '../../../color_manager.dart';
import '../../../values_manager.dart';


class AddOne extends StatefulWidget {
  final void Function(int value) onChange;
  const AddOne({Key? key, required this.onChange}) : super(key: key);

  @override
  State<AddOne> createState() => AddOneState();
}

class AddOneState extends State<AddOne> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s8),
              border: Border.all(color: ColorManager.black)),
          height: 30,
          width: 30,
          child: InkWell(
            onTap: ()=>addOrRemove(1),
            child: const Icon(Icons.add),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text("$count"),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s8),
              border: Border.all(color: ColorManager.black)),
          height: 30,
          width: 30,
          child: InkWell(
            onTap: ()=>addOrRemove(-1),
            child: const Icon(
              Icons.remove,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  void addOrRemove(int i){
    if (i < 0 && count <= 0) return;
    count += i;
    widget.onChange(count);
    setState(() {});
  }
}