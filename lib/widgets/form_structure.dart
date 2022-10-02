import 'package:flutter/material.dart';

class FormStructure extends StatelessWidget {
  const FormStructure(
      {Key? key, required this.formKey, required this.childrens})
      : super(key: key);
  final GlobalKey<FormState> formKey;
  final List<Widget> childrens;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _formatterList(childrens),
        ));
  }
}

List<Widget> _formatterList(List<Widget> childrens) {
  final List<Widget> fList = [];
  int index = 0;
  if (childrens.isNotEmpty) {
    for (var element in childrens) {
      fList.add(_adaptativeField(element));
      index++;
      if (childrens.length > index) {
        fList.add(const Spacer(flex: 1));
      }
    }
  }
  return fList;
}

Widget _adaptativeField(Widget field) {
  return Flexible(
    flex: 9,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: field,
    ),
  );
}
