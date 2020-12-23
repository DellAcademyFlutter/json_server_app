import 'package:flutter/cupertino.dart';

/// Este metodo remove o focus de um widget.
removeFocus({BuildContext context}) {
  final currentFocus = FocusScope.of(context);

  // Remove o focus do widget atual
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}