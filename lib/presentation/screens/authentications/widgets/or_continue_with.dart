import 'package:flutter/material.dart';

import '../../../../core/constants/strings.dart';

class OrContinueWith extends StatelessWidget {
  const OrContinueWith({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(height: 2,)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 20),
          child: Text(Strings.orContinueWith),
        ),
        Expanded(child: Divider(height: 2,)),
      ],
    );
  }
}