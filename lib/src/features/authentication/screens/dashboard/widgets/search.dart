import 'package:flutter/material.dart';
import 'package:_happytone/src/constants/text_strings.dart';

class SearchBoxWidget extends StatelessWidget {
  const SearchBoxWidget({
    Key? key,
    required this.txtTheme,
  }) : super(key: key);

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(left: BorderSide(width: 4)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          sDashboardSearch,
          style: txtTheme.headlineMedium
              ?.apply(color: Colors.grey.withOpacity(.5)),
        ),
        const Icon(
          Icons.mic,
          size: 20,
        )
      ]),
    );
  }
}
