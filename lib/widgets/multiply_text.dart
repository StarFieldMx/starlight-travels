import 'package:flutter/material.dart';
import 'package:starlight/models/flights.dart';
import 'package:starlight/styles/starlight_colors.dart';

class MultiplyText extends StatefulWidget {
  const MultiplyText({
    Key? key,
    required this.textList,
  }) : super(key: key);
  final List<dynamic> textList;

  @override
  State<MultiplyText> createState() => _MultiplyTextState();
}

class _MultiplyTextState extends State<MultiplyText> {
  List<Widget> widgets = [];
  List<dynamic> oldList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _createTexts(widget.textList));
  }

  List<Widget> _createTexts(List<dynamic> list) {
    if (widgets.isNotEmpty) {
      for (int i = 0; i < widgets.length; i++) {
        if (oldList[i] == "") {
          bool isArrive = oldList[i + 1] == "";
          widgets[i] = Row(
            children: [
              _icon(isArrive),
              _TextWithStyle(text: list[i]),
            ],
          );
        }
      }
      setState(() {});
      return widgets;
    }
    for (var e in list) {
      if (e is String) {
        widgets.add(_TextWithStyle(
          text: e,
        ));
      } else if (e is Airline) {
        widgets.add(Row(
          children: [
            Image.asset(
              'assets/logo.png',
              height: 40,
              width: 40,
              color: Colors.white,
            ),
            _TextWithStyle(text: e.name)
          ],
        ));
      } else if (e is Map<String, dynamic>) {
        widgets.add(Text(
          e["time"],
          style: const TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ));
      }
      // widgets.add(_spacer());
    }
    oldList = list;
    setState(() {});
    return widgets;
  }
}

class _TextWithStyle extends StatelessWidget {
  const _TextWithStyle({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, color: Colors.white),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

Widget _icon(bool isArrive) {
  return !isArrive
      ? Icon(Icons.flight_land_sharp, color: StarLightColors.starLight)
      : Icon(Icons.flight_takeoff_outlined, color: StarLightColors.starLight);
}
