import 'package:flutter/material.dart';

class TextWithTextLink extends StatelessWidget {
  const TextWithTextLink({
    super.key,
    required this.text,
    required this.linkText,
    required this.callBack,
  });

  final String text;
  final String linkText;
  final Function(BuildContext ctx) callBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
          onTap: () => callBack(context),
          child: Text(linkText.toUpperCase(),              
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
