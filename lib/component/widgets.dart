// Copyright (c) 2023 Sendbird, Inc. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Widgets {
  static Text pageTitle(
    String title, {
    int? maxLines,
  }) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16.0),
      maxLines: maxLines ?? 1,
    );
  }

  static Widget imageNetwork(
    String? imageUrl,
    double height,
    IconData errorIcon,
  ) {
    if (imageUrl != null && imageUrl.isNotEmpty) {
      return Image.network(
        imageUrl,
        width: height,
        height: height,
        fit: BoxFit.fitHeight,
        errorBuilder: (context, error, stackTrace) {
          return Icon(errorIcon, size: height);
        },
      );
    } else {
      return Icon(errorIcon, size: height);
    }
  }

  static Widget textField(
    TextEditingController controller,
    String labelText, {
    int? maxLines,
    FocusNode? focusNode,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.purple),
        ),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.only(left: 24),
      ),
      maxLines: maxLines ?? 1,
      focusNode: focusNode,
    );
  }

  static Widget textFieldForNum({
    required TextEditingController controller,
    required String labelText,
    required Function(String) onChanged,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple),
        ),
        labelText: labelText,
        contentPadding: const EdgeInsets.all(8.0),
      ),
      onChanged: onChanged,
    );
  }
}

class StatusWidget extends StatelessWidget {
  final bool isOnline;

  StatusWidget({required this.isOnline});

  @override
  Widget build(BuildContext context) {
    Color circleColor;

    if (isOnline) {
      circleColor = Colors.blue;
    } else {
      circleColor = Colors.grey;
    }

    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: circleColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
