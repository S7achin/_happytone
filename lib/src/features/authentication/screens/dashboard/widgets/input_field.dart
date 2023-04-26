import 'package:flutter/material.dart';

import '../../../../../services/theme_services.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyInputField({
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    var isDark = ThemeService().checkdark() == true;
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: txtTheme.titleLarge,
        ),
        Container(
          height: 52,
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.only(left: 14),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  readOnly: widget == null ? false : true,
                  autofocus: false,
                  cursorColor: isDark ? Colors.grey[100] : Colors.grey[700],
                  controller: controller,
                  style: txtTheme.titleMedium,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: txtTheme.titleSmall,
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(width: 0)),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(width: 0)),
                  ),
                ),
              ),
              widget == null
                  ? Container()
                  : Container(
                      child: widget,
                    )
            ],
          ),
        )
      ]),
    );
  }
}
