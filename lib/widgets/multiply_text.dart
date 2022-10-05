import 'package:flutter/material.dart';

class MultiplyText extends StatelessWidget {
  const MultiplyText({
    Key? key,
    required this.textList,
  }) : super(key: key);
  final List<String> textList;
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _createTexts(textList));
  }

  List<Widget> _createTexts(List<String> list) {
    return list
        .map(
          (e) => Text(
            e,
            style: const TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
        .toList();
  }
}
