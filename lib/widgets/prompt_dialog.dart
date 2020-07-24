import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromptDialog extends StatefulWidget {
  Function(String text) onChange;
  Function() onClose;

  PromptDialog({this.onChange, this.onClose});

  @override
  _PromptDialogState createState() => _PromptDialogState();
}

class _PromptDialogState extends State<PromptDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      content: Container(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.black),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Nombre de la lista',
              ),
              onChanged: widget.onChange,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancelar'),
        ),
        FlatButton(
          onPressed: () {
            widget.onClose();
            Get.back();
          },
          child: const Text('Guardar'),
        ),
      ],
    );
  }
}
