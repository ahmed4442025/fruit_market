import 'package:flutter/material.dart';
import 'package:fruit_market/presentation/resources/all_styles.dart';
import 'package:fruit_market/presentation/resources/color_manager.dart';

class KeyboardNum extends StatelessWidget {
  final void Function(String value) onChange;
  final VoidCallback onSubmit;
  final int? max;

  KeyboardNum(
      {Key? key, required this.onChange, required this.onSubmit, this.max})
      : super(key: key);

  late BuildContext _context;
  String _text = '';
  final double _radius = 28;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return SizedBox(
      height: 300,
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          rowKeys([oneKey('1', ''), oneKey('2', 'ABC'), oneKey('3', 'DEF')]),
          rowKeys([oneKey('4', 'GHI'), oneKey('5', 'JKL'), oneKey('6', 'MNO')]),
          rowKeys(
              [oneKey('7', 'PQRS'), oneKey('8', 'TUV'), oneKey('9', 'WXYZ')]),
          rowKeys([removeKey(), oneKey('0', ''), submitKey()]),
        ],
      ),
    );
  }

  Widget oneKey(String num, String sub) => InkWell(
        splashColor: Colors.white,
        onTap: () => _onNumTap(num),
        child: CircleAvatar(
          radius: _radius,
          backgroundColor: const Color(0x23797979),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                num,
                style:
                    AllStyles.text(_context).bodyLarge?.copyWith(fontSize: 22),
              ),
              if (sub != '')
                Text(
                  sub,
                  style:
                      AllStyles.text(_context).bodySmall?.copyWith(height: 1),
                )
            ],
          ),
        ),
      );

  Widget rowKeys(List<Widget> children) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      );

  Widget removeKey() => InkWell(
        onTap: () => _onRemove(),
        onLongPress: () => _onRemoveAll(),
        child: CircleAvatar(
          backgroundColor: const Color(0x00797979),
          radius: _radius,
          child: const Icon(
            Icons.backspace,
            color: Color(0xcc111111),
            size: 28,
          ),
        ),
      );

  Widget submitKey() => InkWell(
        onTap: onSubmit,
        child: CircleAvatar(
          backgroundColor: const Color(0x00797979),
          radius: _radius,
          child: const Text(
            'OK',
            style: TextStyle(
                fontSize: 22,
                color: Color(0xcc111111),
                fontWeight: FontWeight.w500),
          ),
        ),
      );

// =========== voids ============
  void _onNumTap(String num) {
    if (max != null && _text.length < (max ?? 0)) return;
    _text += num;
    _onChange();
  }

  void _onRemove() {
    if (_text.isNotEmpty) {
      _text = _text.substring(0, _text.length - 1);
      _onChange();
    }
  }

  void _onRemoveAll() {
    _text = '';
    _onChange();
  }

  void _onChange() {
    onChange(_text);
  }
}
