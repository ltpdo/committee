import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextForm extends StatefulWidget {
  final String? name;
  final Color? color;
  TextEditingController controller;

  TextForm({
    super.key,
    this.name,
    this.color,
    required this.controller,
  });

  @override
  State<StatefulWidget> createState() {
    return TextFormState();
  }
}

class TextFormState extends State<TextForm> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width / 1.2,
        height: size.height / 15,
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: size.width / 5,
              color: widget.color,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  widget.name!,
                  style: const TextStyle(fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              width: size.width / 15,
            ),
            Expanded(
                child: TextFormField(
              controller: widget.controller,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            )),
          ],
        ));
  }
}
