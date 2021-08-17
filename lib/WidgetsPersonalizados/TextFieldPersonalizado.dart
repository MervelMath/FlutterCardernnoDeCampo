import 'package:flutter/material.dart';

class CampoDeTextoAddPage extends StatelessWidget {
  final String fieldName;
  final int fieldSize;
  final TextEditingController fieldController;
  const CampoDeTextoAddPage(
      this.fieldName, this.fieldController, this.fieldSize);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(40),
            ),
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
          ),
          labelText: fieldName,
          labelStyle: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 15, color: Colors.black),
        ),
        controller: fieldController,
        maxLength: fieldSize,
      ),
      SizedBox(
        height: 10,
      ),
    ]);
  }
}
