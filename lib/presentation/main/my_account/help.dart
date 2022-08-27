import 'package:flutter/material.dart';
import 'package:fruit_market/presentation/resources/all_styles.dart';
import 'package:fruit_market/presentation/resources/util/util_manager.dart';
import 'package:fruit_market/presentation/resources/values_manager.dart';
import 'package:fruit_market/presentation/resources/views_sort_manager.dart';

class HelpView extends StatelessWidget {
  const HelpView({Key? key}) : super(key: key);

  final String p1 =
      "Lorem Ipsum is simply dummy text of the printing\nand typesetting industry. Lorem Ipsum has been\nthe industry’s standard dummy text ever since the\n1500s, when an unknown printer took a galley of\ntype and scrambled it to make a type specimen\nbook. It has survived not only five centuries, but\nalso the leap into electronic typesetting, remaining\nessentially unchanged. It was popularised in the\n1960s with the release of Letraset sheets containing\nLorem Ipsum passages, and more recently with\ndesktop publishing software like Aldus PageMaker\nincluding versions of Lorem Ipsum.";
  final String p2 =
      "Lorem Ipsum is simply dummy text of the printing\nand typesetting industry. Lorem Ipsum has been\nthe industry’s standard dummy text ever since the\n1500s, when an unknown printer took a galley of\ntype and scrambled it to make a type specimen\nbook. It has survived not only five centuries, but\nalso the leap into electronic typesetting, remaining\nessentially unchanged. It was popularised in the\n1960s with the release of Letraset sheets containing\nLorem Ipsum passages, and more recently with\ndesktop publishing software like Aldus PageMaker\nincluding versions of Lorem Ipsum.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UtilM.appBar(
        name: 'Help',
          onBack: () => ViewsManager.backIfUCan(context)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p20, vertical: AppPadding.p10),
          child: Text(
            p1 + p2,
            style: AllStyles.text(context).bodySmall,
          ),
        ),
      ),
    );
  }
}
